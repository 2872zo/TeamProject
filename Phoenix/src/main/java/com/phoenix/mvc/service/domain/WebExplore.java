package com.phoenix.mvc.service.domain;

public class WebExplore {

	private String title;
	private String contents;
	private String resultLink;
	private String dateTime; //daum only
	private String engineFrom;
	
	
	public WebExplore() {
		// TODO Auto-generated constructor stub
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getResultLink() {
		return resultLink;
	}


	public void setResultLink(String resultLink) {
		this.resultLink = resultLink;
	}


	public String getDateTime() {
		return dateTime;
	}


	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}


	public String getEngineFrom() {
		return engineFrom;
	}


	public void setEngineFrom(String engineFrom) {
		this.engineFrom = engineFrom;
	}


	@Override
	public String toString() {
		return "WebExplore [title=" + title + ", contents=" + contents + ", resultLink=" + resultLink + ", dateTime="
				+ dateTime + ", engineFrom=" + engineFrom + "]";
	}


	

}
