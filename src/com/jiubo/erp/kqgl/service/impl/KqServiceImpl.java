package com.jiubo.erp.kqgl.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiubo.erp.kqgl.bean.AttLeaveTypeBean;
import com.jiubo.erp.kqgl.bean.AttRuleTypeBean;
import com.jiubo.erp.kqgl.bean.AttShiftScheduleBean;
import com.jiubo.erp.kqgl.bean.AttshiftGroupBean;
import com.jiubo.erp.kqgl.bean.PositionDataBean;
import com.jiubo.erp.kqgl.bean.PositionTypeBean;
import com.jiubo.erp.kqgl.dao.kqglDao;
import com.jiubo.erp.kqgl.service.KqService;
import com.jiubo.erp.kqgl.vo.ClassTime;
import com.jiubo.erp.kqgl.vo.KqInfoResult;
import com.jiubo.erp.kqgl.vo.PositionResultInfo;
import com.jiubo.erp.kqgl.vo.PunchRecord;
import com.jiubo.erp.kqgl.vo.ScheduleQueryResult;
import com.jiubo.erp.rygl.bean.DepartmentBean;

@Service
@Transactional
public class KqServiceImpl implements KqService {
	
	@Autowired
	private kqglDao dao;
	
	@Override
	public List<KqInfoResult> selectKqInfoList(){
		List<KqInfoResult> kqInfoList = this.dao.selectKqInfoList();
		return kqInfoList;
	}
	
	@Override
	public List<KqInfoResult> searchKqInfoList(KqInfoResult kResult){
		List<KqInfoResult> kqInfoList = this.dao.searchKqInfoList(kResult);
		return kqInfoList;
	}
	
	@Override
	public List<ClassTime> selectClassTimeList(ClassTime ct){
		return this.dao.selectClassTimeList(ct);
	}
	@Override
	public List<PositionTypeBean> selectPositionTypeList() {
		// TODO Auto-generated method stub
		return dao.selectPositionTypeList();
	}
	
	@Override
	public List<PunchRecord> selectPunchRecordList(PunchRecord pRecord){
		
		return dao.selectPunchRecordList(pRecord);
	}

	@Override
	public int updatePositionType(PositionTypeBean bean) {
		// TODO Auto-generated method stub
		return dao.updatePositionType(bean);
	}

	@Override
	public int DeletePositionType(PositionTypeBean bean) {
		// TODO Auto-generated method stub
		return dao.DeletePositionType(bean);
	}

	@Override
	public int addPositionType(PositionTypeBean bean) {
		// TODO Auto-generated method stub
		return dao.addPositionType(bean);
	}

	@Override
	public List<PositionResultInfo> selectPositionInfo() {
		// TODO Auto-generated method stub
		return dao.selectPositionInfo();
	}

	@Override
	public int addPositionInfo(PositionDataBean input) {
		// TODO Auto-generated method stub
		return dao.addPositionInfo(input);
	}

	@Override
	public List<AttshiftGroupBean> selectAttshiftGroupList() {
		// TODO Auto-generated method stub
		return dao.selectAttshiftGroupList();
	}

	@Override
	public int addAttshiftGroup(AttshiftGroupBean input) {
		// TODO Auto-generated method stub
		return dao.addAttshiftGroup(input);
	}

	@Override
	public List<AttLeaveTypeBean> selectAttLeaveTypelist() {
		// TODO Auto-generated method stub
		return dao.selectAttLeaveTypelist();
	}

	@Override
	public int addAttLeaveType(AttLeaveTypeBean bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DepartmentBean> selectDepartMentInfo() {
		// TODO Auto-generated method stub
		return dao.selectDepartMentInfo();
	}

	@Override
	public int addDeapartment(DepartmentBean input) {
		// TODO Auto-generated method stub
		return dao.addDeapartment(input);
	}

	@Override
	public List<ScheduleQueryResult> selectScheduleResult() {
		// TODO Auto-generated method stub
		return dao.selectScheduleResult();
	}

	@Override
	public int addAttShiftSchedule(AttShiftScheduleBean ShiftSchedule) {
		// TODO Auto-generated method stub
		return dao.addAttShiftSchedule(ShiftSchedule);
	}

	@Override
	public List<AttRuleTypeBean> selectRultTypeInfo() {
		// TODO Auto-generated method stub
		return dao.selectRultTypeInfo();
	}

	@Override
	public int addRuleTypeInfo(AttRuleTypeBean bean) {
		// TODO Auto-generated method stub
		return dao.addRuleTypeInfo(bean);
	}


}
