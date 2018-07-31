package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.JobStage;
import com.projectMatrix.to.JobStageTo;

@Component
public class JobStageToJobStageToMapper {

	public void map(JobStage jobStage, JobStageTo jobStageTo) {
		if (jobStage != null) {
			if (jobStage.getHoursSpent() != null) {
				jobStageTo.setHoursSpent(jobStage.getHoursSpent());
			}
			jobStageTo.setJob(jobStage.getJob().getJobId());
			jobStageTo.setJobStageId(jobStage.getJobStageId());
			jobStageTo.setJobStatus(jobStage.getJobStatus());
			jobStageTo.setJobStage(jobStage.getJobStage());
			jobStageTo.setHoursEstimated(jobStage.getHoursEstimated());
		}
	}
}
