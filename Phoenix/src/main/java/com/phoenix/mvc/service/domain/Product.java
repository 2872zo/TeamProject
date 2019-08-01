package com.phoenix.mvc.service.domain;

public class Product {
	
	
	private String detailPageLink; //00
	private String productName; //00
	private String price;//00
	private String productImage; //00
	private String delivery; //0
	private String averageDeliveryDate; //00
	private String buyCount;//00
	private String reviewAverage;//00
	private String reviewCount;//00

	public Product() {
		// TODO Auto-generated constructor stub
	}

	public String getDetailPageLink() {
		return detailPageLink;
	}

	public void setDetailPageLink(String detailPageLink) {
		this.detailPageLink = detailPageLink;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getAverageDeliveryDate() {
		return averageDeliveryDate;
	}

	public void setAverageDeliveryDate(String averageDeliveryDate) {
		this.averageDeliveryDate = averageDeliveryDate;
	}

	public String getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(String buyCount) {
		this.buyCount = buyCount;
	}

	public String getReviewAverage() {
		return reviewAverage;
	}

	public void setReviewAverage(String reviewAverage) {
		this.reviewAverage = reviewAverage;
	}

	public String getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "Product [detailPageLink=" + detailPageLink + ", productName=" + productName + ", price=" + price
				+ ", productImage=" + productImage + ", delivery=" + delivery + ", averageDeliveryDate="
				+ averageDeliveryDate + ", buyCount=" + buyCount + ", reviewAverage=" + reviewAverage + ", reviewCount="
				+ reviewCount + "]";
	}

}
