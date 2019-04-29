package com.jiubo.erp.rygl.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils.Null;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hp.hpl.sparta.xpath.ThisNodeTest;
import com.jiubo.erp.common.Position;
import com.jiubo.erp.erpLogin.util.ResponseMessageUtils;
import com.jiubo.erp.rygl.bean.DepartmentBean;
import com.jiubo.erp.rygl.bean.ProjectDataBean;
import com.jiubo.erp.rygl.service.EmpService;
import com.jiubo.erp.rygl.vo.Account;
import com.jiubo.erp.rygl.vo.LeaveResign;
import com.jiubo.erp.rygl.vo.Nation;
import com.jiubo.erp.rygl.vo.PositionShift;
import com.jiubo.erp.rygl.vo.QueryFamilyResult;
import com.jiubo.erp.rygl.vo.QueryParam;
import com.jiubo.erp.rygl.vo.QueryResult;
import com.jiubo.erp.rygl.vo.User;
import com.jiubo.erp.rygl.vo.UserFamily;
import com.jiubo.erp.rygl.vo.UserInfo;
import com.quicksand.push.ToolClass;

import lombok.val;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/search")
public class EmpController {

	@Autowired
	private EmpService service;

	/**
	 * 人员检索
	 * 
	 * @param param
	 * @param response
	 * @param request
	 * @return
	 */
//	@RequestMapping(value = "/ryList", method = { RequestMethod.POST, RequestMethod.GET })
//	public ModelAndView searchEmpList(QueryParam param, HttpServletResponse response, HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView();
//
//		// System.out.println("---前台获取-----"+param.getSearchType());
//		// System.out.println("---前台获取-----"+param.getStartDate());
//		// System.out.println("--前台获取-----"+param.getEndDate());
//		// System.out.println("---前台获取-----"+param.getBirth());
//
//		try {
//			this.service.initEmpList(param, request);
//			this.service.initProjectList(request);
//			this.service.initDepartList(request);
//			this.service.initFamilList(param, request);
//			mv.setViewName("employee");
//			return mv;
//		} catch (Exception e) {
//			e.printStackTrace();
//			ResponseMessageUtils.responseMessage(response, "查询失败!");
//			return null;
//		}
//	}
	/**
	 * 全员搜索
	 * @param param 属性包括所有人员信息
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/allList")
	public List<QueryResult> allList(HttpServletResponse response, HttpServletRequest request) {
		List<QueryResult> allList = new ArrayList<>();
		QueryParam qParam = new QueryParam();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		
		String departName = new String();
		String dpId = mapList.get("departId");
		if (dpId!="0") {
			
			departName = departName(departList(response, request),dpId);
//			System.out.println("----部门名称-----"+departName);
		}
		
		qParam.setState(ToolClass.judgeStr(mapList.get("state")));
		qParam.setProjectId(ToolClass.judgeStr(mapList.get("projectID")));
		qParam.setDepartName(departName);
		qParam.setSearchContent(mapList.get("searchContent"));

//		System.out.println("emp查询到了----人员-----" + qParam.getState()+qParam.getDepartName()+qParam.getSearchContent()+qParam.getProjectId());
		
		try {
			if (qParam.getSearchContent()!=null) {
//				System.out.println("-----有搜索的内容-----"+qParam.getSearchContent());
				allList = fuzzyQuery(qParam, request);
				
			}else {
				System.out.println("-----搜索的内容-----");
				qParam = new QueryParam();
				allList = this.service.initEmpList(qParam, request);
//				System.out.println("emp查询到了initEmpList----accountId-----" + allList.get(0).getAccountId());
			}
			System.out.println("emp查询到了initEmpList----accountId-----" + allList.get(0).getAccountId());
			return allList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}
	/**
	 * 高级查询
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/advanceAllList")
	public List<QueryResult> advanceQuery(HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		
		//请求参数赋值给参数对象
		QueryParam qParam = new QueryParam();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		
		
		qParam.setSearchType(mapList.get("searchType"));
		qParam.setStartDate(mapList.get("startDate"));
		qParam.setEndDate(mapList.get("endDate"));
		qParam.setBirth(mapList.get("birth"));
		
		List<QueryResult> emplist = this.service.initEmpList(qParam, request);
		//高级查询
		String birthM = qParam.getBirth();
		int mBirth = Integer.valueOf(birthM);
				
		String searchType =  qParam.getSearchType();
		String startStr = qParam.getStartDate();
		String endStr = qParam.getEndDate();
		if (startStr != null || endStr != null ) {
			if (emplist.size()>0) {
				List<QueryResult> qrListCource = new ArrayList<>();
				List<QueryResult> qrListRes = new ArrayList<>();
				qrListCource = this.service.initEmpList(qParam, request);
						
				for (QueryResult qrListCour : qrListCource) {
					String strDate = null;	
					if (searchType.equals("1")) {
						strDate = qrListCour.getEntryDate();
					}else if (searchType.equals("2") & qrListCour.getPositiveDate()!=null) {
						strDate = qrListCour.getPositiveDate();
					}else if (searchType.equals("3")&qrListCour.getResignDate()!=null) {
						strDate = qrListCour.getResignDate();
					}
					if (strDate!=null) {
						if (strDate.compareTo(startStr)>=0 & strDate.compareTo(endStr)<=0) {
							String birth = qrListCour.getBirth().substring(6, 7);
							int birthInt = Integer.valueOf(birth);
							if (mBirth > 0 & mBirth < 13 & birthM!=null) {
								if (birthInt==mBirth) {
									qrListRes.add(qrListCour);
								}
							}else {
								qrListRes.add(qrListCour);
							}
						}
					}
				}
//				System.out.println("-------QueryResult-qrListRes-----"+qrListRes.size());
				request.setAttribute("empData", qrListRes);
				request.setAttribute("totalnfo", qrListRes.size());
				return qrListRes;
			}
		}
		return null;
	}
	/**
	 * 首页模糊查询
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public List<QueryResult> fuzzyQuery(QueryParam param, HttpServletRequest request) throws Exception {
		List<QueryResult> emplist = this.service.initEmpList(param, request);
		
		//首页的模糊搜索
		if (param.getSearchContent()!=null & emplist.size()>0) {
			List<QueryResult> qrListCource = new ArrayList<>();
			List<QueryResult> qrListRes = new ArrayList<>();
			String searchStr = param.getSearchContent();
			qrListCource = this.service.initEmpList(param, request);
			for (QueryResult qrListCour : qrListCource) {
				if (qrListCour.getJobNum().contains(searchStr)
						||qrListCour.getName().contains(searchStr)
						||qrListCour.getDepartName().contains(searchStr)
						||qrListCour.getPositionName().contains(searchStr)) {
					qrListRes.add(qrListCour);
				}
			}
//			System.out.println("-------模糊查询fuzzyQuery-----"+qrListRes.size());
			
			return qrListRes;
		}	
		return emplist;
	}  

	/**
	 * 赛选家庭人员列表
	 * 
	 * @param param
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value = "/fmList")
	public List<QueryFamilyResult> fmList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		QueryParam qParam = new QueryParam();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		qParam.setChName(mapList.get("chName"));
		qParam.setEmpName(mapList.get("empName"));
		qParam.setShBirth(mapList.get("shBirth"));
		
		
		String chName = qParam.getChName();
		String empName = qParam.getEmpName();
		String shBirth = qParam.getShBirth();
		
//		System.out.println("---shBirth----"+shBirth);
		Integer shBirthInt = Integer.valueOf(shBirth);
		List<QueryFamilyResult> fmList = this.service.familyfuzzyQuery(qParam, request);
		
		List<QueryFamilyResult> fmListCource = this.service.familyfuzzyQuery(qParam, request);
		List<QueryFamilyResult> fmListRes = new ArrayList<>();
//		System.out.println("------条件上源数据----"+fmList.size());
		if (fmListCource.size()>0) {
			
//			System.out.println("---F查询-----"+qParam.getChName());
//			System.out.println("---F查询-----"+qParam.getEmpName());
//			System.out.println("--F查询-----"+qParam.getShBirth());
//			System.out.println("------fmListCource源数据----"+fmListCource.size());
			if (empName!=null & chName!=null & shBirthInt>0) {
				for (QueryFamilyResult fmListCour : fmListCource) {
					String birth = fmListCour.getBirth().substring(6, 7);
					int birthInt = Integer.valueOf(birth);
					if (fmListCour.getJobnum().contains(empName)
							||fmListCour.getName().contains(empName)) {
						if (fmListCour.getChname().contains(chName)) {
							if (shBirthInt==birthInt) {
//								System.out.println("------3个条件----"+fmListRes.size());
								fmListRes.add(fmListCour);
							}
						}
					}
				}
			}else if (empName!=null & chName!=null & shBirthInt==0) {
					for (QueryFamilyResult fmListCour : fmListCource) {
						if (fmListCour.getJobnum().contains(empName)
								||fmListCour.getName().contains(empName)) {
							if (fmListCour.getChname().contains(chName)) {
//								System.out.println("-------2-12个条件----"+fmListRes.size());
								fmListRes.add(fmListCour);
							}
						}
					}
			}else if (shBirthInt > 0 & empName!=null) {
						for (QueryFamilyResult fmListCour : fmListCource) {
							String birth = fmListCour.getBirth().substring(6, 7);
							int birthInt = Integer.valueOf(birth);
							if (fmListCour.getChname().contains(chName)) {
								if (shBirthInt==birthInt) {
//									System.out.println("-------2-23个条件----"+fmListRes.size());
									fmListRes.add(fmListCour);
								}
							}
						}
			}else if (chName!=null & shBirthInt > 0) {
				for (QueryFamilyResult fmListCour : fmListCource) {
					String birth = fmListCour.getBirth().substring(6, 7);
					int birthInt = Integer.valueOf(birth);
					if (fmListCour.getJobnum().contains(empName)
							||fmListCour.getName().contains(empName)) {
						if (shBirthInt > 0 & shBirthInt==birthInt) {
//							System.out.println("------2-13个条件----"+fmListRes.size());
							fmListRes.add(fmListCour);
						}
					}
				}
			}else if (empName!=null & shBirthInt == 0) {
				for (QueryFamilyResult fmListCour : fmListCource) {
					if (fmListCour.getJobnum().contains(empName)
							||fmListCour.getName().contains(empName)) {
//							System.out.println("------1-1个条件----"+fmListRes.size());
							fmListRes.add(fmListCour);
						}
					}
				}
			}else if (chName!=null & shBirthInt == 0) {
				fmListCource = fmListRes;
				fmListRes = new ArrayList<>();
				for (QueryFamilyResult fmListCour : fmListCource) {
					if (fmListCour.getChname().contains(chName)) {
//						System.out.println("------1-2个条件----"+fmListRes.size());
						fmListRes.add(fmListCour);
					}
				}
			}else if (shBirthInt>0) {
				fmListCource = fmListRes;
				fmListRes = new ArrayList<>();
				for (QueryFamilyResult fmListCour : fmListCource) {
					String birth = fmListCour.getBirth().substring(6, 7);
					int birthInt = Integer.valueOf(birth);
					if (shBirthInt==birthInt) {
//						System.out.println("------1-3个条件----"+fmListRes.size());
						fmListRes.add(fmListCour);
					}
				}
			}
//		System.out.println("------fmListRes----"+fmListRes.size());
		return fmListRes;
	}

	/**
	 * 查看所有人员列表
	 * 
	 * @param param
	 *            所有人
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/ryAllList")
	public List<QueryResult> ryAllList(QueryParam param, HttpServletResponse response, HttpServletRequest request) {
		List<QueryResult> qrList = new ArrayList<>();
		try {
			qrList = this.service.initEmpList(param, request);
//			System.out.println("查询到了---------" + qrList.size());
			return qrList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}

	/**
	 * 项目列表
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/projectList")
	public List<ProjectDataBean> projectList(HttpServletResponse response, HttpServletRequest request) {
		List<ProjectDataBean> qrList = new ArrayList<>();
		try {
			qrList = this.service.initProjectList(request);
			System.out.println("项目列表" + qrList.size());
			return qrList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}

	/**
	 * 部门列表
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/departList")
	public List<DepartmentBean> departList(HttpServletResponse response, HttpServletRequest request) {
		
		DepartmentBean dbp = new DepartmentBean();
		try {
			List<DepartmentBean> sorceList = this.service.initDepartList(dbp);
			return sorceList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}
	
	/**
	 * 民族列表
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/nationList")
	public List<Nation> positionList(HttpServletResponse response, HttpServletRequest request) {
		List<Nation> nList = new ArrayList<>();
		try {
			nList = this.service.initNationList();
			System.out.println("项目列表" + nList.size());
			return nList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}
	
	/**
	 * 职位列表
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/positionList")
	public List<Position> nationList(HttpServletResponse response, HttpServletRequest request) {
		List<Position> pList = new ArrayList<>();
		try {
			pList = this.service.initPositionList();
			System.out.println("positionList" + pList.size());
			return pList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}
	
	/**
	 * 离职原因列表
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/leaveReasonList")
	public List<LeaveResign> leaveReasonList(HttpServletResponse response, HttpServletRequest request) {
		List<LeaveResign> lrList = new ArrayList<>();
		try {
			lrList = this.service.initLeaveList();
			System.out.println("lrList" + lrList.size());
			return lrList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}
	
	/**
	 * 查询部门名称
	 * @param dpList 部门列表 dpId部门id
	 * @return
	 */
	public String departName(List<DepartmentBean> dpList,String dpId) {
		String dpName = new String();
//		System.out.println("-------部门列表和部门id----------"+dpList.size());
		for (DepartmentBean departmentBean : dpList) {
			DepartmentBean dp = departmentBean;
			if (dp.getID().equals(dpId)) {
				dpName=dp.getName();
				return dpName;
			}
		}
		return "";
	}

	/**
	 * 家庭成员列表
	 * 
	 * @param param
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/familyList")
	public List<QueryFamilyResult> familyList(HttpServletResponse response,HttpServletRequest request) {
		List<QueryFamilyResult> qfrList = new ArrayList<>();
		QueryParam qParam = new QueryParam();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		qParam.setChName(mapList.get("chName"));
		qParam.setChName(mapList.get("empName"));
		qParam.setChName(mapList.get("shBirth"));
		try {
			qfrList = this.service.initFamilList(qParam, request);
			System.out.println("家庭人员列表" + qfrList.size());
			return qfrList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}

	/**------------------------------------------------------------------个人信息----------------------------------------------------------------------
	 * 获取单个用户基础信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/singleUBInfo")
	public UserInfo requireUserBaseInfo(HttpServletResponse response, HttpServletRequest request) {
		List<UserInfo> uList = new ArrayList<>();
		UserInfo userInfo = new UserInfo();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		
		
		userInfo.setUserId(Integer.valueOf(mapList.get("userId")));
		uList = this.service.searchUBInfo(userInfo);
		
		//通过账号Id找账号的名字和职位的名字
		if (uList.size()>0) {
			System.out.println("requireUserBaseInfo---"+uList.size());
			userInfo = uList.get(0);
			return userInfo;
		}else {
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
		
	}
	
	/**
	 * 通过账户查找职位名称和ID
	 * @param account
	 * @return
	 */
	public Account requireDepartName(Account accountId) {
		List<Account> aList = this.service.selectAccountList(accountId);
		Account account = aList.get(0);
		return account;
	}
	
	/**
	 * 获取单个用户详细信息
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/singleUDInfo")
	public List<UserInfo> requireUserDetailInfo(HttpServletResponse response, HttpServletRequest request) {
		List<UserInfo> uList = new ArrayList<>();
		UserInfo userInfo = new UserInfo();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		
		userInfo.setuEmployeeBasicID(Integer.valueOf(mapList.get("userId")));
		System.out.println("---requireUserDetailInfo----"+userInfo.getuEmployeeBasicID());
		uList = this.service.searchUDInfo(userInfo);
		
		return uList;
	}
	
	/**
	 * 个人的家庭成员信息
	 * 
	 * @param param
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/singlefamilyList")
	public List<QueryFamilyResult> singlefamilyList(HttpServletResponse response, HttpServletRequest request) {
		List<QueryFamilyResult> qfrList = new ArrayList<>();
		QueryFamilyResult qFResult= new QueryFamilyResult();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		qFResult.setuAccountId(mapList.get("accountId"));
		try {
			qfrList = this.service.singleFamilyList(qFResult);
			System.out.println("家庭人员列表" + qfrList.size());
			return qfrList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 更新用户基础信息
	 * 
	 * @param param
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/uUpdateUserInfo")
	public void updateUserBaseInfo(HttpServletResponse response, HttpServletRequest request) {

		
		UserInfo userInfo = new UserInfo();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		
		userInfo.setuSex(mapList.get("userId"));
		//基本信息
		userInfo.setuSex(mapList.get("uName"));
		userInfo.setuSex(mapList.get("uSex"));
		userInfo.setuSex(mapList.get("uBirth"));
		userInfo.setuSex(mapList.get("uAccount"));
		userInfo.setuSex(mapList.get("uDepartment_id"));
		userInfo.setuSex(mapList.get("positionId"));
		userInfo.setuSex(mapList.get("uEntryDte"));
		userInfo.setuSex(mapList.get("uPositiveDate"));
		userInfo.setuSex(mapList.get("uResignDate"));
		userInfo.setuSex(mapList.get("uResignType"));
		userInfo.setuSex(mapList.get("uResignReason"));
		userInfo.setuSex(mapList.get("uState"));
		userInfo.setuSex(mapList.get("uRemark"));
		//详细信息
		userInfo.setuSex(mapList.get("uIdNum"));
		userInfo.setuSex(mapList.get("uPloitical"));
		userInfo.setuSex(mapList.get("uHomeTown"));
		userInfo.setuSex(mapList.get("uNationality"));
		userInfo.setuSex(mapList.get("uMarital"));
		userInfo.setuSex(mapList.get("uHomeAddress"));
		userInfo.setuSex(mapList.get("uCurrentAddress"));
		userInfo.setuSex(mapList.get("uDomicile"));
		userInfo.setuSex(mapList.get("uAccountProp"));
		
		userInfo.setuSex(mapList.get("uSchools"));
		userInfo.setuSex(mapList.get("uEducation"));
		userInfo.setuSex(mapList.get("uProfession"));
		userInfo.setuSex(mapList.get("uGraduation"));
		userInfo.setuSex(mapList.get("uAtSchool"));
		
		userInfo.setuSex(mapList.get("uContact"));
		userInfo.setuSex(mapList.get("uEmergencyContact"));
		userInfo.setuSex(mapList.get("uEmergencyphone"));
		
		userInfo.setuSex(mapList.get("uLicenseType"));
		userInfo.setuSex(mapList.get("uDrivingExpe"));
		
		Integer baseInfoInt = this.service.updataBaselInfo(userInfo);
		Integer detailInfoInt = this.service.updataDetialInfo(userInfo);
		if (baseInfoInt==1&&detailInfoInt==1) {
			ResponseMessageUtils.responseMessage(response, "插入成功!");
		}else {
			ResponseMessageUtils.responseMessage(response, "插入失败!");
		}
	}
	
	

	/**
	 * 插入用户基础信息
	 * 
	 * @param param
	 * @param response
	 * @param request
	 * @return
	 * 
	 * 注：员工入职的姓名、性别、工号、ERP账号、部门是必填的
	 * 	1、工号和ERP账号没有规则，只要不和数据库冲突就可以使用
	 * 	2、通过ERP账号自动生成账号的相关信息，包括初始密码、id、状态
	 */
	@ResponseBody
	@RequestMapping(value = "/uBaseInfo")
	public Map<String, String> userBaseInfo(HttpServletResponse response, HttpServletRequest request) {

		UserInfo userInfo = new UserInfo();
		Account account = new Account();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		Map<String, String> resultM = new HashMap<>();
		
			
		
		userInfo.setuName(mapList.get("Name"));
		List<UserInfo> uList = this.service.searchUBInfo(userInfo);
		
		
		if (uList.size()>0) {
			resultM.put("0", "姓名已存在");
			return resultM;
		}
		
		userInfo = new UserInfo();
		userInfo.setuName(mapList.get("JobNum"));
		List<UserInfo> jList = this.service.searchUBInfo(userInfo);
		if (jList.size()>0) {
			resultM.put("0", "工号已存在");
			return resultM;
		}
		
		account.setAccountName(mapList.get("Account_Name"));
		List<Account> aList = this.service.selectAccountList(account);
		if (aList.size()>0) {
			resultM.put("0", "ERP账号已存在");
			return resultM;
		}else {
			account.setPositionId(mapList.get("Position_Name"));
			Integer isSucess=this.service.insertAccountInfo(account);
			if (isSucess==1) {
				aList = this.service.selectAccountList(account);
				account=aList.get(0);
				userInfo.setuAccount(account.getAccountId());
			}
		}
			
		
		userInfo.setuName(mapList.get("Name"));
		userInfo.setuName(mapList.get("JobNum"));
		
			//基本信息
			userInfo.setuSex(mapList.get("Sex"));
			userInfo.setuDepartment_id(mapList.get("DepartmentId"));
			userInfo.setuBirth(mapList.get("Birth"));
			
			userInfo.setPositionId(mapList.get("Position_Name"));
			userInfo.setuEntryDte(mapList.get("EntryDte"));
			userInfo.setuPositiveDate(mapList.get("PositiveDate"));
			userInfo.setuResignDate(mapList.get("ResignDate"));
			userInfo.setuRemark(mapList.get("Remark"));
			//详细信息
			userInfo.setuIdNum(mapList.get("IdNum"));
			userInfo.setuPloitical(mapList.get("ploitical"));
			userInfo.setuHomeTown(mapList.get("homeTown"));
			userInfo.setuNationality(mapList.get("nationality"));
			userInfo.setuMarital(mapList.get("marital"));
			userInfo.setuHomeAddress(mapList.get("homeAddress"));
			userInfo.setuCurrentAddress(mapList.get("currentAddress"));
			userInfo.setuDomicile(mapList.get("domicile"));
			userInfo.setuAccountProp(mapList.get("accountProp"));
				
			userInfo.setuSchools(mapList.get("schools"));
			userInfo.setuEducation(mapList.get("education"));
			userInfo.setuProfession(mapList.get("profession"));
			userInfo.setuGraduation(mapList.get("graduation"));
			userInfo.setuAtSchool(mapList.get("atSchool"));
					
			userInfo.setuContact(mapList.get("contact"));
			userInfo.setuEmergencyContact(mapList.get("emergencyContact"));
			userInfo.setuEmergencyphone(mapList.get("emergencyPhone"));
					
			userInfo.setuLicenseType(mapList.get("licenseType"));
			userInfo.setuDrivingExpe(mapList.get("drivingExpe"));		
			

			String newDate = ToolClass.strDateTimeStr(new Date());
			userInfo.setuCreateDate(newDate);
			userInfo.setuUpdateDate(newDate);
			userInfo.setuAtSchool("0");

			//插入用户基本信息，在进行查询人员ID，在进行插入详细信息
			this.service.insertUserInfo(userInfo);
			List<UserInfo> userlist = this.service.searchUBInfo(userInfo);
			Integer userId = userlist.get(0).getUserId();
			String uid = String.valueOf(userId);
			// System.out.println("---------人员ID-----------"+uid);

			// 设置上传时间、上传的人
			userInfo.setuEmployeeBasicID(Integer.valueOf(uid));

			// System.out.println("---------人员ID-----------"+param.getuEmployeeBasicID());
			this.service.insertUserDetailInfo(userInfo);
			resultM.put("0", "成员插入成功");
			return resultM;
		
		
	}
	
	/**
	 * 添加ERP账号
	 * @param uInfo 账号的基本信息：初始密码，状态，职位id
	 * @return
	 */
//	public UserInfo insertAccountInfo(UserInfo uInfo) {
//		
//	}
	


	/**
	 * 插入家庭信息
	 * 
	 * @param param
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/ufInfo")
	public String userFamilyDetailInfo(HttpServletResponse response, HttpServletRequest request) {
		boolean isBool;
		UserFamily ufInfo = new UserFamily();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		
//		ufInfo.setAccountId(mapList.get("accountId"));
//		ufInfo.setAddress(mapList.get("address"));
//		ufInfo.setAppellation(mapList.get("appellation"));
//		ufInfo.setBirthtay(mapList.get("birthtay"));
//		ufInfo.setName(mapList.get("name"));
//		ufInfo.setPhone(mapList.get("phone"));
//		ufInfo.setPosition(mapList.get("position"));
//		ufInfo.setWechat(mapList.get("wechat"));
//		ufInfo.setWorkAddress(mapList.get("workAddress"));
		try {
//			isBool = this.service.insertUserFmInfo(ufInfo);
//			System.out.println("家庭人员列表" + isBool);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "插入失败!");
			return null;
		}
	}
	
	/**
	 * 查询用户的职位的调动信息
	 * @param response
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/positionShifts")
	public List<PositionShift> positionShifts(HttpServletResponse response, HttpServletRequest request) {
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		PositionShift pShift = new PositionShift();
		pShift.setAccountId(mapList.get("AccountId"));
		
		List<PositionShift> psList = this.service.selectShiftInfo(pShift);
		return psList;
	}
	

	/**
	 * 家庭成员检索 这里没有用
	 * 
	 * @param param
	 * @param response
	 * @param request
	 * @return
	 */
	// @RequestMapping(value ="/fmList")
	public ModelAndView searchFmyList(QueryParam param, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		try {
			this.service.initFamilList(param, request);
			System.out.println("是不是这里？1");
			mv.setViewName("employee");
			System.out.println("是不是这里？2");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询失败!");
			return null;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/newDate")
	public String inquirNewDate(HttpServletResponse response, HttpServletRequest request) {
		return new ToolClass().inquirNowDate();
	}

	/**
	 * 测试
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	 @ResponseBody
	 @RequestMapping(value ="/testList")
	 public Collection<QueryResult> testJson(HttpServletResponse response, HttpServletRequest request){
		 
		 String s;
			try {
				s = StreamUtils.copyToString(request.getInputStream(), Charset.forName("UTF-8"));
				JSONObject jsonObject = JSONObject.fromObject(s);
				Map<String, String> mapList = (Map<String, String>)jsonObject;			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		 
		 Collection<QueryResult> qResults = new ArrayList<>();
		 qResults.add(new
		 QueryResult("rev","rev","rev","rev","rev","rev","rev","rev","rev","rev","rev","rev"));
		 qResults.add(new
		 QueryResult("rev1","rev2","rev1","rev1","rev1","rev1","re1v","re1v","r1ev","rev1","r1ev","re1v"));
		 return qResults;
	 }

	/**
	 * 测试
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/export")
    @ResponseBody
    public void exportExcel(String index,HttpServletRequest request,HttpServletResponse response) throws Exception {
       System.out.println("您来了"+index);
     //设置响应正文的MIME类型，该类型表示Excel
       request.setCharacterEncoding("gbk");
       response.setContentType("application/vnd.ms-excel");
       String name = request.getParameter("name");
       String pwd =request.getParameter("pwd");
       String sex = request.getParameter("sex");
       System.out.println(sex);
       String age = request.getParameter("age");
       String email = request.getParameter("email");
       
       ServletOutputStream out = response.getOutputStream();   //响应输出流对象
       HSSFWorkbook wb = new HSSFWorkbook();                   //创建Excel表格
       HSSFSheet sheet = wb.createSheet("用户注册信息");       //创建工作薄
       sheet.setColumnWidth(4, 5000);                          //设置列宽
       
       HSSFRow titleRow = sheet.createRow(0);                  //创建Excel中的标题栏,第1行
       
       HSSFCell titleCell1 = titleRow.createCell(0);            //在行中创建第1个单元格
       titleCell1.setCellValue("用户姓名");                     //设置第1个单元格的值
       HSSFCell titleCell2= titleRow.createCell(1);             //在行中创建第2个单元格
       titleCell2.setCellValue("密码");                         //设置第2个单元格的值
       HSSFCell titleCell3 =titleRow .createCell(2);            //在行中创建第3个单元格
       titleCell3.setCellValue("性别");                         //设置第3个单元格的值
       HSSFCell titleCell4= titleRow.createCell(3);             //在行中创建第4个单元格
       titleCell4.setCellValue("年龄");                         //设置第4个单元格的值
       HSSFCell titleCell5= titleRow.createCell(4);             //在行中创建第5个单元格
       titleCell5.setCellValue("Email");                        //设置第5个单元格的值
       
       HSSFRow valueRow = sheet.createRow(1);                  //创建第2行
       
       HSSFCell nameCell = valueRow.createCell(0);             //在第2行中创建单元格
       nameCell.setCellValue(name);
       HSSFCell pwdCell = valueRow.createCell(1);
       pwdCell.setCellValue(pwd);
       HSSFCell sexCell = valueRow.createCell(2);
       sexCell.setCellValue(sex);
       HSSFCell ageCell = valueRow.createCell(3);
       ageCell.setCellValue(age);
       HSSFCell emailCell = valueRow.createCell(4);
       emailCell.setCellValue(email);
       
       HSSFCellStyle cellStyle = wb.createCellStyle();
       wb.write(out);                                   //将响应流输入到Excel表格中
       out.flush();
	}

	
}
