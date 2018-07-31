package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Dept;
import com.projectMatrix.to.DeptTo;


@Component
public class DeptToDeptToMapper {
	public void map(Dept dept,DeptTo deptTo){
		deptTo.setDeptId(dept.getDeptId());
		deptTo.setDeptName(dept.getDeptName());
//		deptTo.setResources(dept.getResources());
		
	}

}
