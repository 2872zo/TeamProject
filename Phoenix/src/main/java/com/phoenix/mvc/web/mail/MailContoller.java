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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Mail;
import com.phoenix.mvc.service.mail.MailService;
import com.phoenix.mvc.service.mail.impl.IMAPAgent;
import com.sun.mail.util.BASE64DecoderStream;

@Controller
@RequestMapping("/mail/")
public class MailContoller {
	@Value("${tmpUploadDir}")
	private String tmpUploadDir;
	
	@Autowired
	@Qualifier("mailServiceImpl")
	private MailService mailService;
	
	public MailContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping("getMailList")
	public String getMailList(@ModelAttribute Search search, Map<String, Object> map) throws Exception {
		
		map.put("mailList", mailService.getMailList(search));
		
		return "/mail/listMail";
	}

	@RequestMapping("getMail")
	public String getMail(Map<String, Object> map, @RequestParam int mailNo) throws Exception {
		Map<String, Object> resultMap = mailService.getMail(mailNo);
		
		map.put("mail", resultMap.get("mail"));
		map.put("fileList", resultMap.get("fileList"));
		
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
	
	
	
	
	@PreDestroy
    public void onDestroy() throws Exception {
        System.out.println("Spring Container is destroyed!");
        
        File[] deleteFolderList = new File(tmpUploadDir).listFiles();
       
		for (int i = 0; i < deleteFolderList.length; i++) {
			deleteFolderList[i].delete();
        }
        
    }
}
