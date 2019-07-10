package com.phoenix.mvc.common;

import java.util.Date;

public class Search{
	///Field
	private int cafeNo;
	private String cafeURL;
	private int boardNo;
	private String boardName;
	private String searchCondition;
	private String searchKeyword;
	private int currentPage;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	private int sortCode;
	private Date termStart;
	private Date termEnd;
	
	///Constructor
	public Search() {
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

	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}

	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	public int getSortCode() {
		return sortCode;
	}

	public void setSortCode(int sortCode) {
		this.sortCode = sortCode;
	}

	public Date getTermStart() {
		return termStart;
	}

	public void setTermStart(Date termStart) {
		this.termStart = termStart;
	}

	public Date getTermEnd() {
		return termEnd;
	}

	public void setTermEnd(Date termEnd) {
		this.termEnd = termEnd;
	}

	@Override
	public String toString() {
		return "Search [cafeURL=" + cafeURL + ", boardNo=" + boardNo + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum + ", sortCode=" + sortCode + "]";
	}

	///Method

}//end of class