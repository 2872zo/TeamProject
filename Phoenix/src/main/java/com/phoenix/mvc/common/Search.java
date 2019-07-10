package com.phoenix.mvc.common;

import java.util.Arrays;

public class Search{
	///Field
	private String cafeURL;
	private int boardNo;
	private String searchCondition;
	private String searchKeyword;
	private int currentPage;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	private int sortCode;
	
	///Constructor
	public Search() {
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
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getSortCode() {
		return sortCode;
	}

	public void setSortCode(int sortCode) {
		this.sortCode = sortCode;
	}
	
	@Override
	public String toString() {
		return "Search [cafeURL=" + cafeURL + ", boardNo=" + boardNo + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum + ", sortCode=" + sortCode + "]";
	}

	///Method

}//end of class