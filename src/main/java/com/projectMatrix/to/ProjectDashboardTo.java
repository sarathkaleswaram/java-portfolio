package com.projectMatrix.to;

public class ProjectDashboardTo {

	private long projectId;
	private String projectName;
	private long noOfJobs;
	private double remainingHours;
	private double requiredMenDays;

	public long getProjectId() {
		return projectId;
	}

	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public long getNoOfJobs() {
		return noOfJobs;
	}

	public void setNoOfJobs(long noOfJobs) {
		this.noOfJobs = noOfJobs;
	}

	public double getRemainingHours() {
		return remainingHours;
	}

	public void setRemainingHours(double remainingHours) {
		this.remainingHours = remainingHours;
	}

	public double getRequiredMenDays() {
		return requiredMenDays;
	}

	public void setRequiredMenDays(double requiredMenDays) {
		this.requiredMenDays = requiredMenDays;
	}

}
