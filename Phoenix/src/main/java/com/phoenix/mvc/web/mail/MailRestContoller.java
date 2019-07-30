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
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Mail;
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
