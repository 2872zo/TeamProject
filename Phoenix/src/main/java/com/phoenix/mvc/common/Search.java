package com.phoenix.mvc.common;

public class Search{
	///Field
	private int userNo;
	private int memberNo;

	private int memberGrade;

	private int cafeNo;
	private String cafeURL;
	private int cafeType;
	
	private int boardNo;
	private String boardName;
	private int postNo;
	private int replyNo;

	private int status;
	private int sortCode;

	private String searchCondition;
	private String searchKeyword;
	private int currentPage;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	private String termStart;
	private String termEnd;
	
	private int targetUserNo;
	private int chatNo;
	private int chatRoomNo;
	private int friendStatus;
	
	//---------------------------explore 추가
	private boolean engineAll;
	private boolean engineNaver;
	private boolean engineDaum;
	private boolean engineGoogle;
	
	private int orderState; //정렬종류 0:정확도 1:시간
	private String orderStateSort; // API method에 넣을 String
	private int searchTheme; //검색 종류 //0:통합 1:블로그  2:카페 3:웹 4:이미지
	private String searchThemeSort; // searchThemeType에 따라 담길 string
	private String filter;// naverImageAPI 에서만 사용하는 검색조건
	
	private int searchEngine; //dao API method에서 사용할애 어떤 engine인지 0:다음, 1:네이버, 2:구글
	//-----------------------------
	
	///Constructor
	public Search() {
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}

	public String getCafeURL() {
		return cafeURL;
	}

	public void setCafeURL(String cafeURL) {
		this.cafeURL = cafeURL;
	}

	public int getCafeType() {
		return cafeType;
	}

	public void setCafeType(int cafeType) {
		this.cafeType = cafeType;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	//==> Select Query 시 ROWNUM 마지막 값 
	public int getEndRowNum() {
		return getCurrentPage() * getPageSize();
	}

	// ==> Select Query 시 ROWNUM 시작 값
	public int getStartRowNum() {
		return (getCurrentPage() - 1) * getPageSize() + 1;
	}

	public int getSortCode() {
		return sortCode;
	}

	public void setSortCode(int sortCode) {
		this.sortCode = sortCode;
	}

	public String getTermStart() {
		return termStart;
	}

	public void setTermStart(String termStart) {
		this.termStart = termStart;
	}

	public String getTermEnd() {
		return termEnd;
	}

	public void setTermEnd(String termEnd) {
		this.termEnd = termEnd;
	}

	public int getTargetUserNo() {
		return targetUserNo;
	}

	public void setTargetUserNo(int targetUserNo) {
		this.targetUserNo = targetUserNo;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public int getFriendStatus() {
		return friendStatus;
	}

	public void setFriendStatus(int friendStatus) {
		this.friendStatus = friendStatus;
	}

	public boolean isEngineAll() {
		return engineAll;
	}

	public void setEngineAll(boolean engineAll) {
		this.engineAll = engineAll;
	}

	public boolean isEngineNaver() {
		return engineNaver;
	}

	public void setEngineNaver(boolean engineNaver) {
		this.engineNaver = engineNaver;
	}

	public boolean isEngineDaum() {
		return engineDaum;
	}

	public void setEngineDaum(boolean engineDaum) {
		this.engineDaum = engineDaum;
	}

	public boolean isEngineGoogle() {
		return engineGoogle;
	}

	public void setEngineGoogle(boolean engineGoogle) {
		this.engineGoogle = engineGoogle;
	}

	public int getOrderState() {
		return orderState;
	}

	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}

	public String getSearchThemeSort() {
		return searchThemeSort;
	}

	public void setSearchThemeSort(String searchThemeSort) {
		this.searchThemeSort = searchThemeSort;
	}

	public int getSearchEngine() {
		return searchEngine;
	}

	public void setSearchEngine(int searchEngine) {
		this.searchEngine = searchEngine;
	}

	public String getOrderStateSort() {
		return orderStateSort;
	}

	public void setOrderStateSort(String orderStateSort) {
		this.orderStateSort = orderStateSort;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public int getSearchTheme() {
		return searchTheme;
	}

	public void setSearchTheme(int searchTheme) {
		this.searchTheme = searchTheme;
	}

	@Override
	public String toString() {
		return "Search [userNo=" + userNo + ", memberNo=" + memberNo + ", memberGrade=" + memberGrade + ", cafeNo="
				+ cafeNo + ", cafeURL=" + cafeURL + ", cafeType=" + cafeType + ", boardNo=" + boardNo + ", boardName="
				+ boardName + ", postNo=" + postNo + ", replyNo=" + replyNo + ", status=" + status + ", sortCode="
				+ sortCode + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", currentPage=" + currentPage + ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + ", termStart=" + termStart + ", termEnd=" + termEnd
				+ ", targetUserNo=" + targetUserNo + ", chatNo=" + chatNo + ", chatRoomNo=" + chatRoomNo
				+ ", friendStatus=" + friendStatus + ", engineAll=" + engineAll + ", engineNaver=" + engineNaver
				+ ", engineDaum=" + engineDaum + ", engineGoogle=" + engineGoogle + ", orderState=" + orderState
				+ ", searchTheme=" + searchTheme + "]";
	}

	

}//end of class