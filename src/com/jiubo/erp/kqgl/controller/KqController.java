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
	
	 	KqInfoResult kqParam = new KqInfoResult();
		Map<String, String> mapList = ToolClass.mapShiftStr(request);
		
			
		kqParam.setName(mapList.get("name"));
		kqParam.setDepartname(mapList.get("dpId"));
		kqParam.setPositionName(mapList.get("positionName"));
		kqParam.setJobNum(mapList.get("jobNum"));
		
		 try {
		    List<KqInfoResult> kqInfoList = this.service.selectKqInfoList(kqParam);
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
	 
	 List<KqInfoResult> kqInfoRes = this.service.searchKqInfoList(kqParam);
//	 System.out.println("---班型测试kqInfoRes----"+kqInfoRes.size()+kqParam.getEndDate()+kqParam.getStartDate());
	 
	 //查询班次数据为空时执行，返回基本信息
	 if (kqInfoRes.size()<1) {
		 kqInfoRes=this.service.selectKqInfoList(kqParam);
//		 System.out.println("kqInfoRes:"+kqInfoRes.size());
		 return kqInfoRes;
	}
	 
	 
	 try {
	    for (int i=0;i < kqInfoRes.size();i++) {
	    	KqInfoResult kqInfoResult = kqInfoRes.get(i);
	    	if (kqInfoResult.getShiftDate() != null) {
	    		System.out.println("getShiftDate"+kqInfoResult.getShiftDate());
	    		PunchRecord pRecord= new PunchRecord();
	    		pRecord.setYear(kqInfoResult.getShiftDate().substring(0, 4));
		    	pRecord.setMonth(kqInfoResult.getShiftDate().substring(6, 7)); 
		    	pRecord.setDay(kqInfoResult.getShiftDate().substring(9, 10));
		    	pRecord.setUserId(kqInfoResult.getuId());
				System.out.println("打卡参数"+pRecord.getYear()+"-"+pRecord.getMonth()+"-"+pRecord.getDay());
				
				List<PunchRecord> prList = this.service.selectPunchRecordList(pRecord);
				pRecord = prList.get(0);
				if (prList.size()>0 && pRecord !=null) {
					
//					System.out.println("prList"+prList.size()+pRecord.toString());
					if ( pRecord.getMaxAttTime()==null && pRecord.getMinAttTime()==null) {
						
					}else {
						
						kqInfoResult.setFirstTime(pRecord.getMinAttTime());
						kqInfoResult.setFirstTimeState(completForeKQInfo(pRecord.getMinAttTime(), kqInfoResult.getStartTime(), kqInfoResult.getEndTime()));
						kqInfoResult.setEndDate(pRecord.getMaxAttTime());
						kqInfoResult.setLastTimeState(completAfterKQInfo(pRecord.getMaxAttTime(), kqInfoResult.getStartTime(), kqInfoResult.getEndTime()));
						
					}
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
  * 上午
  */
 public String completForeKQInfo(String mTime,String beginTime,String endTime) {
	
	 if (ToolClass.compare_date(mTime, beginTime)<=0) {
		 return "正常";
	 }else if (ToolClass.compare_date(mTime, beginTime)>0 &&
				ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 30))<=0) {
		 return "迟到";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 30))>0 &&
			ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 120))<=0) {
		 return "旷工";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 120))>0 &&
			ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -180))<=0) {
		return "打卡异常";
	}else {
		return "上班未打卡";
	}
}
 /**
  * 下午
  * @param mTime
  * @param beginTime
  * @param endTime
  * @return
  */
 public String completAfterKQInfo(String mTime,String beginTime,String endTime) {
	 if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 120))<=0) {
		 return "下班未打卡";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(beginTime, 120))>0 &&
				ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -180))<=0) {
		return "打卡异常";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -180))>0 &&
			ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -30))<=0) {
		 return "旷工";
	}else if (ToolClass.compare_date(mTime, ToolClass.strDateTimeShiftStr(endTime, -30))>0 &&
			ToolClass.compare_date(mTime, endTime)<0) {
		 return "早退";
	}else {
		 return "正常";
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
