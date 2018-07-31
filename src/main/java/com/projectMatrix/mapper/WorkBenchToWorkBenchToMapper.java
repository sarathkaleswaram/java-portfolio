package com.projectMatrix.mapper;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.projectMatrix.controller.AllocatedTaskController;
import com.projectMatrix.model.WorkBench;
import com.projectMatrix.to.WorkBenchTo;

@Component
public class WorkBenchToWorkBenchToMapper {

	@Autowired
	AllocatedTaskController allocatedTaskController;

	public void map(WorkBench workBench, WorkBenchTo workBenchTo) {
		double total=0.0;
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		workBenchTo.setWorkBenchId(workBench.getWorkBenchId());
		if (workBench.getDoc() != null) {
			workBenchTo.setDoc(dateFormat.format(workBench.getDoc()));
		}
		workBenchTo.setWorkedOn(workBench.getWorkedOn());
		workBenchTo.setRemarks(workBench.getRemarks());
		if (workBench.getSpentTime() != null) {
			workBenchTo.setSpentTime(allocatedTaskController
					.decimalToTimeConverter(workBench.getSpentTime()));
			total += workBench.getSpentTime();
		}
		workBenchTo.setResource(workBench.getResource().getFirstName()+" "+workBench.getResource().getLastName());
		/* workBenchTo.setEstimatedTime(workBench.getEstimatedTime()); */
		if (workBench.getInTraining() != null) {
			workBenchTo.setInTraining(allocatedTaskController
					.decimalToTimeConverter(workBench.getInTraining()));
			total += workBench.getInTraining();
		}
		if (workBench.getOnBench() != null) {
			workBenchTo.setOnBench(allocatedTaskController
					.decimalToTimeConverter(workBench.getOnBench()));
			total += workBench.getOnBench();
		}
		if (workBench.getPM() != null) {
			workBenchTo.setPM(allocatedTaskController
					.decimalToTimeConverter(workBench.getPM()));
			total += workBench.getPM();
		}
		if (workBench.getOthers() != null) {
			workBenchTo.setOthers(allocatedTaskController
					.decimalToTimeConverter(workBench.getOthers()));
			total += workBench.getOthers();
		}
		workBenchTo.setTotal(allocatedTaskController
					.decimalToTimeConverter(total));
	}
}
