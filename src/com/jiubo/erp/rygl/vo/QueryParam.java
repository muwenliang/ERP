package com.jiubo.erp.rygl.vo;

//检索参数
public class QueryParam {
	private String departName;
	private String departId;
	private String state;
	private String projectId;
	
	//高级查询
	private String searchType; // 检索类别 0.全部 1.入职日期 2.转正日期 3.离职日期
	private String startDate; // 入职日期
	private String endDate; // 入职日期
	private String birth; // 生日月份
	
	

	//搜索内容  工号、姓名、职位、项目组
	private String searchContent;

	

	// DB:家庭成员检索
	private String chName;
	private String empName;
	private String shBirth;

	// 分页信息
	private int currentPage=1;

	private int records=30;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRecords() {
		return records;
	}

	public void setRecords(int records) {
		this.records = records;
	}

	public String getChName() {
		return chName;
	}

	public void setChName(String chName) {
		this.chName = chName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getShBirth() {
		return shBirth;
	}

	public void setShBirth(String shBirth) {
		this.shBirth = shBirth;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	public String getDepartId() {
		return departId;
	}

	public void setDepartId(String departId) {
		this.departId = departId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

}
