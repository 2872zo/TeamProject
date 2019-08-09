package com.phoenix.mvc.service.sns;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;

public interface SnsDao {

	public Account addSnsAccount(Account account);

	public List getSnsAccount(int userNo);

	public boolean deleteSnsAccount(Account account);

	public Account fbLogIn(Account account);

	public Account igLogIn(Account account) throws InterruptedException;

	public Map<String, Object> getFaceBookTimeLineList(Search search) throws InterruptedException;

	public Map<String, Object> getInstaTimeLineList(Search search) throws InterruptedException;

}
