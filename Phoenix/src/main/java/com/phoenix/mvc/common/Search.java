package com.phoenix.mvc.common;

public class Search{
	///Field
	private int userNo;
	private int memberNo;
	private int cafeNo;
	private String cafeURL;
	private int boardNo;
	private String boardName;
	private int postNo;
	private int replyNo;
	private String searchCondition;
	private String searchKeyword;
	private int currentPage;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	private int sortCode;
	private String termStart;
	private String termEnd;
	
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

	@Override
	public String toString() {
		return "Search [userNo=" + userNo + ", memberNo=" + memberNo + ", cafeNo=" + cafeNo + ", cafeURL=" + cafeURL
				+ ", boardNo=" + boardNo + ", boardName=" + boardName + ", postNo=" + postNo + ", replyNo=" + replyNo
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", currentPage="
				+ currentPage + ", pageSize=" + pageSize + ", endRowNum=" + getEndRowNum() + ", startRowNum=" + getStartRowNum()
				+ ", sortCode=" + sortCode + ", termStart=" + termStart + ", termEnd=" + termEnd + "]";
	}

}//end of class