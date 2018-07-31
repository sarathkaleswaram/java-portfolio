package com.projectMatrix.model;

// Generated Nov 16, 2017 1:21:18 PM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * WorkbenchJob generated by hbm2java
 */
@Entity
@Table(name = "workbench_job", catalog = "project_matrix")
public class WorkbenchJob implements java.io.Serializable {

	private Long workbenchJobId;
	private Job job;
	private WorkBench workBench;
	private String jobStage;
	private Double spentTime;

	public WorkbenchJob() {
	}

	public WorkbenchJob(Job job, WorkBench workBench, String jobStage,
			Double spentTime) {
		this.job = job;
		this.workBench = workBench;
		this.jobStage = jobStage;
		this.spentTime = spentTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "workbench_job_id", unique = true, nullable = false)
	public Long getWorkbenchJobId() {
		return this.workbenchJobId;
	}

	public void setWorkbenchJobId(Long workbenchJobId) {
		this.workbenchJobId = workbenchJobId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "job")
	public Job getJob() {
		return this.job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "workbench")
	public WorkBench getWorkBench() {
		return this.workBench;
	}

	public void setWorkBench(WorkBench workBench) {
		this.workBench = workBench;
	}

	@Column(name = "job_stage", length = 45)
	public String getJobStage() {
		return this.jobStage;
	}

	public void setJobStage(String jobStage) {
		this.jobStage = jobStage;
	}

	@Column(name = "spent_time", precision = 22, scale = 0)
	public Double getSpentTime() {
		return this.spentTime;
	}

	public void setSpentTime(Double spentTime) {
		this.spentTime = spentTime;
	}

}
