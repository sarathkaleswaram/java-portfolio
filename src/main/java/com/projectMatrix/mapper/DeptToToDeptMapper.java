package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Dept;
import com.projectMatrix.to.DeptTo;


@Component
public class DeptToToDeptMapper {
	public void map(DeptTo deptTo,Dept dept){
		dept.setDeptId(deptTo.getDeptId());
		dept.setDeptName(deptTo.getDeptName());
//		dept.setResources(deptTo.getResources());
		
	}
	

}
