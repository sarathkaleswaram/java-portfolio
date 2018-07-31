package com.projectMatrix.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Resource;
import com.projectMatrix.to.ResourceTo;
import com.projectMatrix.utils.DateUtil;

@Component
public class ResourceToResourceToMapper {
	public void map(ResourceTo resourceTo, Resource resource)
			throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

		resource.setAltMobileNo(resourceTo.getAltMobileNo());
		resource.setCurntAdress(resourceTo.getCurntAdress());

		if (resourceTo.getDept() != null) {
			if (resourceTo.getDept().getDeptId() > 0) {
				resource.setDept(resourceTo.getDept());
			}
		}
		if (resourceTo.getSubDept() != null) {
			if (resourceTo.getSubDept().getSubDeptId() > 0) {
				resource.setSubDept(resourceTo.getSubDept());
			}
		}

		resource.setDesignation(resourceTo.getDesignation());
		if (!resourceTo.getDob().isEmpty()) {
			resource.setDob(dateFormat.parse(resourceTo.getDob()));
		}
		if (!resourceTo.getDoj().isEmpty()) {
			resource.setDoj(dateFormat.parse(resourceTo.getDoj()));
		}
		resource.setEmgContactNo(resourceTo.getEmgContactNo());
		resource.setEmpId(resourceTo.getEmpId());
		resource.setFirstName(resourceTo.getFirstName());
		resource.setMiddleName(resourceTo.getMiddleName());
		resource.setLastName(resourceTo.getLastName());
		resource.setMobileNo(resourceTo.getMobileNo());
		resource.setPerformanceLevel(resourceTo.getPerformanceLevel());
		resource.setSkills(resourceTo.getSkills());
		resource.setOfficialEmail(resourceTo.getOfficialEmail());
		resource.setPersonalEmail(resourceTo.getPersonalEmail());
		resource.setPrmtAddress(resourceTo.getPrmtAddress());
		resource.setProjectScope(resourceTo.getProjectScope());
		resource.setProjectsWorkedOn(resourceTo.getProjectsWorkedOn());
		resource.setRole(resourceTo.getRole());
		resource.setTotYrsExp(resourceTo.getTotYrsExp());
		resource.setVisas(resourceTo.getVisas());

	}

}
