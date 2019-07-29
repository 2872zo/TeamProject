package com.phoenix.mvc.web.mail;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PreDestroy;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.service.domain.Mail;
import com.sun.mail.util.BASE64DecoderStream;

@Controller
@RequestMapping("/mail/")
public class MailContoller {
	
	@Value("${tmpUploadDir}")
	private String tmpUploadDir;
	
	public MailContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping("getMailList")
	public String getMailList(Map<String, Object> map) throws Exception {
//      IMAPAgent mailagent = new IMAPAgent("IMAPSeverUrl", "port", "emailAddress", "password");
		IMAPAgent mailAgent = new IMAPAgent("imap.daum.net", "993", "2872zo@daum.net", "lkj6322*");

		mailAgent.open();
//      mailagent.createFolder("newFolder");  
//      Message[] msg = mailagent.getRecentMessages(5);  
//      for(Message m : msg) {  
//          System.out.println("subject: "+m.getSubject());  
//          System.out.println("MsgNum: "+m.getMessageNumber());  
//          System.out.println("UID: "+mailagent.getUID(m));  
//          System.out.println("Sent Date: "+m.getSentDate());  
////          mailagent.setUnSeenFlag(m);  
//      }  
//      mailagent.moveMessage(msg, mailagent.getDefaultFolder(), mailagent.getFolder("newFolder"));  

//      mailagent.getPersonalFolders();
//      mailagent.getSharedFolders();
//      mailagent.getUserFolders("newFolder");

//      System.out.println("Count : " + mailagent.getFolder("플스").getMessageCount());
//      Store store = mailagent.getStore();
//      
//      Folder[] f = store.getDefaultFolder().list(); 
//      for(Folder fd:f) 
//          System.out.println(">> "+fd.getName()); 

		Message[] messageList = mailAgent.getDefaultFolder().getMessages();

		List<Mail> mailList = new ArrayList<Mail>();

		for (Message m : messageList) {
			Mail mail = new Mail();
			System.out.println("MessageNumber : " + m.getMessageNumber());
			mail.setMailNo(m.getMessageNumber());
			System.out.println("Folder : " + m.getFolder().getFullName());
			mail.setFolder(m.getFolder());
			System.out.println("SentDate : " + m.getSentDate());
			mail.setSentDate(m.getSentDate());

			for (Address addr : m.getFrom()) {
				System.out.println("Address : " + MimeUtility.decodeText(addr.toString()));
				String fullAddr = MimeUtility.decodeText(addr.toString());
				mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<") - 1));
				mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
			}

			// 제목
			System.out.println("Subject : " + m.getSubject());
			mail.setSubject(m.getSubject());

			// 전체 컨텐츠
//    	  System.out.println("Content : " + m.getContent());

//    	  System.out.println(" : " + m.);

			mailList.add(mail);
			System.out.println(mail);
			System.out.println(
					"=======================================================================================================");
		}

		mailAgent.close();

		map.put("mailList", mailList);

		return "/mail/listMail";
	}

	@RequestMapping("getMail")
	public String getMail(Map<String, Object> map, @RequestParam int mailNo) throws Exception {
		IMAPAgent mailAgent = new IMAPAgent("imap.daum.net", "993", "2872zo@daum.net", "password");

		mailAgent.open();

		Message message = mailAgent.getDefaultFolder().getMessage(mailNo);

		Mail mail = new Mail();
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

		// 제목
		System.out.println("Subject : " + message.getSubject());
		mail.setSubject(message.getSubject());

		// 전체 컨텐츠
		System.out.println("Content : " + message.getContent());
		mail.setContent(message.getContent().toString());
		
		Map<String, Object> resultMap = printMessage(message);

		System.out.println(mail);

		mailAgent.close();

		map.put("mail", mail);
		map.put("resultMap", resultMap);
		return "/mail/getMail";
	}

//	mailAgent.open();  
//  mailagent.createFolder("newFolder");  
//  Message[] msg = mailagent.getRecentMessages(5);  
//  for(Message m : msg) {  
//      System.out.println("subject: "+m.getSubject());  
//      System.out.println("MsgNum: "+m.getMessageNumber());  
//      System.out.println("UID: "+mailagent.getUID(m));  
//      System.out.println("Sent Date: "+m.getSentDate());  
////      mailagent.setUnSeenFlag(m);  
//  }  
//  mailagent.moveMessage(msg, mailagent.getDefaultFolder(), mailagent.getFolder("newFolder"));  

//  mailagent.getPersonalFolders();
//  mailagent.getSharedFolders();
//  mailagent.getUserFolders("newFolder");

//  System.out.println("Count : " + mailagent.getFolder("플스").getMessageCount());
//  Store store = mailagent.getStore();
//  
//  Folder[] f = store.getDefaultFolder().list(); 
//  for(Folder fd:f) 
//      System.out.println(">> "+fd.getName()); 

//  Message[] messageList = mailAgent.getDefaultFolder().getMessages();
//  
//  List<Mail> mailList = new ArrayList<Mail>();
//  
//  for(Message m : messageList ) {
//	  Mail mail = new Mail();
//	  System.out.println("MessageNumber : " + m.getMessageNumber());
//	  mail.setMailNo(m.getMessageNumber());
//	  System.out.println("Folder : " + m.getFolder().getFullName());
//	  mail.setFolder(m.getFolder());
//	  System.out.println("SentDate : " + m.getSentDate());
//	  mail.setSentDate(m.getSentDate());
//	  
//	  for(Address addr : m.getFrom()) {
//		  System.out.println("Address : " + MimeUtility.decodeText(addr.toString()));
//		  String fullAddr = MimeUtility.decodeText(addr.toString());
//		  mail.setSender(fullAddr.substring(0, fullAddr.indexOf("<")-1));
//		  mail.setSenderAddr(fullAddr.substring(fullAddr.indexOf("<"), fullAddr.length()));
//	  }
//
//	  //제목
//	  System.out.println("Subject : " + m.getSubject());
//	  mail.setSubject(m.getSubject());
// 전체 컨텐츠
//	  System.out.println("Content : " + m.getContent());
	
	
	//파일을 제외한 모든 내용을 가져옴
	private Map<String, Object> printMessage(Message message) throws Exception {

		Map<String, Object> contentResultMap = new HashMap<String, Object>();
		List<Map<String, String>> fileList = new ArrayList<Map<String,String>>();
		
        Object content = message.getContent();

        MimeMultipart multiPart = null;

        if (content instanceof Multipart) {

            multiPart = (MimeMultipart)content;

            int bodyCount = multiPart.getCount();

            System.out.println("Multipart Count : " + multiPart.getCount());

            System.out.println("Body : ");

            for (int i = 0; i < bodyCount; i++) {
                MimeBodyPart bp = (MimeBodyPart) multiPart.getBodyPart(i);
                
                System.out.println(i + "번째 MimeBodyPart.ContentType : " + bp.getContentType());
                
                if(bp.getContentType().equals("text/html")) {
                	System.out.println();
                	String body = (String)bp.getContent(); 
                	
                	System.out.println("본문 : " + body);
                	
                	contentResultMap.put("mailContent", body);
	                     
                }else {
	                
	                
	                Object obj = bp.getContent();
	                
	                if (obj instanceof BASE64DecoderStream) {
	                	System.out.println("AttachMent Content!");
	                	
	                    String body = MimeUtility.decodeText(bp.getFileName());
	                    UUID uid = UUID.randomUUID();
	                    File file = new File(tmpUploadDir + "/" +  uid + "_" +body);
	                    
	                    bp.saveFile(file);
	                    
	                    System.out.println("Content-Disposition : " + body);
	                    Map<String, String> fileContent = new HashMap<String, String>();
	                    fileContent.put("filePath", "/tmpfiles/" + uid + "_" + body);
	                    fileContent.put("fileName", body);
	                    
	                    fileList.add(fileContent);
	                } else if(obj instanceof MimeMultipart) {
	                	String body = ((MimeMultipart)obj).getBodyPart(0).getContent().toString(); 
	                	
	                	System.out.println("multipart 본문 : " + body);
	                	
	                	contentResultMap.put("mailContent", body);
	                } 
                }
            }
        } else {
            System.out.println(content);
        }
        
        contentResultMap.put("fileList", fileList);
        
        return contentResultMap;
    }
	
	@PreDestroy
    public void onDestroy() throws Exception {
        System.out.println("Spring Container is destroyed!");
        
        File[] deleteFolderList = new File(tmpUploadDir).listFiles();
       
		for (int i = 0; i < deleteFolderList.length; i++) {
			deleteFolderList[i].delete();
        }
        
    }
}
