package com.jiubo.erp.kqgl.bean;

public class AttRuleTypeBean {
	private String ID;
	private String Name;
	private String Earlyminutes;
	private String Lateminutes;
	private String IsDelete;
	private String CreateDate;
	private String Creator;
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
	public String getEarlyminutes() {
		return Earlyminutes;
	}
	public void setEarlyminutes(String earlyminutes) {
		Earlyminutes = earlyminutes;
	}
	public String getLateminutes() {
		return Lateminutes;
	}
	public void setLateminutes(String lateminutes) {
		Lateminutes = lateminutes;
	}
	public String getIsDelete() {
		return IsDelete;
	}
	public void setIsDelete(String isDelete) {
		IsDelete = isDelete;
	}
	public String getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}
	public String getCreator() {
		return Creator;
	}
	public void setCreator(String creator) {
		Creator = creator;
	}
}
