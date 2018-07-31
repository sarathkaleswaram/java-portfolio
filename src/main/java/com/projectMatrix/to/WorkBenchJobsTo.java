package com.projectMatrix.to;

import com.projectMatrix.model.Job;
import com.projectMatrix.model.WorkBench;

public class WorkBenchJobsTo {
	
	private Long workBenchJobsPk;
	private WorkBench workBench;
	private Job job;
	private String jobStage;
	private Double spentTime;
	public Long getWorkBenchJobsPk() {
		return workBenchJobsPk;
	}
	public void setWorkBenchJobsPk(Long workBenchJobsPk) {
		this.workBenchJobsPk = workBenchJobsPk;
	}
	public WorkBench getWorkBench() {
		return workBench;
	}
	public void setWorkBench(WorkBench workBench) {
		this.workBench = workBench;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public String getJobStage() {
		return jobStage;
	}
	public void setJobStage(String jobStage) {
		this.jobStage = jobStage;
	}
	public Double getSpentTime() {
		return spentTime;
	}
	public void setSpentTime(Double spentTime) {
		this.spentTime = spentTime;
	}

}
