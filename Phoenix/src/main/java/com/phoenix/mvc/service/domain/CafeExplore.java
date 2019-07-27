package com.phoenix.mvc.service.domain;

public class CafeExplore {

	private String title;
	private String resultLink;
	private String contents;
	private String cafeName;
	private String cafeLink;
	private String thumbnail;
	private String dateTime;
	private String engineFrom;
	
	public CafeExplore() {
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

	public String getCafeName() {
		return cafeName;
	}

	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}

	public String getCafeLink() {
		return cafeLink;
	}

	public void setCafeLink(String cafeLink) {
		this.cafeLink = cafeLink;
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
		return "CafeExplore [title=" + title + ", resultLink=" + resultLink + ", contents=" + contents + ", cafeName="
				+ cafeName + ", cafeLink=" + cafeLink + ", thumbnail=" + thumbnail + ", dateTime=" + dateTime + "]";
	}

}
