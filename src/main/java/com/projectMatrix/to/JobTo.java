package com.projectMatrix.to;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.projectMatrix.model.JobCompleted;
import com.projectMatrix.model.JobStage;
import com.projectMatrix.model.ResourceAllocation;

public class JobTo {
	private long jobId;
	private long projectId;
	private String project;
	private String jobNo;
	private String jobName;
	private String assignedTo;
	private String jobStage;
	private String jobStatus;
	private String receivedDate;
	private String assignedDate;
	private String expectedDelivery;
	private String deliveredOn;
	private Date lastModified;
	private String remarks;
	private String jobCriticality;
	private Integer[] value;
	private Double hoursEstimated;
	private Double hoursSpent;
	private long productionResource;
	private long qcResource;
	private long qaResource;
	private long deliveryResource;
	private double productionEstimatedHours;
	private double qcEstimatedHours;
	private double qaEstimatedHours;
	private double deliveryEstimatedHours;
	private double productionSpentHours;
	private double qcSpentHours;
	private double qaSpentHours;
	private double deliverySpentHours;
	private long resourceAllocatedId;

	private String toDate;

	private long totalJobs;
	private long JobsInYts;
	private long productionWIPJobs;
	private long productionCmpltdJobs;
	private long qcWIPJobs;
	private long qcCmpltdJobs;
	private long qaWIPJobs;
	private long qaCmpltdJobs;
	private long DeliveryWIPJobs;
	private long DeliveryCmpltdJobs;
	private long JobsInQuery;
	private long jobsOnHold;

	
	public double getProductionSpentHours() {
		return productionSpentHours;
	}

	public void setProductionSpentHours(double productionSpentHours) {
		this.productionSpentHours = productionSpentHours;
	}

	public double getQcSpentHours() {
		return qcSpentHours;
	}

	public void setQcSpentHours(double qcSpentHours) {
		this.qcSpentHours = qcSpentHours;
	}

	public double getQaSpentHours() {
		return qaSpentHours;
	}

	public void setQaSpentHours(double qaSpentHours) {
		this.qaSpentHours = qaSpentHours;
	}

	public double getDeliverySpentHours() {
		return deliverySpentHours;
	}

	public void setDeliverySpentHours(double deliverySpentHours) {
		this.deliverySpentHours = deliverySpentHours;
	}

	public long getResourceAllocatedId() {
		return resourceAllocatedId;
	}

	public void setResourceAllocatedId(long resourceAllocatedId) {
		this.resourceAllocatedId = resourceAllocatedId;
	}

	public double getProductionEstimatedHours() {
		return productionEstimatedHours;
	}

	public void setProductionEstimatedHours(double productionEstimatedHours) {
		this.productionEstimatedHours = productionEstimatedHours;
	}

	public double getQcEstimatedHours() {
		return qcEstimatedHours;
	}

	public void setQcEstimatedHours(double qcEstimatedHours) {
		this.qcEstimatedHours = qcEstimatedHours;
	}

	public double getQaEstimatedHours() {
		return qaEstimatedHours;
	}

	public void setQaEstimatedHours(double qaEstimatedHours) {
		this.qaEstimatedHours = qaEstimatedHours;
	}

	public double getDeliveryEstimatedHours() {
		return deliveryEstimatedHours;
	}

	public void setDeliveryEstimatedHours(double deliveryEstimatedHours) {
		this.deliveryEstimatedHours = deliveryEstimatedHours;
	}

	public long getJobsOnHold() {
		return jobsOnHold;
	}

	public long getProductionResource() {
		return productionResource;
	}

	public void setProductionResource(long productionResource) {
		this.productionResource = productionResource;
	}

	public long getQcResource() {
		return qcResource;
	}

	public void setQcResource(long qcResource) {
		this.qcResource = qcResource;
	}

	public long getQaResource() {
		return qaResource;
	}

	public void setQaResource(long qaResource) {
		this.qaResource = qaResource;
	}

	public long getDeliveryResource() {
		return deliveryResource;
	}

	public void setDeliveryResource(long deliveryResource) {
		this.deliveryResource = deliveryResource;
	}

	public void setJobsOnHold(long jobsOnHold) {
		this.jobsOnHold = jobsOnHold;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public long getTotalJobs() {
		return totalJobs;
	}

	public void setTotalJobs(long totalJobs) {
		this.totalJobs = totalJobs;
	}

	public long getJobsInYts() {
		return JobsInYts;
	}

	public void setJobsInYts(long jobsInYts) {
		JobsInYts = jobsInYts;
	}

	public long getProductionWIPJobs() {
		return productionWIPJobs;
	}

	public void setProductionWIPJobs(long productionWIPJobs) {
		this.productionWIPJobs = productionWIPJobs;
	}

	public long getProductionCmpltdJobs() {
		return productionCmpltdJobs;
	}

	public void setProductionCmpltdJobs(long productionCmpltdJobs) {
		this.productionCmpltdJobs = productionCmpltdJobs;
	}

	public long getQcWIPJobs() {
		return qcWIPJobs;
	}

	public void setQcWIPJobs(long qcWIPJobs) {
		this.qcWIPJobs = qcWIPJobs;
	}

	public long getQcCmpltdJobs() {
		return qcCmpltdJobs;
	}

	public void setQcCmpltdJobs(long qcCmpltdJobs) {
		this.qcCmpltdJobs = qcCmpltdJobs;
	}

	public long getQaWIPJobs() {
		return qaWIPJobs;
	}

	public void setQaWIPJobs(long qaWIPJobs) {
		this.qaWIPJobs = qaWIPJobs;
	}

	public long getQaCmpltdJobs() {
		return qaCmpltdJobs;
	}

	public void setQaCmpltdJobs(long qaCmpltdJobs) {
		this.qaCmpltdJobs = qaCmpltdJobs;
	}

	public long getDeliveryWIPJobs() {
		return DeliveryWIPJobs;
	}

	public void setDeliveryWIPJobs(long deliveryWIPJobs) {
		DeliveryWIPJobs = deliveryWIPJobs;
	}

	public long getDeliveryCmpltdJobs() {
		return DeliveryCmpltdJobs;
	}

	public void setDeliveryCmpltdJobs(long deliveryCmpltdJobs) {
		DeliveryCmpltdJobs = deliveryCmpltdJobs;
	}

	public long getJobsInQuery() {
		return JobsInQuery;
	}

	public void setJobsInQuery(long jobsInQuery) {
		JobsInQuery = jobsInQuery;
	}

	public Double getHoursEstimated() {
		return hoursEstimated;
	}

	public void setHoursEstimated(Double hoursEstimated) {
		this.hoursEstimated = hoursEstimated;
	}

	public Double getHoursSpent() {
		return hoursSpent;
	}

	public void setHoursSpent(Double hoursSpent) {
		this.hoursSpent = hoursSpent;
	}

	public Integer[] getValue() {
		return value;
	}

	public void setValue(Integer[] value) {
		this.value = value;
	}

	private Set<ResourceAllocation> resourceAllocations = new HashSet<ResourceAllocation>(
			0);
	private Set<JobStage> jobStages = new HashSet<JobStage>(0);
	private Set<JobCompleted> jobCompleteds = new HashSet<JobCompleted>(0);

	public long getJobId() {
		return jobId;
	}

	public void setJobId(long jobId) {
		this.jobId = jobId;
	}

	public long getProjectId() {
		return projectId;
	}

	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getJobNo() {
		return jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobStage() {
		return jobStage;
	}

	public void setJobStage(String jobStage) {
		this.jobStage = jobStage;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(String receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(String assignedDate) {
		this.assignedDate = assignedDate;
	}

	public String getExpectedDelivery() {
		return expectedDelivery;
	}

	public void setExpectedDelivery(String expectedDelivery) {
		this.expectedDelivery = expectedDelivery;
	}

	public String getDeliveredOn() {
		return deliveredOn;
	}

	public void setDeliveredOn(String deliveredOn) {
		this.deliveredOn = deliveredOn;
	}

	public Date getLastModified() {
		return lastModified;
	}

	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getJobCriticality() {
		return jobCriticality;
	}

	public void setJobCriticality(String jobCriticality) {
		this.jobCriticality = jobCriticality;
	}

	public Set<ResourceAllocation> getResourceAllocations() {
		return resourceAllocations;
	}

	public void setResourceAllocations(
			Set<ResourceAllocation> resourceAllocations) {
		this.resourceAllocations = resourceAllocations;
	}

	public Set<JobStage> getJobStages() {
		return jobStages;
	}

	public void setJobStages(Set<JobStage> jobStages) {
		this.jobStages = jobStages;
	}

	public Set<JobCompleted> getJobCompleteds() {
		return jobCompleteds;
	}

	public void setJobCompleteds(Set<JobCompleted> jobCompleteds) {
		this.jobCompleteds = jobCompleteds;
	}

}
