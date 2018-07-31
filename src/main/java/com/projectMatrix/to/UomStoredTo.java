package com.projectMatrix.to;



public class UomStoredTo {
	private int uomStoredId;
	private int uomId;
	public int getUomId() {
		return uomId;
	}
	public void setUomId(int uomId) {
		this.uomId = uomId;
	}
	private String uom;
	private long project;
	public long getProject() {
		return project;
	}
	public void setProject(long project) {
		this.project = project;
	}
	private long jobStage;
	private Integer value;
	
	public int getUomStoredId() {
		return uomStoredId;
	}
	public void setUomStoredId(int uomStoredId) {
		this.uomStoredId = uomStoredId;
	}
	
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public long getJobStage() {
		return jobStage;
	}
	public void setJobStage(long jobStage) {
		this.jobStage = jobStage;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	
}
