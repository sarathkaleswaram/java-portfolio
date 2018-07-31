package com.projectMatrix.to;

import com.projectMatrix.model.Job;

public class JobsCompletedTo {
	private long jobCompletedId;
	private Job job;
	private String jobCompletedName;

	public long getJobCompletedId() {
		return jobCompletedId;
	}

	public void setJobCompletedId(long jobCompletedId) {
		this.jobCompletedId = jobCompletedId;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getJobCompletedName() {
		return jobCompletedName;
	}

	public void setJobCompletedName(String jobCompletedName) {
		this.jobCompletedName = jobCompletedName;
	}

}
