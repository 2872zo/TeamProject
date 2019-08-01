package com.phoenix.mvc.web.mail;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PreDestroy;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Mail;
import com.phoenix.mvc.service.mail.MailService;

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
	public String getMailList(Map<String, Object> map, HttpServletRequest req, 
			@RequestParam(required = false, defaultValue = "0") int accountNo, @RequestParam(required = false, defaultValue = "1") int currentPage) throws Exception {
		
		Map<String, Object> returnMap = null;
		List<Account> accountList = (List<Account>)req.getAttribute("accountList");
		List<Mail> mailList = new ArrayList<Mail>();
		
		
		
		if(accountNo == 0) {
			returnMap = mailService.getAllAccountMailList(accountList, currentPage);
		}else {
			Account selectedAccount = null;
			for(Account account : accountList) {
				if(account.getAccountNo() == accountNo) {
					selectedAccount = account;
					break;
				}
			}
			
			returnMap = mailService.getMailList(selectedAccount, currentPage);
		}
		
		map.put("mailList", returnMap.get("mailList"));
		map.put("search", returnMap.get("search"));
		map.put("page", returnMap.get("page"));
		map.put("currentPage", currentPage);
		map.put("accountNo", accountNo);
		
		return "/mail/listMail";
	}

	@RequestMapping("getMail")
	public String getMail(Map<String, Object> map, @RequestParam int mailNo, @RequestParam int accountNo, HttpServletRequest req) throws Exception {
		List<Account> accountList = (List<Account>)req.getAttribute("accountList");
		
		Account account = null;
		
		for(Account ac : accountList) {
			if(ac.getAccountNo() == accountNo) {
				account = ac;
				break;
			}
		}
		
		Map<String, Object> resultMap = mailService.getMail(account, mailNo);
		
		map.put("mail", resultMap.get("mail"));
		map.put("fileList", resultMap.get("fileList"));
		
		return "/mail/getMail";
	}
	
	@RequestMapping("moveMail")
	public String moveMail(@ModelAttribute Search search) {
		
		
		return "/mail/getMailList";
	}
	
	
	@GetMapping("sendMail")
	public String sendMailView() throws MessagingException {
		return "/mail/sendMail";
	}
	
	
	@PostMapping("sendMail")
	public String sendMail(HttpServletRequest req, @RequestParam int accountNo, @ModelAttribute Mail mail, @RequestParam MultipartFile[] files, @RequestParam String inlineList, Map<String, Object> map) throws MessagingException {
		List<Account> accountList = (List<Account>)req.getAttribute("accountList");
		
		Account account = null;
		
		for(Account ac : accountList) {
			if(ac.getAccountNo() == accountNo) {
				account = ac;
				break;
			}
		}
		
		List<Map<String, Object>> attachmentList = null;
		
		if(files.length > 0 && !files[0].getOriginalFilename().equals("")) {
			for (MultipartFile file : files) {
				attachmentList = new ArrayList<Map<String,Object>>();
				String fileName = file.getOriginalFilename();
				Map<String, Object> fileMap = new HashMap<String, Object>();
				
				try {
					UUID uid = UUID.randomUUID();
					fileMap.put("fileName", fileName);
					
					fileName = uid + fileName;
					File fileTo = new File(tmpUploadDir + "/" + fileName);
					file.transferTo(fileTo);
					
					fileMap.put("fileData", fileTo);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				attachmentList.add(fileMap);
				System.out.println("파일 추가딤!");
			}
		}
		
		mail.setContent(mail.getContent().replaceAll("/images/uploadfiles/", "cid:"));
		
		
		mail.setAttachmentList(attachmentList);
		
		System.out.println("account : " + account);
		System.out.println("mail : " + mail);
		
		
		mailService.sendMail(account, mail);
		
		map.put("account", account);
		
		return "/mail/confirmSendMail";
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
	
	@RequestMapping("modalTest")
	public String modalTest() {
		return "/common/accountModal";
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
