package com.projectMatrix.to;

import com.projectMatrix.model.WorkBench;

public class WorkBenchJobTo {

	private Long workbenchJobId;
	private String job;
	private WorkBench workBench;
	private String jobStage;
	private String spentTimeOnJob;
	
	public Long getWorkbenchJobId() {
		return workbenchJobId;
	}
	public void setWorkbenchJobId(Long workbenchJobId) {
		this.workbenchJobId = workbenchJobId;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public WorkBench getWorkBench() {
		return workBench;
	}
	public void setWorkBench(WorkBench workBench) {
		this.workBench = workBench;
	}
	public String getJobStage() {
		return jobStage;
	}
	public void setJobStage(String jobStage) {
		this.jobStage = jobStage;
	}
	public String getSpentTimeOnJob() {
		return spentTimeOnJob;
	}
	public void setSpentTimeOnJob(String spentTimeOnJob) {
		this.spentTimeOnJob = spentTimeOnJob;
	}

	
	
	
}
