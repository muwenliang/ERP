package com.jiubo.erp.erpLogin.dao;

import java.util.List;

import com.jiubo.erp.erpLogin.bean.AccountDataBean;
import com.jiubo.erp.erpLogin.bean.AccountRuleData;
import com.jiubo.erp.erpLogin.bean.RuleDataBean;
import com.jiubo.erp.erpLogin.vo.LoginOutput;
import com.jiubo.erp.erpLogin.vo.PositionInfoOutPut;

public interface LoginDAO {

	LoginOutput userLogin(AccountDataBean input);
	
	List<PositionInfoOutPut> selectPositionInfoByAccoutname(AccountDataBean input);
	
	AccountDataBean selectByUserName(AccountDataBean input);
	
	Integer addAccountData(AccountDataBean input);
	
	Integer addRuleData(RuleDataBean input);
	
	Integer addAccountRuleData(AccountRuleData input);

}
