package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.UomStored;
import com.projectMatrix.to.UomStoredTo;

@Component
public class UomStoredToUomStoredToMapper {
	public void map(UomStored uomStored, UomStoredTo uomStoredTo) {

		if (uomStored.getJobStage() != null) {
			uomStoredTo.setJobStage(uomStored.getJobStage().getJobStageId());
		}
		uomStoredTo.setUom(uomStored.getUom().getUomName());
		uomStoredTo.setUomId(uomStored.getUom().getUomId());
		uomStoredTo.setProject(uomStored.getProject().getProjectId());
		uomStoredTo.setUomStoredId(uomStored.getUomStoredId());
		if (uomStored.getValue() != null) {
			uomStoredTo.setValue(uomStored.getValue());
		}
	}

}
