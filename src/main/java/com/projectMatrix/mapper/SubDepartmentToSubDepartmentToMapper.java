package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.SubDept;
import com.projectMatrix.to.SubDeptTo;

@Component
public class SubDepartmentToSubDepartmentToMapper {

	public void map(SubDept subDept, SubDeptTo subDeptTo) {
		// TODO Auto-generated method stub
		
		subDeptTo.setSubDeptId(subDept.getSubDeptId());
		subDeptTo.setSubDeptName(subDept.getSubDeptName());
		
	}

}
