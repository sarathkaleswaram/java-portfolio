package com.projectMatrix.mapper;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Resource;
import com.projectMatrix.to.ResourceTo;
import com.projectMatrix.to.WsResourceTo;

@Component
public class ResourceToToResourceMapper {
	public void map(Resource resource, ResourceTo resourceTo) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		resourceTo.setAltMobileNo(resource.getAltMobileNo());
		resourceTo.setCurntAdress(resource.getCurntAdress());
		if (resource.getDept() != null) {
			resourceTo.setDept1(resource.getDept().getDeptId());
			resourceTo.setDeptName(resource.getDept().getDeptName());
		}
		resourceTo.setDesignation(resource.getDesignation());
		
		if (resource.getDob() != null) {
			resourceTo.setDob(dateFormat.format(resource
					.getDob()));
		}
		if (resource.getDoj() != null) {
			resourceTo.setDoj(dateFormat.format(resource
					.getDoj()));
		}
		resourceTo.setEmgContactNo(resource.getEmgContactNo());
		resourceTo.setEmpId(resource.getEmpId());
		resourceTo.setFirstName(resource.getFirstName());
		resourceTo.setMiddleName(resource.getMiddleName());
		resourceTo.setLastName(resource.getLastName());
		resourceTo.setMobileNo(resource.getMobileNo());
		resourceTo.setOfficialEmail(resource.getOfficialEmail());
		// resourceTo.setPerformance(resource.getPerformance());
		resourceTo.setPersonalEmail(resource.getPersonalEmail());
		resourceTo.setPrmtAddress(resource.getPrmtAddress());
		resourceTo.setProjectScope(resource.getProjectScope());
		resourceTo.setProjectsWorkedOn(resource.getProjectsWorkedOn());
		resourceTo.setResourceId(resource.getResourceId());
		resourceTo.setRole(resource.getRole());
		resourceTo.setSkills(resource.getSkills());
		if (resource.getSubDept() != null) {
			resourceTo.setSubDept1(resource.getSubDept().getSubDeptId());
			resourceTo.setSubDeptName(resource.getDept().getDeptName());
		}
		resourceTo.setTotYrsExp(resource.getTotYrsExp());
		resourceTo.setVisas(resource.getVisas());
		/*
		 * resourceTo.setResourceAllocationsForProductionAllocatedId(resource.
		 * getResourceAllocationsForProductionAllocatedId());
		 * resourceTo.setResourceAllocationsForQaAllocatedId(resource.
		 * getResourceAllocationsForQaAllocatedId());
		 * resourceTo.setResourceAllocationsForQcAllocatedId(resource.
		 * getResourceAllocationsForQcAllocatedId());
		 * resourceTo.setResourceAllocationsForFeedbackAllocatedId(resource.
		 * getResourceAllocationsForFeedbackAllocatedId());
		 * resourceTo.setProjects(resource.getProjects());
		 */

	}

	public void wsMap(Resource resource, WsResourceTo resourceTo){
	
		if(resource.getEmpId()!=null){
		resourceTo.setEmpId(resource.getEmpId());
		}
		if(resource.getFirstName()!=null){
		resourceTo.setFirstName(resource.getFirstName()+" "+resource.getLastName());
		}
		/*resourceTo.setMiddleName(resource.getMiddleName());
		resourceTo.setLastName(resource.getLastName());*/
		if(resource.getMobileNo()!=null){
		resourceTo.setMobileNo(resource.getMobileNo());
		}
		if(resource.getOfficialEmail()!=null){
		resourceTo.setOfficialEmail(resource.getOfficialEmail());
		}
		if(resource.getDesignation()!=null){
		resourceTo.setDesignation(resource.getDesignation());
		}
}
	public void ccMap(Resource resource, ResourceTo resourceTo) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		resourceTo.setAltMobileNo(resource.getAltMobileNo());
		resourceTo.setCurntAdress(resource.getCurntAdress());
		if (resource.getDept() != null) {
			resourceTo.setDept1(resource.getDept().getDeptId());
			resourceTo.setDeptName(resource.getDept().getDeptName());
		}
		resourceTo.setDesignation(resource.getDesignation());
		
		if (resource.getDob() != null) {
			resourceTo.setDob(dateFormat.format(resource
					.getDob()));
		}
		if (resource.getDoj() != null) {
			resourceTo.setDoj(dateFormat.format(resource
					.getDoj()));
		}
		resourceTo.setEmgContactNo(resource.getEmgContactNo());
		resourceTo.setEmpId(resource.getEmpId());
		resourceTo.setFirstName(resource.getFirstName()+" "+resource.getLastName());
		/*resourceTo.setMiddleName(resource.getMiddleName());
		resourceTo.setLastName(resource.getLastName());*/
		resourceTo.setMobileNo(resource.getMobileNo());
		resourceTo.setOfficialEmail(resource.getOfficialEmail());
		// resourceTo.setPerformance(resource.getPerformance());
		resourceTo.setPersonalEmail(resource.getPersonalEmail());
		resourceTo.setPrmtAddress(resource.getPrmtAddress());
		resourceTo.setProjectScope(resource.getProjectScope());
		resourceTo.setProjectsWorkedOn(resource.getProjectsWorkedOn());
		resourceTo.setResourceId(resource.getResourceId());
		resourceTo.setRole(resource.getRole());
		resourceTo.setSkills(resource.getSkills());
		if (resource.getSubDept() != null) {
			resourceTo.setSubDept1(resource.getSubDept().getSubDeptId());
			resourceTo.setSubDeptName(resource.getDept().getDeptName());
		}
		resourceTo.setTotYrsExp(resource.getTotYrsExp());
		resourceTo.setVisas(resource.getVisas());
		/*
		 * resourceTo.setResourceAllocationsForProductionAllocatedId(resource.
		 * getResourceAllocationsForProductionAllocatedId());
		 * resourceTo.setResourceAllocationsForQaAllocatedId(resource.
		 * getResourceAllocationsForQaAllocatedId());
		 * resourceTo.setResourceAllocationsForQcAllocatedId(resource.
		 * getResourceAllocationsForQcAllocatedId());
		 * resourceTo.setResourceAllocationsForFeedbackAllocatedId(resource.
		 * getResourceAllocationsForFeedbackAllocatedId());
		 * resourceTo.setProjects(resource.getProjects());
		 */

	}
	
	
}