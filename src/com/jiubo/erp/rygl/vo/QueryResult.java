package com.jiubo.erp.rygl.vo;

public class QueryResult {

	private String id;//人员ID
	private String JobNum;//工号
	private String name;
	private String sex;
	private String departName;//部门名称
	private String positionName;//职位名称
	private String ERPAaccount;//ERP账号
	private String birth;//生日
	private String entryDate;//入职日期
	private String PositiveDate;//转正日期
	private String ResignDate;//离职日期
	private String State;//聘用状态，离职还是在职
	private String projectId;//项目id
	private String departId;//部门id
	private String accountId;//账户ID
	
	public QueryResult() {
		super();
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getDepartId() {
		return departId;
	}
	public void setDepartId(String departId) {
		this.departId = departId;
	}
	public QueryResult(String id, String jobNum, String name, String sex, String departName, String positionName,
			String eRPAaccount, String birth, String entryDate, String positiveDate, String resignDate, String state) {
		super();
		this.id = id;
		JobNum = jobNum;
		this.name = name;
		this.sex = sex;
		this.departName = departName;
		this.positionName = positionName;
		ERPAaccount = eRPAaccount;
		this.birth = birth;
		this.entryDate = entryDate;
		PositiveDate = positiveDate;
		ResignDate = resignDate;
		State = state;
	}
	
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJobNum() {
		return JobNum;
	}

	public void setJobNum(String jobNum) {
		JobNum = jobNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getERPAaccount() {
		return ERPAaccount;
	}

	public void setERPAaccount(String eRPAaccount) {
		ERPAaccount = eRPAaccount;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getPositiveDate() {
		return PositiveDate;
	}

	public void setPositiveDate(String positiveDate) {
		PositiveDate = positiveDate;
	}

	public String getResignDate() {
		return ResignDate;
	}

	public void setResignDate(String resignDate) {
		ResignDate = resignDate;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

}
