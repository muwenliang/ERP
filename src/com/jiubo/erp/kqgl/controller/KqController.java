package com.jiubo.erp.kqgl.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.queryparser.flexible.precedence.processors.PrecedenceQueryNodeProcessorPipeline;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.jiubo.erp.erpLogin.util.ResponseMessageUtils;
import com.jiubo.erp.kqgl.service.KqService;
import com.jiubo.erp.kqgl.vo.ClassTime;
import com.jiubo.erp.kqgl.vo.DepartKQ;
import com.jiubo.erp.kqgl.vo.KqInfoResult;
import com.jiubo.erp.kqgl.vo.PunchRecord;
import com.quicksand.push.ToolClass;


@Controller
@RequestMapping("/kqgl")
public class KqController {
	
 @Autowired
 private KqService service;
 
 
 /**
  * 加载当天的全部的用户考勤信息
  * @param request
  * @param response
  * @return
  */
 @ResponseBody
 @RequestMapping(value="/allKQBaseInfo")
 private List<KqInfoResult> allKQInfo(HttpServletRequest request,HttpServletResponse response) {
	
		 try {
		    List<KqInfoResult> kqInfoList = this.service.selectKqInfoList();
		     System.out.println("kqList:"+kqInfoList.size());
		     return kqInfoList;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
			return null;
		}
}
 /**
  * 根据查询条件进行搜索
  * @param request
  * @param response
  * @return
  */
 @ResponseBody
 @RequestMapping(value="/searchKQInfo")
 private List<KqInfoResult> searchKQInfo(HttpServletRequest request,HttpServletResponse response) {
 
	 KqInfoResult kqParam = new KqInfoResult();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		
			
		kqParam.setName(mapList.get("name"));
		kqParam.setDepartname(mapList.get("dpId"));
		kqParam.setPositionName(mapList.get("positionName"));
		kqParam.setJobNum(mapList.get("jobNum"));
		kqParam.setStartDate(mapList.get("beginData"));
		kqParam.setEndDate(mapList.get("endData"));
		
		if (kqParam.getStartDate().equals("")) {
			kqParam.setStartDate(ToolClass.inquirNowDate());
		}
		if (kqParam.getEndDate().equals("")) {
			kqParam.setEndDate(ToolClass.inquirNowDate());
		}
	 System.out.println("---班型测试kqInfoRes----"+kqParam.getEndDate()+kqParam.getStartDate());
	 List<KqInfoResult> kqInfoRes = this.service.searchKqInfoList(kqParam);
	 
	 
	 PunchRecord pRecord= new PunchRecord();
	 
	 try {
	    for (int i=0;i < kqInfoRes.size();i++) {
	    	KqInfoResult kqInfoResult = kqInfoRes.get(i);
	    	pRecord.setYear(kqInfoResult.getShiftDate().substring(0, 3));
	    	pRecord.setMonth(kqInfoResult.getShiftDate().substring(5, 6)); 
	    	pRecord.setDay(kqInfoResult.getShiftDate().substring(8, 9));
	    	pRecord.setUserId(kqInfoResult.getuId());
			System.out.println("打卡参数"+pRecord.getYear()+"-"+pRecord.getMonth()+"-"+pRecord.getDay());
			
			pRecord = this.service.selectPunchRecordList(pRecord).get(0);
			
			String index = new String();
			
			if (pRecord.getMaxAttTime().equals("") && pRecord.getMinAttTime().equals("")) {
				
			}else if(pRecord.getMaxAttTime()==pRecord.getMinAttTime()){
				
				index = completKQInfo(pRecord.getMaxAttTime(),kqInfoResult.getStartTime(), kqInfoResult.getEndTime());
				
				switch (index) {
				case "1":
					kqInfoResult.setFirstTime(pRecord.getMinAttTime());
					kqInfoResult.setFirstTimeState("正常");
					kqInfoResult.setLastTimeState("下班未打卡");
					break;
				case "2":
					kqInfoResult.setFirstTime(pRecord.getMinAttTime());
					kqInfoResult.setFirstTimeState("迟到");
					kqInfoResult.setLastTimeState("下班未打卡");				
					break;
				case "3":
					kqInfoResult.setFirstTime(pRecord.getMinAttTime());
					kqInfoResult.setFirstTimeState("旷工");
					kqInfoResult.setLastTimeState("下班未打卡");
					break;
				case "4":
					kqInfoResult.setFirstTime(pRecord.getMinAttTime());
					kqInfoResult.setLastTime(pRecord.getMaxAttTime());
					kqInfoResult.setFirstTimeState("打卡异常");
					kqInfoResult.setLastTimeState("打卡异常");
					break;
				case "5":
					kqInfoResult.setFirstTime(pRecord.getMinAttTime());
					kqInfoResult.setFirstTimeState("上班未打卡");
					kqInfoResult.setLastTimeState("旷工");
					break;
				case "6":
					kqInfoResult.setFirstTime(pRecord.getMinAttTime());
					kqInfoResult.setFirstTimeState("上班未打卡");
					kqInfoResult.setLastTimeState("早退");				
					break;
				case "7":
					kqInfoResult.setFirstTime(pRecord.getMinAttTime());
					kqInfoResult.setFirstTimeState("上班未打卡");
					kqInfoResult.setLastTimeState("正常");
					break;

				default:
					break;
				}
			}else {
				
				kqInfoResult.setFirstTime(pRecord.getMinAttTime());
				kqInfoResult.setFirstTimeState(completKQInfo(pRecord.getMaxAttTime(),kqInfoResult.getStartTime(), kqInfoResult.getEndTime()));
				kqInfoResult.setFirstTime(pRecord.getMaxAttTime());
				kqInfoResult.setLastTimeState(completKQInfo(pRecord.getMinAttTime(),kqInfoResult.getStartTime(), kqInfoResult.getEndTime()));
				kqInfoRes.set(i, kqInfoResult);
				
				switch (index) {
				case "1":
					
					break;
				case "2":
									
					break;
				case "3":
					
					break;
				case "4":
					
					break;
				case "5":
					
					break;
				case "6":
									
					break;
				case "7":
					
					break;

				default:
					break;
				}
				
			}
			
	    }
	     System.out.println("kqList:"+kqInfoRes.size());
	     return kqInfoRes;
	} catch (Exception e) {
		e.printStackTrace();
		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
		return null;
	}
}
 /**
  * 用来判断打卡时间在那个时间段
  * 上班时间之前---------------返回1-------正常
  * 上班时间之后30分钟内-------返回2-------迟到
  * 上班时间之后30-120分钟内---返回3-------旷工----------
  * 区间----------------------返回4-------上班打卡异常    |
  * 下班时间之前30-180分钟内---返回5-------旷工----------
  * 上班时间之前30分钟内-------返回6-------早退
  * 上班时间------------------返回7--------正常
  * @param mtime 打卡时间
  * @param beginTime 班次的上班时间
  * @param endTime 下班时间
  * @return
  */
 public String completKQInfo(String mTime,String beginTime,String endTime) {
	 Map<String, String> status = new HashMap<>();
	 if (ToolClass.compare_date(mTime, beginTime)<=0) {
		 
		 return "1";
	 }else if (ToolClass.compare_date(mTime, beginTime)>0 &&
				ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 30))<=0) {
		 status.put("2", "迟到");
		 return "2";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 30))>0 &&
			ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 120))<=0) {
		status.put("3", "旷工");
		 return "3";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 120))>0 &&
			ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -180))<=0) {
		status.put("4", "打卡异常");
		 return "4";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -180))>0 &&
			ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -30))<=0) {
		status.put("5", "迟到");
		 return "5";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -30))>0 &&
			ToolClass.compare_date(mTime, endTime)<0) {
		status.put("6", "早退");
		 return "6";
	}else {
		status.put("7", "正常");
		 return "7";
	}
}
 /**
  * 部门考勤的全部信息
  * @param request
  * @param response
  * @return
  */
  @ResponseBody
  @RequestMapping(value="/departKQList")
  private List<DepartKQ> departKQList(HttpServletRequest request,HttpServletResponse response) {
	 DepartKQ dpKq = new DepartKQ();
	 List<DepartKQ> departList = new ArrayList<>();
	 departList.add(dpKq);
 	 try {
 	     System.out.println("departList"+departList.size());
 	     return departList;
 	} catch (Exception e) {
 		e.printStackTrace();
 		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
 		return null;
 	}
 }
 
/**
 * 个人的出勤统计
 * @param request
 * @param response
 * @return
 */
 @ResponseBody
 @RequestMapping(value="/singleKQList")
 private List<KqInfoResult> singleKQList(HttpServletRequest request,HttpServletResponse response) {
	
	 try {
//	     List<KqInfoResult> kqList = this.service.selectKqInfoList(request);
	     return null;
	} catch (Exception e) {
		e.printStackTrace();
		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
		return null;
	}
}


  
  /**
   * 人员出勤统计
   * @param request
   * @param response
   * @return
   */
   @ResponseBody
   @RequestMapping(value="/ryKQList")
   private List<KqInfoResult> ryKQList(HttpServletRequest request,HttpServletResponse response) {
  	
  	 try {
//  	     List<KqInfoResult> kqList = this.service.selectKqInfoList(request);
  	     return null;
  	} catch (Exception e) {
  		e.printStackTrace();
  		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
  		return null;
  	}
  }
   
//   /**
//    * 部门考勤考勤的全部信息
//    * @param request
//    * @param response
//    * @return
//    */
//    @ResponseBody
//    @RequestMapping(value="/departKQList")
//    private List<KqInfoResult> departKQList(HttpServletRequest request,HttpServletResponse response) {
//   	
//   	 try {
//   	     List<KqInfoResult> kqList = this.service.selectKqInfoList(request);
//   	     return kqList;
//   	} catch (Exception e) {
//   		e.printStackTrace();
//   		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
//   		return null;
//   	}
//   }
//    
//    /**
//     * 部门考勤考勤的全部信息
//     * @param request
//     * @param response
//     * @return
//     */
//     @ResponseBody
//     @RequestMapping(value="/departKQList")
//     private List<KqInfoResult> departKQList(HttpServletRequest request,HttpServletResponse response) {
//    	
//    	 try {
//    	     List<KqInfoResult> kqList = this.service.selectKqInfoList(request);
//    	     return kqList;
//    	} catch (Exception e) {
//    		e.printStackTrace();
//    		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
//    		return null;
//    	}
//    }
//     
//     
//     /**
//      * 部门考勤考勤的全部信息
//      * @param request
//      * @param response
//      * @return
//      */
//      @ResponseBody
//      @RequestMapping(value="/departKQList")
//      private List<KqInfoResult> departKQList(HttpServletRequest request,HttpServletResponse response) {
//     	
//     	 try {
//     	     List<KqInfoResult> kqList = this.service.selectKqInfoList(request);
//     	     return kqList;
//     	} catch (Exception e) {
//     		e.printStackTrace();
//     		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
//     		return null;
//     	}
//     }
//      
//      
//      /**
//       * 部门考勤考勤的全部信息
//       * @param request
//       * @param response
//       * @return
//       */
//       @ResponseBody
//       @RequestMapping(value="/departKQList")
//       private List<KqInfoResult> departKQList(HttpServletRequest request,HttpServletResponse response) {
//      	
//      	 try {
//      	     List<KqInfoResult> kqList = this.service.selectKqInfoList(request);
//      	     return kqList;
//      	} catch (Exception e) {
//      		e.printStackTrace();
//      		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
//      		return null;
//      	}
//      }
//       
//       /**
//        * 部门考勤考勤的全部信息
//        * @param request
//        * @param response
//        * @return
//        */
//        @ResponseBody
//        @RequestMapping(value="/departKQList")
//        private List<KqInfoResult> departKQList(HttpServletRequest request,HttpServletResponse response) {
//       	
//       	 try {
//       	     List<KqInfoResult> kqList = this.service.selectKqInfoList(request);
//       	     return kqList;
//       	} catch (Exception e) {
//       		e.printStackTrace();
//       		ResponseMessageUtils.responseMessage(response, "查询错误,请重试!");
//       		return null;
//       	}
//       }
// 
 
 //加载排班信息列表
 //添加排班
 //加载考勤规则列表
 //添加考勤规则

}
