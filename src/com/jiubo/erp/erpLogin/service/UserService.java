package com.jiubo.erp.erpLogin.service;

import com.jiubo.erp.common.Result;
import com.jiubo.erp.erpLogin.bean.AccountDataBean;
import com.jiubo.erp.erpLogin.vo.LoginInput;
import com.jiubo.erp.erpLogin.vo.LoginOutput;

public interface UserService {
	//erp登录
	LoginOutput Erplogin(LoginInput input) throws Exception;
	
	Result UserRegister(AccountDataBean input)throws Exception;

	
}
