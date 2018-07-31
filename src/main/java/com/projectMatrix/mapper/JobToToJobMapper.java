package com.projectMatrix.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.projectMatrix.configration.Constants;
import com.projectMatrix.dao.ProjectDao;
import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.model.Job;
import com.projectMatrix.to.JobTo;
import com.projectMatrix.utils.DateUtil;

@Component
public class JobToToJobMapper {

	@Autowired
	ProjectDao projectDao;	
	@Autowired
	ResourceDao resourceDao;


	public void map(JobTo jobTo, Job job) {

		job.setProject(projectDao.getById(jobTo.getProjectId()));
		job.setJobNo(jobTo.getJobNo());
		job.setJobName(jobTo.getJobName());
		job.setHoursEstimated(jobTo.getHoursEstimated());
		job.setJobStage(jobTo.getJobStage());
		job.setJobStatus(jobTo.getJobStatus());
		if (!jobTo.getReceivedDate().isEmpty())
			job.setReceivedDate(DateUtil.formatDate(jobTo.getReceivedDate()));
		if (!jobTo.getAssignedDate().isEmpty())
			job.setAssignedDate(DateUtil.formatDate(jobTo.getAssignedDate()));
		if (!jobTo.getExpectedDelivery().isEmpty())
			job.setExpectedDelivery(DateUtil.formatDate(jobTo
					.getExpectedDelivery()));
		job.setJobCriticality(jobTo.getJobCriticality());
//		job.setLastModified(jobTo.getLastModified());
		job.setRemarks(jobTo.getRemarks());
		
		if(jobTo.getJobStage().equalsIgnoreCase(Constants.Production)){
			if(jobTo.getProductionResource() > 0){
				job.setResource(resourceDao.getById(jobTo.getProductionResource()));
			} else {
				job.setResource(null);
			}
		}
		if(jobTo.getJobStage().equalsIgnoreCase(Constants.QC)){
			if(jobTo.getQcResource() > 0){
				job.setResource(resourceDao.getById(jobTo.getQcResource()));
			} else {
				job.setResource(null);
			}
		}
		if(jobTo.getJobStage().equalsIgnoreCase(Constants.QA)){
			if(jobTo.getQaResource() > 0){
				job.setResource(resourceDao.getById(jobTo.getQaResource()));
			} else {
				job.setResource(null);
			}
		}
		if(jobTo.getJobStage().equalsIgnoreCase(Constants.Delivery)){
			if(jobTo.getDeliveryResource() > 0){
				job.setResource(resourceDao.getById(jobTo.getDeliveryResource()));
			} else {
				job.setResource(null);
			}
		}

	}

}
