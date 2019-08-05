package com.phoenix.mvc.service.domain;

import java.util.ArrayList;

public class ShoppingmallSearch {

	private ArrayList<String> relativeKeyword; //연관검색어
	private ArrayList<String> relativeKeywordLink; //연관검색어해당 링크
	private String searchTotal; //총 몇개의 검색어?
	private String searchKeyword; //rest
	private int detectedItemCount; //rest
//	private String 
	
	public ShoppingmallSearch() {
		// TODO Auto-generated constructor stub
	}


	public ArrayList<String> getRelativeKeyword() {
		return relativeKeyword;
	}


	public void setRelativeKeyword(ArrayList<String> relativeKeyword) {
		this.relativeKeyword = relativeKeyword;
	}


	public ArrayList<String> getRelativeKeywordLink() {
		return relativeKeywordLink;
	}


	public void setRelativeKeywordLink(ArrayList<String> relativeKeywordLink) {
		this.relativeKeywordLink = relativeKeywordLink;
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
		return "ShoppingmallSearch [relativeKeyword=" + relativeKeyword + ", relativeKeywordLink=" + relativeKeywordLink
				+ ", searchTotal=" + searchTotal + ", searchKeyword=" + searchKeyword + ", detectedItemCount="
				+ detectedItemCount + "]";
	}

}
