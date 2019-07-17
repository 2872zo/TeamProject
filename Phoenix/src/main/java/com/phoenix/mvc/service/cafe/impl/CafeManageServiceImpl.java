package com.phoenix.mvc.service.cafe.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.Cafe;

@Service("cafeManageServiceImpl")
public class CafeManageServiceImpl implements CafeManageService {

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;
	
	@Autowired
	@Qualifier("cafeMemberDaoImpl")
	private CafeMemberDao cafeMemberDao;

	public void setCafeManageDao(CafeManageDao cafeManageDao) {
		this.cafeManageDao = cafeManageDao;
	}

	public CafeManageServiceImpl() { // 생성자

		System.out.println(this.getClass().getName());
	}

/////////////////////////////////////////////////// 예림
/////////////////////////////////////////////////// 시작/////////////////////////////////
	@Override
	public List getCafeBoard(Search search) {

		int cafeNo = cafeManageDao.getCafeNo(search.getCafeURL());

		return cafeManageDao.getCafeBoard(search);
	}

	@Override
	public boolean checkCafePost(String cafeURL, int boardNo) { // false이면 게시글 없음, true 이면 게시글 존재

// cafeManageDao.getCafeNo(cafeURL); // 꼭 받아야하나? 그냥 post table에서만 체크하면 된다 안해도댐

		List postList = cafeManageDao.getBoardPost(boardNo); // boardNo에 해당하는 post list를 가져옴

		if (postList != null) {
			System.out.println(postList.size());

			if (postList.size() == 0) // 해당하는 게시판에 게시글이 없음
			{
				return false;
			} else // 게시글 있음.
			{
				return true;
			}
		} else {
			return false;
		}

	}

	@Override
	public Map<String, String> getCafeStatistics(Event event, String cafeURL) { // 예림예림 작업중

		int cafeNo = cafeManageDao.getCafeNo(cafeURL);

		event.setCafeNo(cafeNo); // cafeNo를 set
		Map<String, String> statisticsList = cafeManageDao.getCafeStatistics(event); // 모든 카페는 통계가 있다. count라서 0이더라도

		return statisticsList;
	}

	@Override
	public boolean addCafeBoard(List<Board> newBoard) { // 구분선이랑 자유게시판밖에 없음
		// TODO Auto-generated method stub

		int cafeNo = cafeManageDao.getCafeNo(newBoard.get(0).getCafeURL());
		for (int i = 0; i < newBoard.size(); i++) {
			
			newBoard.get(i).setCafeNo(cafeNo);
			
			if (newBoard.get(i).getBoardDetail() == null) // 구분선이면 디테일로 수정
			{
				newBoard.get(i).setBoardType("cb102");
				newBoard.get(i).setPrivateFlag('0');
				newBoard.get(i).setAccessGrade("10002");
				//newBoard.get(i).setBoardName("------------");
			} 
			else // 자유게시판이면
			{
				newBoard.get(i).setBoardType("cb103"); // 자유게시판
			}
		}

		boolean addCafeResult = cafeManageDao.addCafeBoard(newBoard);

		return addCafeResult;
	}

	@Override
	public boolean updateCafeBoard(List<Board> existBoardList) {
		int cafeNo = cafeManageDao.getCafeNo(existBoardList.get(0).getCafeURL());
		
		List<Board> dbBoardList = cafeManageDao.getCafeBoard(cafeNo);
		List<Board> deleteBoardList = new ArrayList<Board>();
		
		for (int i = 0; i < existBoardList.size(); i++) 
		{
	
			if(existBoardList.get(i).getBoardDetail()==null) // 구분선
			{
				//existBoardList.get(i).setBoardName("-------------"); //디테일로 수정
				existBoardList.get(i).setAccessGrade("10002");
				existBoardList.get(i).setPrivateFlag('0');
				existBoardList.get(i).setBoardType("cb102");
			}
			else if(existBoardList.get(i).getBoardName().contains("신고")) //근데 신고는 아예 고칠수 없게할거임
			{
				existBoardList.get(i).setBoardType("cb101");
			}
			else if(existBoardList.get(i).getBoardName().contains("공지"))
			{
				existBoardList.get(i).setBoardType("cb100");
			}
			else//자유게시판
			{
				existBoardList.get(i).setBoardType("cb104");
			}

		}
		
		System.out.println(existBoardList.size());
		System.out.println(dbBoardList.size());
		
		if(dbBoardList.size()!=existBoardList.size()) //삭제된게있으면
		{
			for(int i=0; i<dbBoardList.size(); i++) //이중포문 최선인가 ㅠ 디비 더큼
			{
				for(int j=0; j<existBoardList.size(); j++) // 받아온 게시판
				{
					if(dbBoardList.get(i).getBoardNo() == existBoardList.get(j).getBoardNo())//같으면
					{
						
						dbBoardList.remove(i);//삭제하고
						i--;
						break;
					}
				}
			}
			
			
			System.out.println(dbBoardList.size());
			deleteBoardList = dbBoardList; // 삭제할 deleteBoardList
			boolean deleteBoardResult = cafeManageDao.deleteCafeBoard(deleteBoardList);
			System.out.println(deleteBoardResult);
		}
		//deleteBoardList 삭제할애
		//existBoard  업데이트할애
		
		boolean updateBoardResult = cafeManageDao.updateCafeBoard(existBoardList);
		
		

		return updateBoardResult;
	}
	
	@Override
	public List getCafeGrade(String cafeURL) {
			
		int cafeNo = cafeManageDao.getCafeNo(cafeURL);
		List<CafeGrade> cafeUseGrade = cafeManageDao.getCafeGrade(cafeNo);
		
		return cafeUseGrade;
	}
	
	@Override
	public Cafe getCafeInfo(String cafeURL) throws Exception { //return map 해야할듯?? 없없
	
		int cafeNo = cafeManageDao.getCafeNo(cafeURL);
		
		return cafeManageDao.getCafeInfo(cafeNo);
	}
	
	@Override
	public List getCafeMemberAutocomplete(String cafeURL) throws Exception {
	
		int cafeNo = cafeManageDao.getCafeNo(cafeURL);

		Search search = new Search();
		search.setCafeNo(cafeNo);
		search.setPageSize(10);
		search.setCurrentPage(1);
		List<CafeMember> list = cafeMemberDao.getCafeMemberList(search);
		List<String> memberList = new ArrayList<String>(); 
		
		for(CafeMember member : list)
		{
			memberList.add(member.getMemberNickname());
		}
		
		return memberList;
	}


///////////////////////////////////////////////////예림끝//////////////////////////////////////////////

/////////////////////////////////지니//////////////////////////////
	@Override
	public Map<String, Object> getCafeApplicationList(Search search) {

		List<CafeApplication> list = cafeManageDao.getCafeApplicationList(search);
		int totalCount = cafeManageDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	public void updateAcceptStatusCode(CafeApplication cafeApplication) {

		cafeManageDao.updateAcceptStatusCode(cafeApplication);

	}

	@Override
	public CafeApplication getCafeApplication2(int applicationNo) {

		return cafeManageDao.getCafeApplication2(applicationNo);
	}

	@Override
	public List getCafeGrade(int cafeNo) {

		return cafeManageDao.getCafeGrade(cafeNo);
	}

	@Override
	public void addCafeGrade(CafeGrade cafeGrade) {

		cafeManageDao.addCafeGrade(cafeGrade);

	}

	@Override
	public void updateCafeGrade(CafeGrade cafeGrade) {

		cafeManageDao.updateCafeGrade(cafeGrade);

	}

	@Override
	public List checkCafeGrade(int cafeNo) {

		return cafeManageDao.checkCafeGrade(cafeNo);
	}
	
	@Override
	public int flagUpdate(CafeGrade cafeGrade) {
		
		return cafeManageDao.flagUpdate(cafeGrade);
	}

////////////////////////////////지니끝//////////////////////////////////

	/////////////////////////////// 준호시작///////////////////////////////////////
	@Override // 준호
	public void updateCafeInfo(Cafe cafe) throws Exception {
		cafeManageDao.updateCafeInfo(cafe);
	}

	@Override // 준호
	public void updateCafeApplicationForm(Cafe cafe) throws Exception {
		cafeManageDao.updateCafeApplicationForm(cafe);
	}

	@Override // 준호
	public Cafe getCafeInfo(int cafeNo) throws Exception {
		return cafeManageDao.getCafeInfo(cafeNo);
	}

	@Override // 준호
	public Cafe getCafeName(String cafeName) throws Exception {
		return cafeManageDao.getCafeName(cafeName);
	}

	
	

	/////////////////////////////// 준호끝///////////////////////////////////////

}
