package com.jiubo.erp.rygl.bean;

public class DepartmentBean {
	private String ID; //编号
	private String Name; //名称
	private String ParentID; //父级编号
	private String OrderNum; //顺序号
	public DepartmentBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getParentID() {
		return ParentID;
	}
	public void setParentID(String parentID) {
		ParentID = parentID;
	}
	public String getOrderNum() {
		return OrderNum;
	}
	public void setOrderNum(String orderNum) {
		OrderNum = orderNum;
	}

	
	
	

}
