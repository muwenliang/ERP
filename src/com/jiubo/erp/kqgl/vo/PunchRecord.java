package com.jiubo.erp.kqgl.vo;

//打卡
public class PunchRecord {
	private String userId;
	private String maxAttTime;
	private String minAttTime;
	private String year;
	private String month;
	private String day;
	
	public PunchRecord() {
		// TODO Auto-generated constructor stub
	}

	

	public String getMaxAttTime() {
		return maxAttTime;
	}



	public void setMaxAttTime(String maxAttTime) {
		this.maxAttTime = maxAttTime;
	}



	public String getMinAttTime() {
		return minAttTime;
	}



	public void setMinAttTime(String minAttTime) {
		this.minAttTime = minAttTime;
	}



	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
