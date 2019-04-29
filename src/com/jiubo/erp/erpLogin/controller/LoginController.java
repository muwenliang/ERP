package com.jiubo.erp.erpLogin.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;

import com.quicksand.push.SpringWebSocketHandler;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jiubo.erp.erpLogin.service.UserService;
import com.jiubo.erp.erpLogin.vo.LoginInput;
import com.jiubo.erp.erpLogin.vo.LoginOutput;

@Controller
@RequestMapping("/ErpLogin")
public class LoginController {
	@Autowired
	private UserService Userservice;
	
	
	/*
	 * Erp用户登录
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView login(LoginInput input,HttpSession session,HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		response.setContentType("text/html;charset=UTF-8"); //设置相应内容编码
		String error="<script>alert('登录失败,请重试!');history.back();</script>";
		String pwError="<script>alert('用户名或密码有误,请重新输入!');history.back();</script>";
		try {
		    LoginOutput out=this.Userservice.Erplogin(input);
		    if(out!=null){
		       session.setAttribute("user", out);
		       mv.setViewName("index");
		       return mv;
		    }else{
		    	response.getWriter().write(pwError);
		    }
		} catch (Exception e) {
			e.printStackTrace();
				try {
					response.getWriter().write(error);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		}
		return null;
	}
	
	/*
	 * Erp用户退出
	 */
	@RequestMapping(value="/exit",method=RequestMethod.GET)
	public String loginOut(HttpSession session,HttpServletResponse response,HttpServletRequest request){
		response.setContentType("text/html;charset=UTF-8"); //设置相应内容编码
		String error="<script>alert('操作失败,请重试!');history.back();</script>";
		String abpath=request.getContextPath();
	    String success="<script>window.location.href='"+abpath+"/page/login.jsp';</script>";
		try {
			session.invalidate();
			response.getWriter().write(success);
		} catch (Exception e) {
		  e.printStackTrace();
			  try {
				response.getWriter().write(error);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return null;
	}
		
	
}
