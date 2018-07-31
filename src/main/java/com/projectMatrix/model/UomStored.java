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
 * UomStored generated by hbm2java
 */
@Entity
@Table(name = "uom_stored", catalog = "project_matrix")
public class UomStored implements java.io.Serializable {

	private Integer uomStoredId;
	private Uom uom;
	private Project project;
	private JobStage jobStage;
	private Integer value;

	public UomStored() {
	}

	public UomStored(Uom uom, Project project, JobStage jobStage, Integer value) {
		this.uom = uom;
		this.project = project;
		this.jobStage = jobStage;
		this.value = value;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "uom_stored_id", unique = true, nullable = false)
	public Integer getUomStoredId() {
		return this.uomStoredId;
	}

	public void setUomStoredId(Integer uomStoredId) {
		this.uomStoredId = uomStoredId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "uom_id")
	public Uom getUom() {
		return this.uom;
	}

	public void setUom(Uom uom) {
		this.uom = uom;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "job_stage_uom_id")
	public JobStage getJobStage() {
		return this.jobStage;
	}

	public void setJobStage(JobStage jobStage) {
		this.jobStage = jobStage;
	}

	@Column(name = "value")
	public Integer getValue() {
		return this.value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

}
