package com.phoenix.mvc.service.domain;

public class Purchase {

	private String orderDate;//00
	private String orderTime;//00
	private int orderNumber;//00
	private String imageSrc;//00
	private String originPageLink;//00
	private String productName;//00
	private String productDetail;//00
	private String totalPrice;//00
	private String deliveryPrice;//0
	private String orderState;//00
	private int quantity;//0
	private String deliverDate;
	private String purchaseFrom;//0
	
	//티몬 등기우편 링크랑 등기우편 번호도 가져오기 .
	
	
	
	public Purchase() {
		// TODO Auto-generated constructor stub
	}



	public String getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}



	public String getImageSrc() {
		return imageSrc;
	}



	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getProductDetail() {
		return productDetail;
	}



	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}



	public String getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}



	public String getDeliveryPrice() {
		return deliveryPrice;
	}



	public void setDeliveryPrice(String deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}



	public String getOrderState() {
		return orderState;
	}



	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	
	
	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public String getOrderTime() {
		return orderTime;
	}



	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}



	public int getOrderNumber() {
		return orderNumber;
	}



	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}



	public String getOriginPageLink() {
		return originPageLink;
	}



	public void setOriginPageLink(String originPageLink) {
		this.originPageLink = originPageLink;
	}



	public String getDeliverDate() {
		return deliverDate;
	}



	public void setDeliverDate(String deliverDate) {
		this.deliverDate = deliverDate;
	}



	public String getPurchaseFrom() {
		return purchaseFrom;
	}



	public void setPurchaseFrom(String purchaseFrom) {
		this.purchaseFrom = purchaseFrom;
	}



	@Override
	public String toString() {
		return "Purchase [orderDate=" + orderDate + ", orderTime=" + orderTime + ", orderNumber=" + orderNumber
				+ ", imageSrc=" + imageSrc + ", originPageLink=" + originPageLink + ", productName=" + productName
				+ ", productDetail=" + productDetail + ", Totalprice=" + totalPrice + ", deliveryPrice=" + deliveryPrice
				+ ", orderState=" + orderState + ", quantity=" + quantity + ", deliverDate=" + deliverDate
				+ ", purchaseFrom=" + purchaseFrom + "]";
	}


	

}
