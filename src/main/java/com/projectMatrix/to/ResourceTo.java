package com.projectMatrix.to;

import java.util.Date;
import java.util.List;

import com.projectMatrix.model.Dept;
import com.projectMatrix.model.Performance;
import com.projectMatrix.model.Skills;
import com.projectMatrix.model.SubDept;

public class ResourceTo {
	private Long resourceId;
	private Dept dept;
	private SubDept subDept;
	
	private int dept1;
	private int subDept1;
	
	private String deptName;
	private String subDeptName;

	private String performanceLevel;
	private List skillsList;
	private List performanceList;
	private String skills;
	private String empId;
	private String firstName;
	private String middleName;
	private String lastName;
	private Long mobileNo;
	private Long altMobileNo;
	private String officialEmail;
	private String personalEmail;
	private Long emgContactNo;
	private String dob;
	private String doj;
	private String curntAdress;
	private String prmtAddress;
	private Integer totYrsExp;
	private String role;
	private String designation;
	private String projectsWorkedOn;
	private String projectScope;
	private String visas;
	private String loginpermson;
	
	public String getLoginpermson() {
		return loginpermson;
	}



	public void setLoginpermson(String loginpermson) {
		this.loginpermson = loginpermson;
	}



	public Long getResourceId() {
		return resourceId;
	}

	

	public List getPerformanceList() {
		return performanceList;
	}


	public void setPerformanceList(List performanceList) {
		this.performanceList = performanceList;
	}




	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	public String getSubDeptName() {
		return subDeptName;
	}


	public void setSubDeptName(String subDeptName) {
		this.subDeptName = subDeptName;
	}



	public int getDept1() {
		return dept1;
	}

	public void setDept1(int dept1) {
		this.dept1 = dept1;
	}

	public int getSubDept1() {
		return subDept1;
	}

	public void setSubDept1(int subDept1) {
		this.subDept1 = subDept1;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public void setSubDept(SubDept subDept) {
		this.subDept = subDept;
	}
	
	
	public void setResourceId(Long resourceId) {
		this.resourceId = resourceId;
	}


	public List getSkillsList() {
		return skillsList;
	}

	public void setSkillsList(List skillsList) {
		this.skillsList = skillsList;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	






	public String getPerformanceLevel() {
		return performanceLevel;
	}

	public void setPerformanceLevel(String performanceLevel) {
		this.performanceLevel = performanceLevel;
	}

	public String getSkills() {
		return skills;
	}


	public Dept getDept() {
		return dept;
	}

	public SubDept getSubDept() {
		return subDept;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Long getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(Long mobileNo) {
		this.mobileNo = mobileNo;
	}

	public Long getAltMobileNo() {
		return altMobileNo;
	}

	public void setAltMobileNo(Long altMobileNo) {
		this.altMobileNo = altMobileNo;
	}

	public String getOfficialEmail() {
		return officialEmail;
	}

	public void setOfficialEmail(String officialEmail) {
		this.officialEmail = officialEmail;
	}

	public String getPersonalEmail() {
		return personalEmail;
	}

	public void setPersonalEmail(String personalEmail) {
		this.personalEmail = personalEmail;
	}

	public Long getEmgContactNo() {
		return emgContactNo;
	}

	public void setEmgContactNo(Long emgContactNo) {
		this.emgContactNo = emgContactNo;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public String getDoj() {
		return doj;
	}


	public void setDoj(String doj) {
		this.doj = doj;
	}


	public String getCurntAdress() {
		return curntAdress;
	}

	public void setCurntAdress(String curntAdress) {
		this.curntAdress = curntAdress;
	}

	public String getPrmtAddress() {
		return prmtAddress;
	}

	public void setPrmtAddress(String prmtAddress) {
		this.prmtAddress = prmtAddress;
	}

	public Integer getTotYrsExp() {
		return totYrsExp;
	}

	public void setTotYrsExp(Integer totYrsExp) {
		this.totYrsExp = totYrsExp;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getProjectsWorkedOn() {
		return projectsWorkedOn;
	}

	public void setProjectsWorkedOn(String projectsWorkedOn) {
		this.projectsWorkedOn = projectsWorkedOn;
	}

	public String getProjectScope() {
		return projectScope;
	}

	public void setProjectScope(String projectScope) {
		this.projectScope = projectScope;
	}

	public String getVisas() {
		return visas;
	}

	public void setVisas(String visas) {
		this.visas = visas;
	}

}
