package com.phoenix.mvc.web.mail;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PreDestroy;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Mail;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.mail.MailService;
import com.phoenix.mvc.service.mail.impl.IMAPAgent;
import com.sun.mail.util.BASE64DecoderStream;

@RestController
@RequestMapping("/mail/json/")
public class MailRestContoller {
	@Autowired
	@Qualifier("mailServiceImpl")
	private MailService mailService;

	public MailRestContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping("addMailAccount")
	public int addMailAccount(@RequestBody Account account, HttpServletRequest req) {
		int result = 100;
		
		account.setUserNo(((User)req.getSession().getAttribute("user")).getUserNo());
		account.setAccountDomain(account.getAccountType().substring(1));
		
		System.out.println("[addMailAccount] account : " + account);
		
		try {
			mailService.addMailAccount(account);
		} catch (Exception e) {
			result = Integer.parseInt(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("setSeenMail")
	public boolean setSeenMail(@RequestBody List<Map<String, Object>> mailInfoList, HttpServletRequest req) throws FileNotFoundException, MessagingException, IOException {
		System.out.println(mailInfoList);
		System.out.println((List<Account>) req.getAttribute("accountList"));
		
		return mailService.setSeenMail(mailInfoList, (List<Account>) req.getAttribute("accountList") );
	}

	@RequestMapping("setUnSeenMail")
	public boolean setUnSeenMail(@RequestBody List<Map<String, Object>> mailInfoList, HttpServletRequest req) throws FileNotFoundException, MessagingException, IOException {
		System.out.println(mailInfoList);
		System.out.println((List<Account>) req.getAttribute("accountList"));
		
		return mailService.setUnSeenMail(mailInfoList, (List<Account>) req.getAttribute("accountList") );
	}
	
	@RequestMapping("setFlagMail")
	public boolean setFlagMail(@RequestBody List<Map<String, Object>> mailInfoList, HttpServletRequest req) throws FileNotFoundException, MessagingException, IOException {
		System.out.println(mailInfoList);
		System.out.println((List<Account>) req.getAttribute("accountList"));
		
		return mailService.setFlagMail(mailInfoList, (List<Account>) req.getAttribute("accountList") );
	}

	@RequestMapping("setUnFlagMail")
	public boolean setUnFlagMail(@RequestBody List<Map<String, Object>> mailInfoList, HttpServletRequest req) throws FileNotFoundException, MessagingException, IOException {
		System.out.println(mailInfoList);
		System.out.println((List<Account>) req.getAttribute("accountList"));
		
		return mailService.setUnFlagMail(mailInfoList, (List<Account>) req.getAttribute("accountList") );
	}
	
	@RequestMapping("trashMail")
	public boolean trashMail(@RequestBody List<Map<String, Object>> mailInfoList, HttpServletRequest req) throws FileNotFoundException, MessagingException, IOException {
		System.out.println(mailInfoList);
		System.out.println((List<Account>) req.getAttribute("accountList"));
		
		return mailService.trashMail(mailInfoList, (List<Account>) req.getAttribute("accountList") );
	}
	
	@RequestMapping("deleteMail")
	public boolean deleteMail(@RequestBody List<Map<String, Object>> mailInfoList, HttpServletRequest req) throws FileNotFoundException, MessagingException, IOException {
		System.out.println(mailInfoList);
		System.out.println((List<Account>) req.getAttribute("accountList"));
		
		return mailService.deleteMail(mailInfoList, (List<Account>) req.getAttribute("accountList") );
	}
	
	@RequestMapping("inboxMail")
	public boolean inboxMail(@RequestBody List<Map<String, Object>> mailInfoList, HttpServletRequest req) throws FileNotFoundException, MessagingException, IOException {
		System.out.println(mailInfoList);
		System.out.println((List<Account>) req.getAttribute("accountList"));
		
		return mailService.inboxMail(mailInfoList, (List<Account>) req.getAttribute("accountList") );
	}
}
