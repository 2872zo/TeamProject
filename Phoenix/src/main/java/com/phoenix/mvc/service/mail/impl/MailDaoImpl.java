package com.phoenix.mvc.service.mail.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Address;
import javax.mail.Flags;
import javax.mail.Header;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Mail;
import com.phoenix.mvc.service.mail.MailDao;
import com.sun.mail.util.BASE64DecoderStream;

@Repository
public class MailDaoImpl implements MailDao {
	
	@Value("${tmpUploadDir}")
	private String tmpUploadDir;
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	@Override
	public List<Mail> getMailList(Account account) throws Exception {
		IMAPAgent mailAgent = new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw());

		mailAgent.open();
		
		List<Mail> mailList = new ArrayList<Mail>();

		for (Message m : mailAgent.getMessage()) {
			Mail mail = new Mail();
			mail.setAccountNo(account.getAccountNo());
			
			System.out.println("MessageNumber : " + m.getMessageNumber());
			mail.setMailNo(m.getMessageNumber());
			System.out.println("Folder : " + m.getFolder().getFullName());
			mail.setFolder(m.getFolder());
			System.out.println("SentDate : " + m.getSentDate());
			mail.setSentDate(m.getSentDate());

			for (Address addr : m.getFrom()) {
				System.out.println("Address : " + MimeUtility.decodeText(addr.toString()));
				String fullAddr = MimeUtility.decodeText(addr.toString());

				if (fullAddr.contains("<")) {
					mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<") - 1));
					mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
				} else {
					mail.setSender(fullAddr);
				}
			}
			
			mail.setSeen(m.isSet(Flags.Flag.SEEN));

			// 제목
			System.out.println("Subject : " + m.getSubject());
			mail.setSubject(m.getSubject());

			mailList.add(mail);
			System.out.println(mail);
			System.out.println(
					"=======================================================================================================");
		}

		mailAgent.close();

		return mailList;
	}

	@Override
	public Map<String, Object> getMail(Account account, int mailNo) throws Exception{
		IMAPAgent mailAgent = new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw());

		mailAgent.open();

		Message message = mailAgent.getDefaultFolder().getMessage(mailNo);

		Mail mail = new Mail();
		mail.setAccountNo(account.getAccountNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("MessageNumber : " + message.getMessageNumber());
		mail.setMailNo(message.getMessageNumber());
		
		
		System.out.println("Folder : " + message.getFolder().getFullName());
		mail.setFolder(message.getFolder());
		System.out.println("SentDate : " + message.getSentDate());
		mail.setSentDate(message.getSentDate());

		for (Address addr : message.getFrom()) {
			String fullAddr = MimeUtility.decodeText(addr.toString());
			System.out.println("Address : " + fullAddr);
			mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<") - 1));
			mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
		}

		List<Map<String, String>> recipients = new ArrayList<Map<String, String>>();
		for (Address addr : message.getAllRecipients()) {
			String fullAddr = MimeUtility.decodeText(addr.toString());
			System.out.println("Address : " + fullAddr);

			Map<String, String> recipientMap = new HashMap<String, String>();
			System.out.println("fullAddr : " + fullAddr);
			if (!fullAddr.contains("<")) {
				recipientMap.put("recipient", fullAddr);
			} else {
				recipientMap.put("recipient", fullAddr.substring(0, fullAddr.indexOf("<") - 1));
				recipientMap.put("recipientAddr", fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
			}
			recipients.add(recipientMap);
		}
		mail.setRecipients(recipients);
		
		mail.setSeen(message.isSet(Flags.Flag.SEEN));

		// 제목
		System.out.println("Subject : " + message.getSubject());
		mail.setSubject(message.getSubject());

		// 전체 컨텐츠
		System.out.println("Content : " + message.getContent());
		mail.setContent(message.getContent().toString());

		if (!(message.getContent() instanceof String)) {
			List<Map<String, String>> fileList = printMessage(message, mail);
			map.put("fileList", fileList);
		}

		System.out.println(mail);

		mailAgent.close();

		map.put("mail", mail);

		return map;
	}

	// 파일을 제외한 모든 내용을 가져옴
	private List<Map<String, String>> printMessage(Message message, Mail mail) throws Exception {

		// 파일정보를 저장하는 리스트
		List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();

		Object content = message.getContent();

		MimeMultipart multiPart = null;
		// 메시지의 컨텐츠가 MultiPart가 아니고 본문인지 판별
		// 본문이아닌 MultiPart라면 분해하여 첨부파일을 저장하고 본문을 찾음
		if (content instanceof Multipart) {
			multiPart = (MimeMultipart) content;

			// 몇개의 Part로 구성되어있는지 확인
			int bodyCount = multiPart.getCount();

			// 디버깅을 위한 코드
			System.out.println("Multipart Count : " + multiPart.getCount());
			System.out.println("Body : ");

			// 각각의 Part가 무엇으로 이루어져있는지 판별하여 첨부파일은 저장하고 본문을 찾음
			for (int i = 0; i < bodyCount; i++) {
				MimeBodyPart bp = (MimeBodyPart) multiPart.getBodyPart(i);

				// 디버깅을 위한 코드
				System.out.println(i + "번째 MimeBodyPart.ContentType : " + bp.getContentType());

				// 현재 Part가 첨부파일이 아닌 본문인경우
				if (bp.getContentType().contains("TEXT/HTML")) {
					String body = (String) bp.getContent();
					System.out.println("BodyPart가 본문인 경우 : " + body);
					mail.setContent(body);
				}
				// 현재 Part가 본문이 아닌 경우 첨부파일인지 확인하기위해 파일이 형식확인
				else {
					Object obj = bp.getContent();

					if (obj instanceof BASE64DecoderStream || bp.getContentType().contains("TEXT/PLAIN")) {
						System.out.println("AttachMent Content!");
						if (bp.getFileName() == null) {
							System.out.println("파일 비어있음!");
							continue;
						}

						// 파일이름이 base64로 인코딩 되어있어 utf-8로 디코딩을 실행
						String body = MimeUtility.decodeText(bp.getFileName());
						// 중복제거를 위해 유니크 아이디 추가
						UUID uid = UUID.randomUUID();
						File file = new File(tmpUploadDir + "/" + uid + "_" + body);

						// 현재 Part의 정보를 파일에 저장
						bp.saveFile(file);

						// 디버깅을 위한 코드
						System.out.println("Content-Disposition : " + body);

						// 서버에 저장한 파일의 정보를 전달하기위해 리스트에 추가
						Map<String, String> fileContent = new HashMap<String, String>();
						fileContent.put("filePath", "/tmpfiles/" + uid + "_" + body);
						fileContent.put("fileName", body);
						fileList.add(fileContent);
					} else if (obj instanceof MimeMultipart) {
						String body = ((MimeMultipart) obj).getBodyPart(0).getContent().toString();

						System.out.println("multipart 본문 : " + body);

						mail.setContent(body);
					}
				}
			}
		} else {
			System.out.println(content);
		}

		return fileList;
	}

	@Override
	public boolean accountVaildationCheck(Account account) {
		boolean result = true;
		
		IMAPAgent mailAgent = new IMAPAgent("imap." + account.getAccountType().substring(1), account.getAccountId()+account.getAccountType(), account.getAccountPw());
		
		try {
			mailAgent.open();
		} catch (MessagingException | IOException e) {
			System.out.println("MailAccount Link Fail!");
			result = false;
		}finally {
			try {
				mailAgent.close();
			} catch (MessagingException e) {
				System.out.println("mailAgent Close Fail!");
			}
		}
		
		return result;
	}
}
