package com.phoenix.mvc.service.domain;

import java.util.ArrayList;

public class ShoppingmallSearch {

	private ArrayList<String> relativeKeyword; //연관검색어
	private ArrayList<String> relativeKeyowrdLink; //연관검색어해당 링크
	private String searchTotal; //총 몇개의 검색어?
	private String searchKeyword;
	private int detectedItemCount;
	
	public ShoppingmallSearch() {
		// TODO Auto-generated constructor stub
	}


	public ArrayList<String> getRelativeKeyword() {
		return relativeKeyword;
	}


	public void setRelativeKeyword(ArrayList<String> relativeKeyword) {
		this.relativeKeyword = relativeKeyword;
	}


	public ArrayList<String> getRelativeKeyowrdLink() {
		return relativeKeyowrdLink;
	}


	public void setRelativeKeyowrdLink(ArrayList<String> relativeKeyowrdLink) {
		this.relativeKeyowrdLink = relativeKeyowrdLink;
	}


	public String getSearchTotal() {
		return searchTotal;
	}


	public void setSearchTotal(String searchTotal) {
		this.searchTotal = searchTotal;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public int getDetectedItemCount() {
		return detectedItemCount;
	}


	public void setDetectedItemCount(int detectedItemCount) {
		this.detectedItemCount = detectedItemCount;
	}


	@Override
	public String toString() {
		return "ShoppingmallSearch [relativeKeyword=" + relativeKeyword + ", relativeKeyowrdLink=" + relativeKeyowrdLink
				+ ", searchTotal=" + searchTotal + ", searchKeyword=" + searchKeyword + ", detectedItemCount="
				+ detectedItemCount + "]";
	}

}
