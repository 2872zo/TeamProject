package com.phoenix.mvc.service.domain;

import java.util.List;

public class TimeLine {
	
	private String loginId;
	private String password;
	private String post;
	private String regDate;
	private String postId;
	private String likeCount;
	private List<String> img1List;
	private List<String> img1LinkList;
	private List<String> img2List;
	private List<String> img2LinkList;
	private List<String> img3List;
	private List<String> img3LinkList;
	private List<String> img4List;
	private List<String> img4LinkList;
	private String video1;
	private String video1Link;
	private int img1Size;
	private int img2Size;
	private int img3Size;
	private int video1Size;


	public TimeLine() {
		// TODO Auto-generated constructor stub
	}


	public String getLoginId() {
		return loginId;
	}


	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPost() {
		return post;
	}


	public void setPost(String post) {
		this.post = post;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getPostId() {
		return postId;
	}


	public void setPostId(String postId) {
		this.postId = postId;
	}


	public String getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}


	public List<String> getImg1List() {
		return img1List;
	}


	public void setImg1List(List<String> img1List) {
		this.img1List = img1List;
	}


	public List<String> getImg1LinkList() {
		return img1LinkList;
	}


	public void setImg1LinkList(List<String> img1LinkList) {
		this.img1LinkList = img1LinkList;
	}


	public List<String> getImg2List() {
		return img2List;
	}


	public void setImg2List(List<String> img2List) {
		this.img2List = img2List;
	}


	public List<String> getImg2LinkList() {
		return img2LinkList;
	}


	public void setImg2LinkList(List<String> img2LinkList) {
		this.img2LinkList = img2LinkList;
	}


	public List<String> getImg3List() {
		return img3List;
	}


	public void setImg3List(List<String> img3List) {
		this.img3List = img3List;
	}


	public List<String> getImg3LinkList() {
		return img3LinkList;
	}


	public void setImg3LinkList(List<String> img3LinkList) {
		this.img3LinkList = img3LinkList;
	}


	public List<String> getImg4List() {
		return img4List;
	}


	public void setImg4List(List<String> img4List) {
		this.img4List = img4List;
	}


	public List<String> getImg4LinkList() {
		return img4LinkList;
	}


	public void setImg4LinkList(List<String> img4LinkList) {
		this.img4LinkList = img4LinkList;
	}


	public String getVideo1() {
		return video1;
	}


	public void setVideo1(String video1) {
		this.video1 = video1;
	}


	public String getVideo1Link() {
		return video1Link;
	}


	public void setVideo1Link(String video1Link) {
		this.video1Link = video1Link;
	}


	public int getImg1Size() {
		return img1Size;
	}


	public void setImg1Size(int img1Size) {
		this.img1Size = img1Size;
	}


	public int getImg2Size() {
		return img2Size;
	}


	public void setImg2Size(int img2Size) {
		this.img2Size = img2Size;
	}


	public int getImg3Size() {
		return img3Size;
	}


	public void setImg3Size(int img3Size) {
		this.img3Size = img3Size;
	}


	public int getVideo1Size() {
		return video1Size;
	}


	public void setVideo1Size(int video1Size) {
		this.video1Size = video1Size;
	}


	@Override
	public String toString() {
		return "TimeLine [loginId=" + loginId + ", password=" + password + ", post=" + post + ", regDate=" + regDate
				+ ", postId=" + postId + ", likeCount=" + likeCount + ", img1List=" + img1List + ", img1LinkList="
				+ img1LinkList + ", img2List=" + img2List + ", img2LinkList=" + img2LinkList + ", img3List=" + img3List
				+ ", img3LinkList=" + img3LinkList + ", img4List=" + img4List + ", img4LinkList=" + img4LinkList
				+ ", video1=" + video1 + ", video1Link=" + video1Link + ", img1Size=" + img1Size + ", img2Size="
				+ img2Size + ", img3Size=" + img3Size + ", video1Size=" + video1Size + "]";
	}



	}