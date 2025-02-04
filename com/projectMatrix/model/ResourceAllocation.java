package com.projectMatrix.model;

// Generated Jul 23, 2017 3:14:16 PM by Hibernate Tools 4.0.0

/**
 * ResourceAllocation generated by hbm2java
 */
public class ResourceAllocation implements java.io.Serializable {

	private Integer resourceAllocatedId;
	private Resource resourceByQaAllocatedId;
	private Job job;
	private Resource resourceByFeedbackAllocatedId;
	private Resource resourceByQcAllocatedId;
	private Resource resourceByProductionAllocatedId;

	public ResourceAllocation() {
	}

	public ResourceAllocation(Resource resourceByQaAllocatedId, Job job,
			Resource resourceByFeedbackAllocatedId,
			Resource resourceByQcAllocatedId,
			Resource resourceByProductionAllocatedId) {
		this.resourceByQaAllocatedId = resourceByQaAllocatedId;
		this.job = job;
		this.resourceByFeedbackAllocatedId = resourceByFeedbackAllocatedId;
		this.resourceByQcAllocatedId = resourceByQcAllocatedId;
		this.resourceByProductionAllocatedId = resourceByProductionAllocatedId;
	}

	public Integer getResourceAllocatedId() {
		return this.resourceAllocatedId;
	}

	public void setResourceAllocatedId(Integer resourceAllocatedId) {
		this.resourceAllocatedId = resourceAllocatedId;
	}

	public Resource getResourceByQaAllocatedId() {
		return this.resourceByQaAllocatedId;
	}

	public void setResourceByQaAllocatedId(Resource resourceByQaAllocatedId) {
		this.resourceByQaAllocatedId = resourceByQaAllocatedId;
	}

	public Job getJob() {
		return this.job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Resource getResourceByFeedbackAllocatedId() {
		return this.resourceByFeedbackAllocatedId;
	}

	public void setResourceByFeedbackAllocatedId(
			Resource resourceByFeedbackAllocatedId) {
		this.resourceByFeedbackAllocatedId = resourceByFeedbackAllocatedId;
	}

	public Resource getResourceByQcAllocatedId() {
		return this.resourceByQcAllocatedId;
	}

	public void setResourceByQcAllocatedId(Resource resourceByQcAllocatedId) {
		this.resourceByQcAllocatedId = resourceByQcAllocatedId;
	}

	public Resource getResourceByProductionAllocatedId() {
		return this.resourceByProductionAllocatedId;
	}

	public void setResourceByProductionAllocatedId(
			Resource resourceByProductionAllocatedId) {
		this.resourceByProductionAllocatedId = resourceByProductionAllocatedId;
	}

}
