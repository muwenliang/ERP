package com.jiubo.erp.erpLogin.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiubo.erp.common.Position;
import com.jiubo.erp.common.Result;
import com.jiubo.erp.erpLogin.bean.AccountDataBean;
import com.jiubo.erp.erpLogin.dao.LoginDAO;
import com.jiubo.erp.erpLogin.service.UserService;
import com.jiubo.erp.erpLogin.util.Md5Util;
import com.jiubo.erp.erpLogin.vo.LoginInput;
import com.jiubo.erp.erpLogin.vo.LoginOutput;
import com.jiubo.erp.erpLogin.vo.PositionInfoOutPut;

@Service
public class UserServiceimpl implements UserService {
	
	@Autowired
	private LoginDAO dao;
	
	
	 /*
	  * Erp用户注册
	  * 默认测试账号:admin1
	  * 密码:a123456
	  */
	public Result UserRegister(AccountDataBean input)throws Exception{
		Result result=new Result<>();
	    if(dao.selectByUserName(input)==null){
	    	this.dao.addAccountData(input);
	    	result.setMessage("注册成功");
	    	result.setStatus("1");
	    }else{
	    	result.setMessage("用户名已存在");
	    	result.setStatus("0");
	    }
	    return result;
	}
	
	/*
	 * 名称:ERP系统登录
	 * 参数::用户名username 密码password
	 * 返回值:LoginOutput
	 */
	@Override
	@Transactional
	public LoginOutput Erplogin(LoginInput input) throws Exception {
		LoginOutput in=new LoginOutput();
		AccountDataBean account=new AccountDataBean();
		if(StringUtils.isEmpty(input.getUsername()) || StringUtils.isEmpty(input.getPassword())){
			throw new  Exception("must not be null");
		}
		account.setAccount_Name(input.getUsername());
		account.setAccount_Pwd(Md5Util.md5Encrypt32Lower(input.getPassword()));
		in=dao.userLogin(account);
		if(in!=null){
			//判断权限信息
			List<PositionInfoOutPut>  posits=dao.selectPositionInfoByAccoutname(account);  //根据用户名查询其权限信息
			if(!posits.isEmpty()){
				for (PositionInfoOutPut posit : posits) {
					if(StringUtils.isNotEmpty(posit.getPosition_Name())){
						if(posit.getPosition_Name().equals(Position.SUPERADMIN) || posit.getPosition_Name().equals(Position.FUZONG) || posit.getPosition_Name().equals(Position.XINGZHENG)){
							in.setStatus("1");
						}
						if(posit.getPosition_Name().equals(Position.YHZZH) || posit.getPosition_Name().equals(Position.ZXZG) ||posit.getPosition_Name().equals(Position.YYXMZG) ){
							in.setStatus("0");
						}
					}
				}
			}
			in.setStatus("1");
			return in;
		}else{
			return null;
		}
	}
	
	
	
	
	
	
	
}
