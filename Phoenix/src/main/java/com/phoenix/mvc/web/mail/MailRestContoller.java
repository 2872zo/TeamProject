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
import javax.servlet.http.HttpServletRequest;

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
	@Value("${accountType.naver}")
	private String naverCode;
	
	@Value("${accountType.daum}")
	private String daumCode;
	
	@Value("${accountType.gmail}")
	private String gmailCode;
	
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
	
	@RequestMapping("deleteMailAccount")
	public boolean deleteMailAccount(@RequestBody Account account, HttpServletRequest req) {
		account.setUserNo(((User)req.getSession().getAttribute("user")).getUserNo());
		
		String accountType = null;
		
		if(account.getAccountType().contains("naver")) {
			accountType = naverCode;
		}else if(account.getAccountType().contains("daum")){
			accountType = daumCode;
		}else if(account.getAccountType().contains("gmail")){
			accountType = gmailCode;
		}
		
		if(accountType == null) {
			System.out.println("존재하지 않는 계정 유형");
			return false;
		}
		
		account.setAccountType(accountType);
		System.out.println("[addMailAccount] account : " + account);
		
		return mailService.deleteMailAccount(account);
	}
	
	@RequestMapping("setSeen")
	public boolean setSeen(@RequestParam int mailNo) {
		return false;
	}

	@RequestMapping("setSeens")
	public boolean setSeens(@RequestParam int[] mailNoArray) {
		return false;
	}
	
	@RequestMapping("setUnSeen")
	public boolean setUnSeen(@RequestParam int mailNo) {
		return false;
	}
	
	@RequestMapping("setUnSeens")
	public boolean setUnSeens(@RequestParam int[] mailNoArray) {
		return false;
	}
}
