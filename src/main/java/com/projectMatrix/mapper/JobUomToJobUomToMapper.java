package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.JobUom;
import com.projectMatrix.to.JobUomTo;

@Component
public class JobUomToJobUomToMapper {
	public void map(JobUom jobUom,JobUomTo jobUomTo){
		jobUomTo.setJob(jobUom.getJob().getJobId());
		jobUomTo.setJobUomId(jobUom.getJobUomId());
		jobUomTo.setProjectUom(jobUom.getProjectUom().getProjectUomId());
		jobUomTo.setUomName(jobUom.getProjectUom().getUom().getUomName());
		jobUomTo.setValue(jobUom.getValue());
		
		
	}
	
	

}
