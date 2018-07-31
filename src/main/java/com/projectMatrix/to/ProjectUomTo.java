package com.projectMatrix.to;


public class ProjectUomTo {
	private Long projectUomId;
	private String uom;
	private int uomId;
	public int getUomId() {
		return uomId;
	}
	public void setUomId(int uomId) {
		this.uomId = uomId;
	}
	private long project;
	public Long getProjectUomId() {
		return projectUomId;
	}
	public void setProjectUomId(Long projectUomId) {
		this.projectUomId = projectUomId;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public long getProject() {
		return project;
	}
	public void setProject(long project) {
		this.project = project;
	}

}
