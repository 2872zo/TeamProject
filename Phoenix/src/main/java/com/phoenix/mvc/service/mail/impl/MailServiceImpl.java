package com.phoenix.mvc.service.mail.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Mail;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.Reply;
import com.phoenix.mvc.service.mail.MailDao;
import com.phoenix.mvc.service.mail.MailService;

@Service
@Transactional
public class MailServiceImpl implements MailService {

	@Autowired
	@Qualifier("mailDaoImpl")
	private MailDao	mailDao;
	
	public MailServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public List<Mail> getMailList(Search search) throws Exception {
		//유저 번호를 통해 연동한 계정정보 가져오는 도메인 필요 => 인터셉터에서 세션에 심어줄것
		return mailDao.getMailList(search);
	}

	@Override
	public Map<String, Object> getMail(int mailNo) throws Exception {
		return mailDao.getMail(mailNo);
	}

	@Override
	public boolean setSeenFlag(int mailNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean setSeenFlags(int[] mailNoArray) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean setUnSeenFlag(int mailNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean setUnSeenFlags(int[] mailNoArray) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMail(int mailNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMail(int[] mailNoArray) {
		// TODO Auto-generated method stub
		return false;
	}

}
