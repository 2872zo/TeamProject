package com.phoenix.mvc.service.domain;

public class Board {

	private int boardNo;
	private int cafeNo;
	private String cafeURL;
	private String boardName;
	private String accessGrade;
	private int boardIndex;
	private char privateFlag;
	private String boardType;
	private String boardDetail;
	
	
	public Board() {
		// TODO Auto-generated constructor stub
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getCafeNo() {
		return cafeNo;
	}


	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}


	public String getBoardName() {
		return boardName;
	}


	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}


	public String getAccessGrade() {
		return accessGrade;
	}


	public void setAccessGrade(String accessGrade) {
		this.accessGrade = accessGrade;
	}


	public int getBoardIndex() {
		return boardIndex;
	}


	public void setBoardIndex(int boardIndex) {
		this.boardIndex = boardIndex;
	}


	public char getPrivateFlag() {
		return privateFlag;
	}


	public void setPrivateFlag(char privateFlag) {
		this.privateFlag = privateFlag;
	}


	public String getBoardType() {
		return boardType;
	}


	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}


	public String getBoardDetail() {
		return boardDetail;
	}


	public void setBoardDetail(String boardDetail) {
		this.boardDetail = boardDetail;
	}


	public String getCafeURL() {
		return cafeURL;
	}


	public void setCafeURL(String cafeURL) {
		this.cafeURL = cafeURL;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", cafeNo=" + cafeNo + ", cafeURL=" + cafeURL + ", boardName=" + boardName
				+ ", accessGrade=" + accessGrade + ", boardIndex=" + boardIndex + ", privateFlag=" + privateFlag
				+ ", boardType=" + boardType + ", boardDetail=" + boardDetail + "]";
	}
}
