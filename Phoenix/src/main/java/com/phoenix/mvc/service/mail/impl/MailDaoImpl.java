package com.phoenix.mvc.service.mail.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Address;
import javax.mail.Flags;
import javax.mail.Flags.Flag;
import javax.mail.Folder;
import javax.mail.Header;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.mail.search.FlagTerm;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Mail;
import com.phoenix.mvc.service.mail.MailAgent;
import com.phoenix.mvc.service.mail.MailDao;
import com.sun.mail.util.BASE64DecoderStream;

@Repository
public class MailDaoImpl implements MailDao {
	
	@Value("${tmpUploadDir}")
	private String tmpUploadDir;
	
	@Value("${uploadDir}")
	private String uploadDir;
	
	@Value("${mailPageSize}")
	private int mailPageSize;
	
	@Value("${mailPageUnit}")
	private int mailPageUnit;
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	@Override
	public Map<String, Object> getAllAccountMailList(List<Account> accountList, int currentPage) throws MessagingException, FileNotFoundException, IOException {
		
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		List<Mail> resultMailList = new ArrayList<Mail>();
		
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw()));
			map.put("account", account);
			map.put("idx", 1);
			
			mailAgentList.add(map);
		}

		//모든 메일 계정의 모든 메일 수를 더해서 총 개수를 구함
		int totalCount = 0;
		
		for(Map map : mailAgentList) {
			((IMAPAgent)map.get("mailAgent")).open();
			
			totalCount += ((IMAPAgent)map.get("mailAgent")).getMessageCount();
		}
		
		//paging을 위한 Search객체와 Page객체 생성
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(mailPageSize);
		Page page = new Page(currentPage, totalCount, mailPageUnit, mailPageSize);
		
		//실제 mailList 가져와서 저장
		for(int i = 1; i <= search.getEndRowNum(); i++) {
			Message recentMessage = null;
			int getMessageIdx = 0;
			
			for (int j = 0; j < mailAgentList.size(); j++) {
				Map map = mailAgentList.get(j);
				Message currentMessage = ((IMAPAgent) map.get("mailAgent")).getRecentMessage((int) map.get("idx"));

				if (recentMessage == null || recentMessage.getSentDate().compareTo(currentMessage.getSentDate()) < 0) {
					recentMessage = currentMessage;
					getMessageIdx = j;
				}
			}
			
			if(i >= search.getStartRowNum()) {
				System.out.println("mailNum : " + i);
				//저장할 mail 생성
				Mail mail = new Mail();
				mail.setAccountNo(((Account)mailAgentList.get(getMessageIdx).get("account")).getAccountNo());
				mail.setAccountDomain(((Account)mailAgentList.get(getMessageIdx).get("account")).getAccountDomain());
				
	 			//메일 번호 저장
				System.out.println("MessageNumber : " + recentMessage.getMessageNumber());
				mail.setMailNo(recentMessage.getMessageNumber());
				
				System.out.println("Folder : " + recentMessage.getFolder().getFullName());
				mail.setFolder(recentMessage.getFolder());
				System.out.println("SentDate : " + recentMessage.getSentDate());
				mail.setSentDate(recentMessage.getSentDate());
				
				mail.setSeen(recentMessage.isSet(Flags.Flag.SEEN));
	
				for (Address addr : recentMessage.getFrom()) {
					System.out.println("Address : " + MimeUtility.decodeText(addr.toString()));
					String fullAddr = MimeUtility.decodeText(addr.toString());
	
					if (fullAddr.contains("<")) {
						mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<") - 1));
						mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
					} else {
						mail.setSender(fullAddr);
					}
				}
				
				// 제목
				System.out.println("Subject : " + recentMessage.getSubject());
				mail.setSubject(recentMessage.getSubject());
	
				
				resultMailList.add(mail);
			}
			
			mailAgentList.get(getMessageIdx).put("idx", (int)mailAgentList.get(getMessageIdx).get("idx") + 1);
		}
		
		
		System.out.println(resultMailList);
			
		for(Map map : mailAgentList) {
			((IMAPAgent)map.get("mailAgent")).close();
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("mailList", resultMailList);
		returnMap.put("page", page);
		returnMap.put("search", search);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}

	@Override
	public Map<String, Object> getMailList(Account account, int currentPage) throws Exception {
		IMAPAgent mailAgent = new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw());

		mailAgent.open();
		
		int totalCount = mailAgent.getMessageCount();
		
		//paging을 위한 Search객체와 Page객체 생성
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(mailPageSize);
		Page page = new Page(currentPage, totalCount, mailPageUnit, mailPageSize);
		
		int startRowNum = totalCount - search.getEndRowNum() + 1;
		int endRowNum = totalCount - search.getStartRowNum() + 1;
		if(startRowNum < 1) {
			startRowNum = 1;
		}
		
		List<Mail> mailList = new ArrayList<Mail>();

		for (Message m : mailAgent.getMessages(startRowNum, endRowNum)) {
			Mail mail = new Mail();
			mail.setAccountNo(account.getAccountNo());
			mail.setAccountDomain(account.getAccountDomain());
			
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
			System.out.println("=======================================================================================================");
		}
		
		mailAgent.close();

		Collections.reverse(mailList);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("mailList", mailList);
		returnMap.put("page", page);
		returnMap.put("search", search);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}

	@Override
	public Map<String, Object> getMail(Account account, int mailNo) throws Exception{
		IMAPAgent mailAgent = new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw());

		mailAgent.open();

		Message message = mailAgent.getDefaultFolder().getMessage(mailNo);

		Map<String, Object> map = messageToMail(message, account.getAccountNo());

		mailAgent.close();

		return map;
	}

	@Override
	public boolean accountVaildationCheck(Account account) throws Exception {
		IMAPAgent mailAgent = new IMAPAgent("imap." + account.getAccountType().substring(1), account.getAccountId()+account.getAccountType(), account.getAccountPw());
		
		try {
			mailAgent.open();
		} catch (MessagingException | IOException e) {
			System.out.println("MailAccount Link Fail!");
//			System.out.println(e.getMessage());
			e.printStackTrace();
			if(e.getMessage().contains("404")) {
				throw new Exception("404");
			}else if(e.getMessage().contains("405")) {
				throw new Exception("405");
			}
			else if (e.getMessage().contains("not authorized for this service") || e.getMessage().contains("imap")) {
				throw new Exception("400");
			} else {
				throw new Exception("500");
			}
			
		}finally {
			try {
				mailAgent.close();
			} catch (MessagingException e) {
				System.out.println("mailAgent Close Fail!");
				e.printStackTrace();
			}
		}
		
		return true;
	}

	@Override
	public boolean sendGmail(Account account, Mail mail) throws MessagingException {
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", 465); 
		props.put("mail.smtp.starttls.enable", "true"); 
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true"); 
		
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(account.getAccountId(), account.getAccountPw());
	        }
	    });
		
		MimeMessageHelper message = new MimeMessageHelper(new MimeMessage(session), true, "UTF-8");
		
		message.setFrom(account.getAccountId());
		message.setTo(mail.getTo().split(","));
		message.setSubject(mail.getSubject());
		message.setText(mail.getContent(), true);
		
		if(mail.getAttachmentList() != null && mail.getAttachmentList().size() > 0) {
			for(Map<String, Object> map : mail.getAttachmentList()) {
				message.addAttachment((String)map.get("fileName"), (File)map.get("fileData"));
			}
		}
		
		if(mail.getInlineList() != null && mail.getInlineList().length() > 0) {
			for(String inlineFileName : mail.getInlineList().split(",")) {
				message.addInline(inlineFileName, new File(uploadDir + "/" + inlineFileName));
			}
		}
		
		Transport.send(message.getMimeMessage());
		
		
		return true;
	}

	@Override
	public boolean sendNaver(Account account, Mail mail) throws MessagingException {
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.naver.com"); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		props.put("mail.smtp.auth", "true"); 
		
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(account.getAccountId(), account.getAccountPw());
	        }
	    });
		
		MimeMessageHelper message = new MimeMessageHelper(new MimeMessage(session), true, "UTF-8");
		
		message.setFrom(account.getAccountId());
		message.setTo(mail.getTo().split(","));
		message.setSubject(mail.getSubject());
		message.setText(mail.getContent(), true);
		
		if(mail.getAttachmentList() != null && mail.getAttachmentList().size() > 0) {
			for(Map<String, Object> map : mail.getAttachmentList()) {
				message.addAttachment((String)map.get("fileName"), (File)map.get("fileData"));
			}
		}
		
		if(mail.getInlineList() != null && mail.getInlineList().length() > 0) {
			for(String inlineFileName : mail.getInlineList().split(",")) {
				message.addInline(inlineFileName, new File(uploadDir + "/" + inlineFileName));
			}
		}
		
		
		Transport.send(message.getMimeMessage());
		
		
		return true;
	}

	@Override
	public boolean sendDaum(Account account, Mail mail) throws MessagingException {
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.daum.net"); 
		props.put("mail.smtp.port", 465); 
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.auth", "true"); 
		
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(account.getAccountId(), account.getAccountPw());
	        }
	    });
		
		MimeMessageHelper message = new MimeMessageHelper(new MimeMessage(session), true, "UTF-8");
		
		message.setFrom(account.getAccountId());
		message.setTo(mail.getTo().split(","));
		message.setSubject(mail.getSubject());
		message.setText(mail.getContent(), true);
		
		if(mail.getAttachmentList() != null && mail.getAttachmentList().size() > 0) {
			for(Map<String, Object> map : mail.getAttachmentList()) {
				message.addAttachment((String)map.get("fileName"), (File)map.get("fileData"));
			}
		}
		
		if(mail.getInlineList() != null && mail.getInlineList().length() > 0) {
			for(String inlineFileName : mail.getInlineList().split(",")) {
				message.addInline(inlineFileName, new File(uploadDir + "/" + inlineFileName));
			}
		}
		
		Transport.send(message.getMimeMessage());
		
		
		return true;
	}

	@Override
	public Map<String, Object> getAllAccountSentMailList(List<Account> accountList, int currentPage) throws FileNotFoundException, MessagingException, IOException {
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		List<Mail> resultMailList = new ArrayList<Mail>();
		
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			String folderName = null; 
			
			if(account.getAccountDomain().contains("gmail")) {
				folderName = "[Gmail]/보낸편지함";
			}else {
				folderName = "Sent Messages";
			}
			
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw(), folderName));
			map.put("account", account);
			map.put("idx", 1);
			
			mailAgentList.add(map);
		}

		//모든 메일 계정의 모든 메일 수를 더해서 총 개수를 구함
		int totalCount = 0;
		
		
		for(Map map : mailAgentList) {
			((IMAPAgent)map.get("mailAgent")).openFolder();
			
			totalCount += ((IMAPAgent)map.get("mailAgent")).getMessageCount();
		}
		
		//paging을 위한 Search객체와 Page객체 생성
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(mailPageSize);
		Page page = new Page(currentPage, totalCount, mailPageUnit, mailPageSize);
		
		boolean exitOuterLoop = false;
		
		//실제 mailList 가져와서 저장
		for(int i = 1; i <= search.getEndRowNum(); i++) {
			Message recentMessage = null;
			int getMessageIdx = 0;
			
			for (int j = 0; j < mailAgentList.size(); j++) {
				Map map = mailAgentList.get(j);
				
				int folderSize = ((IMAPAgent) map.get("mailAgent")).getMessageCount();
				
				if(folderSize < (int) map.get("idx") + 1) {
					exitOuterLoop = true;
					break;
				}
				
				Message currentMessage = ((IMAPAgent) map.get("mailAgent")).getMessage(folderSize - (int) map.get("idx") + 1);

				if (recentMessage == null || recentMessage.getSentDate().compareTo(currentMessage.getSentDate()) < 0) {
					recentMessage = currentMessage;
					getMessageIdx = j;
				}
			}
			
			if(exitOuterLoop) {
				break;
			}
			
			if(i >= search.getStartRowNum()) {
				System.out.println("mailNum : " + i);
				
				//저장할 mail 생성
				Mail mail = new Mail();
				mail.setAccountNo(((Account)mailAgentList.get(getMessageIdx).get("account")).getAccountNo());
				mail.setAccountDomain(((Account)mailAgentList.get(getMessageIdx).get("account")).getAccountDomain());
				
	 			//메일 번호 저장
				System.out.println("MessageNumber : " + recentMessage.getMessageNumber());
				mail.setMailNo(recentMessage.getMessageNumber());
				
				System.out.println("Folder : " + recentMessage.getFolder().getFullName());
				mail.setFolder(recentMessage.getFolder());
				System.out.println("SentDate : " + recentMessage.getSentDate());
				mail.setSentDate(recentMessage.getSentDate());
				
				mail.setSeen(recentMessage.isSet(Flags.Flag.SEEN));
	
				for (Address addr : recentMessage.getFrom()) {
					System.out.println("Address : " + MimeUtility.decodeText(addr.toString()));
					String fullAddr = MimeUtility.decodeText(addr.toString());
	
					if (fullAddr.contains("<")) {
						mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<") - 1));
						mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
					} else {
						mail.setSender(fullAddr);
					}
				}
				
				// 제목
				System.out.println("Subject : " + recentMessage.getSubject());
				mail.setSubject(recentMessage.getSubject());
	
				
				resultMailList.add(mail);
			}
			
			mailAgentList.get(getMessageIdx).put("idx", (int)mailAgentList.get(getMessageIdx).get("idx") + 1);
		}
		
		System.out.println(resultMailList);
			
		for(Map map : mailAgentList) {
			((IMAPAgent)map.get("mailAgent")).close();
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("mailList", resultMailList);
		returnMap.put("page", page);
		returnMap.put("search", search);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}
	
	@Override
	public Map<String, Object> getAllAccountFlagMailList(List<Account> accountList, int currentPage) throws FileNotFoundException, MessagingException, IOException {
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		List<Mail> resultMailList = new ArrayList<Mail>();
		
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw()));
			map.put("account", account);
			map.put("idx", 1);
			
			mailAgentList.add(map);
		}

		//모든 메일 계정의 모든 메일 수를 더해서 총 개수를 구함
		int totalCount = 0;
		
		
		for(Map map : mailAgentList) {
			((IMAPAgent)map.get("mailAgent")).open();
			
			totalCount += ((IMAPAgent)map.get("mailAgent")).getDefaultFolder().search(new FlagTerm(new Flags(Flags.Flag.FLAGGED), true)).length;
		}
		
		//paging을 위한 Search객체와 Page객체 생성
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(mailPageSize);
		Page page = new Page(currentPage, totalCount, mailPageUnit, mailPageSize);
		
		//실제 mailList 가져와서 저장
		for(int i = 1; i <= search.getEndRowNum(); i++) {
			Message recentMessage = null;
			int getMessageIdx = 0;
			
			boolean exitOuterLoop = false;
			
			for (int j = 0; j < mailAgentList.size(); j++) {
				Map map = mailAgentList.get(j);
				
				int folderSize = ((IMAPAgent) map.get("mailAgent")).getDefaultFolder().search(new FlagTerm(new Flags(Flags.Flag.FLAGGED), true)).length;
				
				//총 개수보다 EndRowNum이 많을때 정지
				if(totalCount < i) {
					exitOuterLoop = true;
					break;
				}
				
				//계정의 폴더사이즈를 넘는지 체크해줌
				if(folderSize >= (int) map.get("idx")) {
					System.out.println("폴더사이즈 안넘음");
					Message currentMessage = ((IMAPAgent) map.get("mailAgent")).getFlagMessage(folderSize - (int) map.get("idx"));
					
					if (recentMessage == null || recentMessage.getSentDate().compareTo(currentMessage.getSentDate()) < 0) {
						recentMessage = currentMessage;
						getMessageIdx = j;
					}
				}else {
					System.out.println("사이즈 넘음");
				}
			}
			
			if(exitOuterLoop) {
				break;
			}
			
			if(i >= search.getStartRowNum()) {
				System.out.println("mailNum : " + i);
				//저장할 mail 생성
				Mail mail = new Mail();
				mail.setAccountNo(((Account)mailAgentList.get(getMessageIdx).get("account")).getAccountNo());
				mail.setAccountDomain(((Account)mailAgentList.get(getMessageIdx).get("account")).getAccountDomain());
				
	 			//메일 번호 저장
				System.out.println("MessageNumber : " + recentMessage.getMessageNumber());
				mail.setMailNo(recentMessage.getMessageNumber());
				
				System.out.println("Folder : " + recentMessage.getFolder().getFullName());
				mail.setFolder(recentMessage.getFolder());
				System.out.println("SentDate : " + recentMessage.getSentDate());
				mail.setSentDate(recentMessage.getSentDate());
				
				mail.setSeen(recentMessage.isSet(Flags.Flag.SEEN));
	
				for (Address addr : recentMessage.getFrom()) {
					System.out.println("Address : " + MimeUtility.decodeText(addr.toString()));
					String fullAddr = MimeUtility.decodeText(addr.toString());
	
					if (fullAddr.contains("<")) {
						mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<") - 1));
						mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
					} else {
						mail.setSender(fullAddr);
					}
				}
				
				// 제목
				System.out.println("Subject : " + recentMessage.getSubject());
				mail.setSubject(recentMessage.getSubject());
	
				
				resultMailList.add(mail);
			}
			
			mailAgentList.get(getMessageIdx).put("idx", (int)mailAgentList.get(getMessageIdx).get("idx") + 1);
		}
		
		System.out.println(resultMailList);
			
		for(Map map : mailAgentList) {
			((IMAPAgent)map.get("mailAgent")).close();
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("mailList", resultMailList);
		returnMap.put("page", page);
		returnMap.put("search", search);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}
	
	@Override
	public Map<String, Object> getAllAccountDeletedMailList(List<Account> accountList, int currentPage)	throws FileNotFoundException, MessagingException, IOException {
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		List<Mail> resultMailList = new ArrayList<Mail>();
		
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			String folderName = null; 
			
			if(account.getAccountDomain().contains("gmail")) {
				folderName = "[Gmail]/휴지통";
			}else {
				folderName = "Deleted Messages";
			}
			
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw(), folderName));
			map.put("account", account);
			map.put("idx", 1);
			
			mailAgentList.add(map);
		}

		//모든 메일 계정의 모든 메일 수를 더해서 총 개수를 구함
		int totalCount = 0;
		
		
		for(Map map : mailAgentList) {
			((IMAPAgent)map.get("mailAgent")).openFolder();
			
			totalCount += ((IMAPAgent)map.get("mailAgent")).getMessageCount();
		}
		
		System.out.println("TotalCount : " + totalCount);
		
		//paging을 위한 Search객체와 Page객체 생성
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(mailPageSize);
		Page page = new Page(currentPage, totalCount, mailPageUnit, mailPageSize);
		
		boolean exitOuterLoop = false;
		
		System.out.println("EndRowNum : " + search.getEndRowNum());
		
		//실제 mailList 가져와서 저장
		for(int i = 1; i <= search.getEndRowNum(); i++) {
			Message recentMessage = null;
			int getMessageIdx = 0;
			
			for (int j = 0; j < mailAgentList.size(); j++) {
				Map map = mailAgentList.get(j);
				
				int folderSize = ((IMAPAgent) map.get("mailAgent")).getMessageCount();
				
				if(folderSize < (int)map.get("idx")) {
					exitOuterLoop = true;
					break;
				}
				
				Message currentMessage = ((IMAPAgent) map.get("mailAgent")).getMessage(folderSize - (int) map.get("idx") + 1);

				if (recentMessage == null || recentMessage.getSentDate().compareTo(currentMessage.getSentDate()) < 0) {
					recentMessage = currentMessage;
					getMessageIdx = j;
				}
			}
			
			if(exitOuterLoop) {
				break;
			}
			
			if(i >= search.getStartRowNum()) {
				System.out.println("mailNum : " + i);
				
				//저장할 mail 생성
				Mail mail = new Mail();
				mail.setAccountNo(((Account)mailAgentList.get(getMessageIdx).get("account")).getAccountNo());
				mail.setAccountDomain(((Account)mailAgentList.get(getMessageIdx).get("account")).getAccountDomain());
				
	 			//메일 번호 저장
				System.out.println("MessageNumber : " + recentMessage.getMessageNumber());
				mail.setMailNo(recentMessage.getMessageNumber());
				
				System.out.println("Folder : " + recentMessage.getFolder().getFullName());
				mail.setFolder(recentMessage.getFolder());
				System.out.println("SentDate : " + recentMessage.getSentDate());
				mail.setSentDate(recentMessage.getSentDate());
				
				mail.setSeen(recentMessage.isSet(Flags.Flag.SEEN));
	
				for (Address addr : recentMessage.getFrom()) {
					System.out.println("Address : " + MimeUtility.decodeText(addr.toString()));
					String fullAddr = MimeUtility.decodeText(addr.toString());
	
					if (fullAddr.contains("<")) {
						mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<") - 1));
						mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
					} else {
						mail.setSender(fullAddr);
					}
				}
				
				// 제목
				System.out.println("Subject : " + recentMessage.getSubject());
				mail.setSubject(recentMessage.getSubject());
	
				
				resultMailList.add(mail);
			}
			
			mailAgentList.get(getMessageIdx).put("idx", (int)mailAgentList.get(getMessageIdx).get("idx") + 1);
		}
		
		System.out.println(resultMailList);
			
		for(Map map : mailAgentList) {
			((IMAPAgent)map.get("mailAgent")).close();
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("mailList", resultMailList);
		returnMap.put("page", page);
		returnMap.put("search", search);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}
	
	private Map<String, Object> messageToMail(Message message, int accountNo) throws IOException, Exception {
		Mail mail = new Mail();
		mail.setAccountNo(accountNo);
		
		mail.setFlag(message.isSet(Flag.FLAGGED));
		mail.setSeen((message.isSet(Flag.SEEN)));
		if(message.getFolder().getName().contains("휴지통") || message.getFolder().getName().contains("Deleted Message")) {
			mail.setTrash(true);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("MessageNumber : " + message.getMessageNumber());
		mail.setMailNo(message.getMessageNumber());
		
		
		System.out.println("Folder : " + message.getFolder().getFullName());
		mail.setFolder(message.getFolder());
		System.out.println("SentDate : " + message.getSentDate());
		mail.setSentDate(message.getSentDate());

		//보낸사람
		for (Address addr : message.getFrom()) {
			String fullAddr = MimeUtility.decodeText(addr.toString());
			System.out.println("Address : " + fullAddr);
			if (!fullAddr.contains("<")) {
				mail.setSender(fullAddr);
			} else {
				mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<") - 1));
				mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
			}
		}

		//받는사람
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

		if (!(message.getContent() instanceof String)) {
			List<Map<String, String>> fileList = printMessage(message, mail);
			map.put("fileList", fileList);
		}else {
			System.out.println("Content : " + message.getContent());
			mail.setContent(message.getContent().toString());
		}

		System.out.println(mail);
		
		if(mail.getContent() != null) {
			mail.setContent(mail.getContent().replaceAll("\n\r", "<br/>"));
		}
		
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
				if (bp.getContentType().toUpperCase().contains("TEXT/HTML")) {
					String body = (String) bp.getContent();
					System.out.println("BodyPart가 본문인 경우 : " + body);
					mail.setContent(body);
				}
				// 현재 Part가 본문이 아닌 경우 첨부파일인지 확인하기위해 파일이 형식확인
				else {
					Object obj = bp.getContent();

					if (obj instanceof BASE64DecoderStream || bp.getContentType().toUpperCase().contains("TEXT/PLAIN") || bp.getContentType().toUpperCase().contains("MESSAGE/RFC822") ) {
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
			System.out.println("multipart 아님!");
			mail.setContent((String) content);
		}

		return fileList;
	}

	
	@Override
	public boolean deleteMail(List<Map<String, Object>> mailInfoList, List<Account> accountList) throws FileNotFoundException, MessagingException, IOException {
		
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw()));
			map.put("account", account);
			((IMAPAgent)map.get("mailAgent")).open();
			
			mailAgentList.add(map);
		}
		
		for(Map mailInfo : mailInfoList) {
			IMAPAgent mailAgent = null;
			
			for(Map mailAgentMap : mailAgentList) {
				if( (int)((Account)mailAgentMap.get("account")).getAccountNo() == Integer.parseInt((String) mailInfo.get("accountNo")) ) {
					mailAgent = (IMAPAgent) mailAgentMap.get("mailAgent");
					break;
				}
			}
			
			if(mailAgent != null) {
				mailAgent.setDeleteMail(Integer.parseInt((String) mailInfo.get("mailNo")));
			}
		}
		
		
		return true;
	}

	@Override
	public boolean setSeenMail(List<Map<String, Object>> mailInfoList, List<Account> accountList) throws FileNotFoundException, MessagingException, IOException {
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw()));
			map.put("account", account);
			((IMAPAgent)map.get("mailAgent")).open();
			
			mailAgentList.add(map);
		}
		
		for(Map mailInfo : mailInfoList) {
			IMAPAgent mailAgent = null;
			
			for(Map mailAgentMap : mailAgentList) {
				if( (int)((Account)mailAgentMap.get("account")).getAccountNo() == Integer.parseInt((String) mailInfo.get("accountNo")) ) {
					mailAgent = (IMAPAgent) mailAgentMap.get("mailAgent");
					break;
				}
			}
			
			if(mailAgent != null) {
				mailAgent.setSeenMail(Integer.parseInt((String) mailInfo.get("mailNo")));
			}
		}
		
		return true;
	}

	@Override
	public boolean setUnSeenMail(List<Map<String, Object>> mailInfoList, List<Account> accountList) throws FileNotFoundException, MessagingException, IOException {
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw()));
			map.put("account", account);
			((IMAPAgent)map.get("mailAgent")).open();
			
			mailAgentList.add(map);
		}
		
		for(Map mailInfo : mailInfoList) {
			IMAPAgent mailAgent = null;
			
			for(Map mailAgentMap : mailAgentList) {
				if( (int)((Account)mailAgentMap.get("account")).getAccountNo() == Integer.parseInt((String) mailInfo.get("accountNo")) ) {
					mailAgent = (IMAPAgent) mailAgentMap.get("mailAgent");
					break;
				}
			}
			
			if(mailAgent != null) {
				mailAgent.setUnSeenMail(Integer.parseInt((String) mailInfo.get("mailNo")));
			}
		}
		
		return true;
	}

	@Override
	public boolean trashMail(List<Map<String, Object>> mailInfoList, List<Account> accountList)	throws FileNotFoundException, MessagingException, IOException {
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw()));
			map.put("account", account);
			((IMAPAgent)map.get("mailAgent")).open();
			
			mailAgentList.add(map);
		}
		
		for(Map mailInfo : mailInfoList) {
			IMAPAgent mailAgent = null;
			String dest = null;
			
			for(Map mailAgentMap : mailAgentList) {
				if( (int)((Account)mailAgentMap.get("account")).getAccountNo() == Integer.parseInt((String) mailInfo.get("accountNo")) ) {
					mailAgent = (IMAPAgent) mailAgentMap.get("mailAgent");
					
					if(((Account)mailAgentMap.get("account")).getAccountDomain().contains("gmail")) {
						dest = "[Gmail]/휴지통";
					} else {
						dest = "Deleted Messages";
					}
					
					break;
				}
			}
			
			if(mailAgent != null) {
				Message[] mailTarget = {mailAgent.getMessage(Integer.parseInt((String) mailInfo.get("mailNo")))};
				mailAgent.moveMessage(mailTarget, mailAgent.getFolder("inbox"), mailAgent.getFolder(dest)); 
			}
		}
		
		return false;
	}

	
	@Override
	public Map<String, Object> getBoxMailCount(List<Account> accountList) throws MessagingException, FileNotFoundException, IOException {
		List<Map<String, Object>> mailAgentList = new ArrayList<Map<String,Object>>();
		List<Mail> resultMailList = new ArrayList<Mail>();
		
		
		for(Account account : accountList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("mailAgent",new IMAPAgent("imap." + account.getAccountDomain(), account.getAccountId(), account.getAccountPw()));
			map.put("account", account);
			
			mailAgentList.add(map);
		}

		//모든 메일 계정의 모든 메일 수를 더해서 총 개수를 구함
		int inboxTotalCount = 0;
		int sentTotalCount = 0;
		int importantTotalCount = 0;
		int trashTotalCount = 0;
		
		for(Map map : mailAgentList) {
			if(((Account)map.get("account")).getAccountDomain().contains("gmail")){
				((IMAPAgent)map.get("mailAgent")).open();
				
				inboxTotalCount += ((IMAPAgent)map.get("mailAgent")).getFolder("inbox").getMessageCount();
				sentTotalCount += ((IMAPAgent)map.get("mailAgent")).getFolder("[Gmail]/보낸편지함").getMessageCount();
				importantTotalCount += ((IMAPAgent)map.get("mailAgent")).getDefaultFolder().search(new FlagTerm(new Flags(Flags.Flag.FLAGGED), true)).length;
				trashTotalCount += ((IMAPAgent)map.get("mailAgent")).getFolder("[Gmail]/휴지통").getMessageCount();
				
				((IMAPAgent)map.get("mailAgent")).close();
			} else {
				((IMAPAgent)map.get("mailAgent")).open();
				
				inboxTotalCount += ((IMAPAgent)map.get("mailAgent")).getFolder("inbox").getMessageCount();
				sentTotalCount += ((IMAPAgent)map.get("mailAgent")).getFolder("Sent Messages").getMessageCount();
				importantTotalCount += ((IMAPAgent)map.get("mailAgent")).getDefaultFolder().search(new FlagTerm(new Flags(Flags.Flag.FLAGGED), true)).length;
				trashTotalCount += ((IMAPAgent)map.get("mailAgent")).getFolder("Deleted Messages").getMessageCount();
				
				((IMAPAgent)map.get("mailAgent")).close();
			}
			
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("inboxTotalCount", inboxTotalCount);
		returnMap.put("sentTotalCount", sentTotalCount);
		returnMap.put("importantTotalCount", importantTotalCount);
		returnMap.put("trashTotalCount", trashTotalCount);
		
		return returnMap;
	}
}
