package com.projectMatrix.to;

import com.projectMatrix.model.Job;
import com.projectMatrix.model.ProjectUom;

public class JobUomTo {
	private Long jobUomId;
	private long projectUom;
	private long job;
	private String uomName;
	private Integer value;
	public Long getJobUomId() {
		return jobUomId;
	}
	public void setJobUomId(Long jobUomId) {
		this.jobUomId = jobUomId;
	}
	
	public long getProjectUom() {
		return projectUom;
	}
	public void setProjectUom(long projectUom) {
		this.projectUom = projectUom;
	}
	public long getJob() {
		return job;
	}
	public void setJob(long job) {
		this.job = job;
	}
	public String getUomName() {
		return uomName;
	}
	public void setUomName(String uomName) {
		this.uomName = uomName;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}

	

}
