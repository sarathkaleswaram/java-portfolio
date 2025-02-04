package com.projectMatrix.model;

// Generated Jul 23, 2017 3:14:16 PM by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

/**
 * JobCompleted generated by hbm2java
 */
public class JobCompleted implements java.io.Serializable {

	private long jobCompletedId;
	private Job job;
	private String jobCompletedName;
	private Set invoices = new HashSet(0);

	public JobCompleted() {
	}

	public JobCompleted(long jobCompletedId) {
		this.jobCompletedId = jobCompletedId;
	}

	public JobCompleted(long jobCompletedId, Job job, String jobCompletedName,
			Set invoices) {
		this.jobCompletedId = jobCompletedId;
		this.job = job;
		this.jobCompletedName = jobCompletedName;
		this.invoices = invoices;
	}

	public long getJobCompletedId() {
		return this.jobCompletedId;
	}

	public void setJobCompletedId(long jobCompletedId) {
		this.jobCompletedId = jobCompletedId;
	}

	public Job getJob() {
		return this.job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getJobCompletedName() {
		return this.jobCompletedName;
	}

	public void setJobCompletedName(String jobCompletedName) {
		this.jobCompletedName = jobCompletedName;
	}

	public Set getInvoices() {
		return this.invoices;
	}

	public void setInvoices(Set invoices) {
		this.invoices = invoices;
	}

}
