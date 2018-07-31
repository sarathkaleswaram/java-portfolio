package com.projectMatrix.mapper;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.projectMatrix.configration.Constants;
import com.projectMatrix.dao.ResourceAllocationDao;
import com.projectMatrix.model.Job;
import com.projectMatrix.to.JobTo;
 
@Component
public class JobToJobToMapper {

	@Autowired
	ResourceAllocationDao resourceAllocationDao;

	public void map(Job job, JobTo jobTo) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		if (job.getAssignedDate() != null) {
			jobTo.setAssignedDate(dateFormat.format(job.getAssignedDate()));
		}
		if (job.getDeliveredOn() != null) {
			jobTo.setDeliveredOn(dateFormat.format(job.getDeliveredOn()));
		}
		if (job.getExpectedDelivery() != null) {
			jobTo.setExpectedDelivery(dateFormat.format(job
					.getExpectedDelivery()));
		}
		if (job.getHoursSpent() != null) {
			jobTo.setHoursSpent(job.getHoursSpent());
		}
		if (job.getJobCriticality() != null) {
			jobTo.setJobCriticality(job.getJobCriticality());
		}
		jobTo.setJobId(job.getJobId());
		if (job.getJobName() != null) {
			jobTo.setJobName(job.getJobName());
		}
		if (job.getJobNo() != null) {
			jobTo.setJobNo(job.getJobNo());
		}
		if (job.getJobStage() != null) {
			jobTo.setJobStage(job.getJobStage());
		}
		if (job.getJobStatus() != null) {
			jobTo.setJobStatus(job.getJobStatus());
		}
		if (job.getLastModified() != null) {
			jobTo.setLastModified(job.getLastModified());
		}
		if (job.getReceivedDate() != null) {
			jobTo.setReceivedDate(dateFormat.format(job.getReceivedDate()));
		}
		if (job.getRemarks() != null) {
			jobTo.setRemarks(job.getRemarks());
		}
		
		if(job.getResource() != null){
			jobTo.setAssignedTo(job.getResource().getFirstName());
		}
		if (job.getJobStage().equals(Constants.Approval)) {
			if (job.getProject().getOffshorePm() != null) {
				jobTo.setAssignedTo(job.getProject().getOffshorePm());
			}
		}

		/*ResourceAllocation byId = resourceAllocationDao.getByJobId(job.getJobId());
		if (byId != null) {
			if (job.getJobStage().equals(Constants.Production)) {
				if (byId.getResourceByProductionAllocatedId() != null) {
					jobTo.setAssignedTo(byId
							.getResourceByProductionAllocatedId()
							.getFirstName());
				}
			}
			if (job.getJobStage().equals(Constants.QC)) {
				if (byId.getResourceByQcAllocatedId() != null) {
					jobTo.setAssignedTo(byId
							.getResourceByQcAllocatedId()
							.getFirstName());
				}
			}
			if (job.getJobStage().equals(Constants.QA)) {
				if (byId.getResourceByQaAllocatedId() != null) {
					jobTo.setAssignedTo(byId
							.getResourceByQaAllocatedId()
							.getFirstName());
				}
			}
			if (job.getJobStage().equals(Constants.Delivery)) {
				if (byId.getResourceByFeedbackAllocatedId() != null) {
					jobTo.setAssignedTo(byId
							.getResourceByFeedbackAllocatedId()
							.getFirstName());
				}
			}
			if (job.getJobStage().equals(Constants.Approval)) {
				if (job.getProject().getOffshorePm() != null) {
					jobTo.setAssignedTo(job.getProject().getOffshorePm());
				}
			}
		}*/

		// jobTo.setJobCompleteds(job.getJobCompleteds());
		// jobTo.setJobStages(job.getJobStages());

		// jobTo.setResourceAllocations(job.getResourceAllocations());
		jobTo.setProject(job.getProject().getProjectName());
		jobTo.setProjectId(job.getProject().getProjectId());
		jobTo.setHoursEstimated(job.getHoursEstimated());
	}

	
	public void mapForTime(Job job, JobTo jobTo){

		if (job.getHoursSpent() != null) {
			jobTo.setHoursSpent(job.getHoursSpent());
		}
		jobTo.setHoursEstimated(job.getHoursEstimated()); 
	}
}
