package com.projectMatrix.to;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class JobStageTo {
	private Long jobStageId;
	private long job;
	private double hoursSpent;
	private String jobStatus;
	private String jobStage;
	private double hoursEstimated;
	private Date wipTime;
	private Date pauseTime;
	

	

	public Date getWipTime() {
		return wipTime;
	}

	public void setWipTime(Date wipTime) {
		this.wipTime = wipTime;
	}

	public Date getPauseTime() {
		return pauseTime;
	}

	public void setPauseTime(Date pauseTime) {
		this.pauseTime = pauseTime;
	}

	public String getJobStage() {
		return jobStage;
	}

	public void setJobStage(String jobStage) {
		this.jobStage = jobStage;
	}

	

	public void setHoursEstimated(double hoursEstimated) {
		this.hoursEstimated = hoursEstimated;
	}

	public Set getUomStoreds() {
		return uomStoreds;
	}

	public void setUomStoreds(Set uomStoreds) {
		this.uomStoreds = uomStoreds;
	}

	private Set uomStoreds = new HashSet(0);
	
	
	public Long getJobStageId() {
		return jobStageId;
	}

	public void setJobStageId(Long jobStageId) {
		this.jobStageId = jobStageId;
	}



	public long getJob() {
		return job;
	}

	public void setJob(long job) {
		this.job = job;
	}




	public double getHoursSpent() {
		return hoursSpent;
	}

	public void setHoursSpent(double hoursSpent) {
		this.hoursSpent = hoursSpent;
	}

	public double getHoursEstimated() {
		return hoursEstimated;
	}

	

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

}
