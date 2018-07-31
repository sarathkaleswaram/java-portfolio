package com.projectMatrix.to;

import java.util.HashSet;
import java.util.Set;

import com.projectMatrix.model.Resource;

public class DeptTo {
	
	private Integer deptId;
	private String deptName;
	private Set<Resource> resources = new HashSet<Resource>(0);
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public Set<Resource> getResources() {
		return resources;
	}
	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}


}
