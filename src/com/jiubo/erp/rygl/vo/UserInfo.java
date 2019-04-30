package com.jiubo.erp.rygl.vo;

import java.util.List;

public class UserInfo {
	
	//基础信息
	private Integer userId;
	private String uName;
	private String uSex;
	private String uJobNum;
	private String uDepartment_id;
	private String positionId;
	private String uBirth;
	private String uEntryDte;
	private String uPositiveDate;
	private String uResignDate;
	private String uPhoto;
	private String uIsDelete;
	private String uState;
	private String uAccount;
	private String uAccountId;
	private String uParent_ID;
	private String uResignType;
	private String uResignReason;
	
	//详细信息
	private Integer uEmployeeBasicID;
	private String uIdNum;
	private String uPloitical;
	private String uContact;
	private String uHomeTown;
	private String uNationality;
	private String uMarital;
	private String uHomeAddress;
	private String uCurrentAddress;
	private String uSchools;
	private String uEducation;
	private String uProfession;
	private String uGraduation;
	private String uEmergencyContact;
	private String uEmergencyphone;
	private String uHeight;
	private String uWeight;
	private String uBloodType;
	private String uLicenseType;
	private String uDrivingExpe;
	private String uDomicile;
	private String uAccountProp;
	private String uAtSchool;
	
	//相同参数
	private String uCreateDate;
	private String uUpdateDate;
	private String uCreateUser;
	private String uRemark;
	
	//家庭成员
	private List<QueryFamilyResult> qFRs;
	
	
	public UserInfo() {
	}


	public List<QueryFamilyResult> getqFRs() {
		return qFRs;
	}


	public void setqFRs(List<QueryFamilyResult> qFRs) {
		this.qFRs = qFRs;
	}


	public String getPositionId() {
		return positionId;
	}




	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}


	public Integer getUserId() {
		return userId;
	}




	public void setUserId(Integer userId) {
		this.userId = userId;
	}




	public String getuName() {
		return uName;
	}




	public void setuName(String uName) {
		this.uName = uName;
	}




	public String getuSex() {
		return uSex;
	}




	public void setuSex(String uSex) {
		this.uSex = uSex;
	}




	public String getuJobNum() {
		return uJobNum;
	}




	public String getuAccountId() {
		return uAccountId;
	}


	public void setuAccountId(String uAccountId) {
		this.uAccountId = uAccountId;
	}


	public void setuJobNum(String uJobNum) {
		this.uJobNum = uJobNum;
	}




	public String getuDepartment_id() {
		return uDepartment_id;
	}




	public void setuDepartment_id(String uDepartment_id) {
		this.uDepartment_id = uDepartment_id;
	}




	public String getuBirth() {
		return uBirth;
	}




	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}




	public String getuEntryDte() {
		return uEntryDte;
	}




	public void setuEntryDte(String uEntryDte) {
		this.uEntryDte = uEntryDte;
	}




	public String getuPositiveDate() {
		return uPositiveDate;
	}




	public void setuPositiveDate(String uPositiveDate) {
		this.uPositiveDate = uPositiveDate;
	}




	public String getuResignDate() {
		return uResignDate;
	}




	public void setuResignDate(String uResignDate) {
		this.uResignDate = uResignDate;
	}




	public String getuPhoto() {
		return uPhoto;
	}




	public void setuPhoto(String uPhoto) {
		this.uPhoto = uPhoto;
	}




	public String getuIsDelete() {
		return uIsDelete;
	}




	public void setuIsDelete(String uIsDelete) {
		this.uIsDelete = uIsDelete;
	}




	public String getuState() {
		return uState;
	}




	public void setuState(String uState) {
		this.uState = uState;
	}




	public String getuAccount() {
		return uAccount;
	}




	public void setuAccount(String uAccount) {
		this.uAccount = uAccount;
	}




	public String getuParent_ID() {
		return uParent_ID;
	}




	public void setuParent_ID(String uParent_ID) {
		this.uParent_ID = uParent_ID;
	}




	public String getuResignType() {
		return uResignType;
	}




	public void setuResignType(String uResignType) {
		this.uResignType = uResignType;
	}




	public String getuResignReason() {
		return uResignReason;
	}




	public void setuResignReason(String uResignReason) {
		this.uResignReason = uResignReason;
	}




	public Integer getuEmployeeBasicID() {
		return uEmployeeBasicID;
	}




	public void setuEmployeeBasicID(Integer uEmployeeBasicID) {
		this.uEmployeeBasicID = uEmployeeBasicID;
	}




	public String getuIdNum() {
		return uIdNum;
	}




	public void setuIdNum(String uIdNum) {
		this.uIdNum = uIdNum;
	}




	public String getuPloitical() {
		return uPloitical;
	}




	public void setuPloitical(String uPloitical) {
		this.uPloitical = uPloitical;
	}




	public String getuContact() {
		return uContact;
	}




	public void setuContact(String uContact) {
		this.uContact = uContact;
	}




	public String getuHomeTown() {
		return uHomeTown;
	}




	public void setuHomeTown(String uHomeTown) {
		this.uHomeTown = uHomeTown;
	}




	public String getuNationality() {
		return uNationality;
	}




	public void setuNationality(String uNationality) {
		this.uNationality = uNationality;
	}




	public String getuMarital() {
		return uMarital;
	}




	public void setuMarital(String uMarital) {
		this.uMarital = uMarital;
	}




	public String getuHomeAddress() {
		return uHomeAddress;
	}




	public void setuHomeAddress(String uHomeAddress) {
		this.uHomeAddress = uHomeAddress;
	}




	public String getuCurrentAddress() {
		return uCurrentAddress;
	}




	public void setuCurrentAddress(String uCurrentAddress) {
		this.uCurrentAddress = uCurrentAddress;
	}




	public String getuSchools() {
		return uSchools;
	}




	public void setuSchools(String uSchools) {
		this.uSchools = uSchools;
	}




	public String getuEducation() {
		return uEducation;
	}




	public void setuEducation(String uEducation) {
		this.uEducation = uEducation;
	}




	public String getuProfession() {
		return uProfession;
	}




	public void setuProfession(String uProfession) {
		this.uProfession = uProfession;
	}




	public String getuGraduation() {
		return uGraduation;
	}




	public void setuGraduation(String uGraduation) {
		this.uGraduation = uGraduation;
	}




	public String getuEmergencyContact() {
		return uEmergencyContact;
	}




	public void setuEmergencyContact(String uEmergencyContact) {
		this.uEmergencyContact = uEmergencyContact;
	}




	public String getuEmergencyphone() {
		return uEmergencyphone;
	}




	public void setuEmergencyphone(String uEmergencyphone) {
		this.uEmergencyphone = uEmergencyphone;
	}




	public String getuHeight() {
		return uHeight;
	}




	public void setuHeight(String uHeight) {
		this.uHeight = uHeight;
	}




	public String getuWeight() {
		return uWeight;
	}




	public void setuWeight(String uWeight) {
		this.uWeight = uWeight;
	}




	public String getuBloodType() {
		return uBloodType;
	}




	public void setuBloodType(String uBloodType) {
		this.uBloodType = uBloodType;
	}




	public String getuLicenseType() {
		return uLicenseType;
	}




	public void setuLicenseType(String uLicenseType) {
		this.uLicenseType = uLicenseType;
	}




	public String getuDrivingExpe() {
		return uDrivingExpe;
	}




	public void setuDrivingExpe(String uDrivingExpe) {
		this.uDrivingExpe = uDrivingExpe;
	}




	public String getuDomicile() {
		return uDomicile;
	}




	public void setuDomicile(String uDomicile) {
		this.uDomicile = uDomicile;
	}




	public String getuAccountProp() {
		return uAccountProp;
	}




	public void setuAccountProp(String uAccountProp) {
		this.uAccountProp = uAccountProp;
	}




	public String getuAtSchool() {
		return uAtSchool;
	}




	public void setuAtSchool(String uAtSchool) {
		this.uAtSchool = uAtSchool;
	}




	public String getuCreateDate() {
		return uCreateDate;
	}




	public void setuCreateDate(String uCreateDate) {
		this.uCreateDate = uCreateDate;
	}




	public String getuUpdateDate() {
		return uUpdateDate;
	}




	public void setuUpdateDate(String uUpdateDate) {
		this.uUpdateDate = uUpdateDate;
	}




	public String getuCreateUser() {
		return uCreateUser;
	}




	public void setuCreateUser(String uCreateUser) {
		this.uCreateUser = uCreateUser;
	}




	public String getuRemark() {
		return uRemark;
	}




	public void setuRemark(String uRemark) {
		this.uRemark = uRemark;
	}


	
}
