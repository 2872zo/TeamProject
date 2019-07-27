package com.phoenix.mvc.service.domain;

public class Blog {

	private String title;
	private String resultLink;
	private String contents;//내용요약
	private String blogName;
	private String blogLink;
	private String thumbnail;
	private String dateTime;
	private String engineFrom;
	
	public Blog() {
		// TODO Auto-generated constructor stub
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getResultLink() {
		return resultLink;
	}

	public void setResultLink(String resultLink) {
		this.resultLink = resultLink;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getBlogName() {
		return blogName;
	}

	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}

	public String getBlogLink() {
		return blogLink;
	}

	public void setBlogLink(String blogLink) {
		this.blogLink = blogLink;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
		return "Blog [title=" + title + ", resultLink=" + resultLink + ", contents=" + contents + ", blogName="
				+ blogName + ", blogLink=" + blogLink + ", thumbnail=" + thumbnail + ", dateTime=" + dateTime + "]";
	}

}
