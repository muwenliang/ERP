package com.jiubo.erp.erpLogin.bean;
//账号权限表
public class AccountRuleData {

	private String A_R_ID; //编号
	private String Account_ID;//账号主键
	private String Rule_ID; //角色主键

	public String getA_R_ID() {
		return A_R_ID;
	}

	public void setA_R_ID(String a_R_ID) {
		A_R_ID = a_R_ID;
	}

	public String getAccount_ID() {
		return Account_ID;
	}

	public void setAccount_ID(String account_ID) {
		Account_ID = account_ID;
	}

	public String getRule_ID() {
		return Rule_ID;
	}

	public void setRule_ID(String rule_ID) {
		Rule_ID = rule_ID;
	}

}
