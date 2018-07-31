package com.projectMatrix.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.projectMatrix.controller.AllocatedTaskController;
import com.projectMatrix.model.WorkbenchJob;
import com.projectMatrix.to.WorkBenchJobTo;

@Component
public class WorkBenchJobToWorkBenchJobTo {
	@Autowired
	AllocatedTaskController allocatedTaskController;

	public void map(WorkbenchJob workbenchJob, WorkBenchJobTo workBenchJobTo) {
		workBenchJobTo.setJob(workbenchJob.getJob().getJobNo());
		if (workbenchJob.getSpentTime() != null) {
			workBenchJobTo.setSpentTimeOnJob(allocatedTaskController
					.decimalToTimeConverter(workbenchJob.getSpentTime()));
		}
		workBenchJobTo.setJobStage(workbenchJob.getJobStage());
	}

}
