package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.JobStage;
import com.projectMatrix.to.JobStageTo;

@Component
public class JobStageToToJobStageMapper {

	public void map(JobStageTo jobStageTo, JobStage jobStage){
		jobStage.setHoursSpent(jobStageTo.getHoursSpent());
		//jobStage.setJob(jobStageTo.getJob());
		jobStage.setJobStageId(jobStageTo.getJobStageId());
		jobStage.setJobStatus(jobStageTo.getJobStatus());
		jobStage.setWipTime(jobStageTo.getWipTime());
		jobStage.setPauseTime(jobStageTo.getPauseTime());
		
	}
}
