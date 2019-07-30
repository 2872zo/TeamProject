package com.phoenix.mvc.service.domain;

public class Image {

	private String title;
	private String resultLink;
	private String thumbnail;
	private String sizeHeight;
	private String sizeWidth;
	private String collection; //daum only
	private String Image; //daum only 더 큰애
	private String siteName; //daum only
	private String dateTime; //daum only
	private String engineFrom;
	
	public Image() {
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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getSizeHeight() {
		return sizeHeight;
	}

	public void setSizeHeight(String sizeHeight) {
		this.sizeHeight = sizeHeight;
	}

	public String getSizeWidth() {
		return sizeWidth;
	}

	public void setSizeWidth(String sizeWidth) {
		this.sizeWidth = sizeWidth;
	}

	public String getCollection() {
		return collection;
	}

	public void setCollection(String collection) {
		this.collection = collection;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
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
		return "Image [title=" + title + ", resultLink=" + resultLink + ", thumbnail=" + thumbnail + ", sizeHeight="
				+ sizeHeight + ", sizeWidth=" + sizeWidth + ", collection=" + collection + ", Image=" + Image
				+ ", siteName=" + siteName + ", dateTime=" + dateTime + ", engineFrom=" + engineFrom + "]";
	}

}
