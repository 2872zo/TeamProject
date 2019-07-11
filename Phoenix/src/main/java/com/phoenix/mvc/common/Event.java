package com.phoenix.mvc.common;

import java.util.Date;

public class Event {
	
	private int eventNo;
	private int targetNo;
	private String eventType;
	private int cafeNo;
	private int eventUserNo;
	private Date regDate;
	private String startDate;
	private String endDate;
	
	//eventNo? 통계에서 뿌려줄땐 Event domain 필요없는데..
	
	public Event() {
		// TODO Auto-generated constructor stub
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public String getEventType() {
		return eventType;
	}

	public void setEventType(String eventType) {
		this.eventType = eventType;
	}

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}

	public int getEventUserNo() {
		return eventUserNo;
	}

	public void setEventUserNo(int eventUserNo) {
		this.eventUserNo = eventUserNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString()
	{
		
		return "Event = [ eventNo: "+eventNo+" targetNo : "+targetNo+" eventType : "+eventType
				+" cafeNo : "+cafeNo+" eventUserNo : "+eventUserNo+" regDate : "+regDate
				+" startDate : "+startDate+" endDate : "+endDate+ "]";
	}
}
