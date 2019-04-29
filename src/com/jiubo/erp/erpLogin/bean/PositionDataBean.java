package com.jiubo.erp.erpLogin.bean;

class PositionDataBean {
	private String Position_ID; // 职位编号
	private String Position_Name;// 职位名称
	private String PositionType_ID;// 岗位类型ID
	private String IsPoint;// 是否重点岗位

	public String getPosition_ID() {
		return Position_ID;
	}

	public void setPosition_ID(String position_ID) {
		Position_ID = position_ID;
	}

	public String getPosition_Name() {
		return Position_Name;
	}

	public void setPosition_Name(String position_Name) {
		Position_Name = position_Name;
	}

	public String getPositionType_ID() {
		return PositionType_ID;
	}

	public void setPositionType_ID(String positionType_ID) {
		PositionType_ID = positionType_ID;
	}

	public String getIsPoint() {
		return IsPoint;
	}

	public void setIsPoint(String isPoint) {
		IsPoint = isPoint;
	}

}
