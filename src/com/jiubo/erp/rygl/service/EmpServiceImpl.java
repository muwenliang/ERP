package com.jiubo.erp.rygl.service;


import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiubo.erp.common.Position;
import com.jiubo.erp.rygl.bean.DepartmentBean;
import com.jiubo.erp.rygl.bean.ProjectDataBean;
import com.jiubo.erp.rygl.dao.empDao;
import com.jiubo.erp.rygl.vo.Account;
import com.jiubo.erp.rygl.vo.LeaveResign;
import com.jiubo.erp.rygl.vo.Nation;
import com.jiubo.erp.rygl.vo.PositionShift;
import com.jiubo.erp.rygl.vo.QueryFamilyResult;
import com.jiubo.erp.rygl.vo.QueryParam;
import com.jiubo.erp.rygl.vo.QueryResult;
import com.jiubo.erp.rygl.vo.UserFamily;
import com.jiubo.erp.rygl.vo.UserInfo;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private empDao dao;

	/*
	 * 初始化人员列表
	 * 
	 * @see
	 * com.jiubo.erp.rygl.service.EmpService#initEmpList(com.jiubo.erp.rygl.vo.
	 * QueryParam, com.jiubo.erp.common.PageParam)
	 */
	@Override
	public List<QueryResult> initEmpList(QueryParam param, HttpServletRequest request) throws Exception {

		List<QueryResult> emplist = this.dao.searchEmplist(param);
		request.setAttribute("empData", emplist);
		request.setAttribute("totalnfo", emplist.size());
		return emplist;
	}
	
	
	/*
	 * 初始化家庭成员列表
	 * SS
	 * @see
	 * com.jiubo.erp.rygl.service.EmpService#initEmpList(com.jiubo.erp.rygl.vo.
	 * QueryParam, com.jiubo.erp.common.PageParam)
	 */
	@Override
	public List<QueryFamilyResult> initFamilList(QueryParam param, HttpServletRequest request) throws Exception {
		List<QueryFamilyResult> fmlist = this.dao.searchFamilyList(param);
		
		return fmlist;
	}
	
	/**
	 * 家庭成员的模糊查询
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public List<QueryFamilyResult> familyfuzzyQuery(QueryParam param, HttpServletRequest request) throws Exception {
		List<QueryFamilyResult> fmlist = this.dao.searchFamilyList(param);
	
		return fmlist;
	}

	/*
	 * 初始化部门列表
	 * 
	 * @see com.jiubo.erp.rygl.service.EmpService#initDepartList()
	 */
	@Override
	public List<DepartmentBean> initDepartList(DepartmentBean dbp) {
		List<DepartmentBean> depart = this.dao.selectDepartList(dbp);
		return depart;
	}

	/*
	 * 初始化项目列表
	 * 
	 * @see
	 * com.jiubo.erp.rygl.service.EmpService#initProjectList(javax.servlet.http.
	 * HttpServletRequest)
	 */
	@Override
	public List<ProjectDataBean> initProjectList(HttpServletRequest request) {
		List<ProjectDataBean> list = this.dao.selectProjectList();
		request.setAttribute("project", list);
		
		return list;
	}
	
	/*
	 * 初始化职位列表
	 * 
	 * @see com.jiubo.erp.rygl.service.EmpService#initDepartList()
	 */
	@Override
	public List<Position> initPositionList() {
		List<Position> positions = this.dao.selectPositionList();
		return positions;
	}
	
	/**
	 * 初始化民族列表
	 */
	@Override
	public List<Nation> initNationList() {
		List<Nation>  nations = this.dao.selectNationList();
		return nations;
	}
	
	/**
	 * 初始化离职原因列表
	 */
	public List<LeaveResign> initLeaveList(){
		List<LeaveResign> lrList = this.dao.selectLeaveList();
		return lrList;
	}
	
	/**
	 * 查询所有人员列表
	 * 
	 * @param param
	 * @return
	 */
	public Collection<QueryResult> searchAllList(QueryParam param) {
		List<QueryResult> emplist = this.dao.searchEmplist(param);
		return emplist;
	}
	
	/**
	 * 根据部门名称查询部门的ID
	 * depName 部门名称
	 */
	public List<DepartmentBean> selectUserDepId(DepartmentBean depName){
		List<DepartmentBean> depList = this.dao.selectDepartList(depName);
		return depList;
	}
	
	/**
	 * 查询ERP账户信息
	 */
	public List<Account> selectAccountList(Account account){
		List<Account> aList = this.dao.selectAccountList(account);
		return aList;
	}
	
	public Integer insertAccountInfo(Account account) {
		
		return this.dao.insertAccountInfo(account);
	}
	
	/**
	 * 查询用户基本信息
	 */
	public List<UserInfo> searchUBInfo(UserInfo userInfo) {
		List<UserInfo> uList= this.dao.searchUBInfo(userInfo);
		System.out.println("-------查询用户------"+uList.size());
		return uList;
	}
	/**
	 * 查看单个用户的家庭成员信息
	 */
	public List<QueryFamilyResult>singleFamilyList(QueryFamilyResult qfr){
		return this.dao.singleFamilyList(qfr);
	}
	
	/**
	 * 查询用户详细信息
	 */
	public List<UserInfo> searchUDInfo(UserInfo userInfo) {
		List<UserInfo> uList= this.dao.searchUDInfo(userInfo);
		System.out.println("-------查询用户------"+uList.size());
		return uList;
	}
	
	/**
	 * 插入用户信息
	 * @param userInfo
	 * @return
	 */
	public Integer insertUserInfo(UserInfo userInfo) {
		Integer uInfoId = this.dao.insertBaseInfo(userInfo);
	
		return uInfoId;
	}
	
	/**
	 * 插入用户的详细信息
	 * @param userInfo
	 * @return
	 */
	public boolean insertUserDetailInfo(UserInfo userInfo) {
				
		this.dao.insertDetailInfo(userInfo);
		
		return true;
	}
	
	/**
	 * 插入user的家庭信息
	 */
	public boolean insertUserFmInfo(UserFamily userFmInfo) {
		this.dao.insertfamilyInfo(userFmInfo);
		return true;
	}


	/**
	 * 更新用户的基本信息
	 */
	public Integer updataBaselInfo(UserInfo userInfo) {
		this.dao.updataBaselInfo(userInfo);
		return null;
	}


	/**
	 * 更新用户的详细信息
	 */
	public Integer updataDetialInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 查询用户的调动信息
	 */
	public List<PositionShift> selectShiftInfo(PositionShift pShift) {
		List<PositionShift> psList = this.dao.selectShiftInfo(pShift); 
		return psList;
	}
}
