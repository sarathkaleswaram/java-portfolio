package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.Project;
import com.projectMatrix.to.ProjectTo;
import com.projectMatrix.utils.DateUtil;

@Component
public class ProjectToProjectToMapper {
	public void map(Project project, ProjectTo projectTo) {
		if (project != null) {
			projectTo.setCentProjectCode(project.getCentProjectCode());
			projectTo.setProjectId(project.getProjectId());
			if (project.getClient() != null) {
				projectTo.setClient(project.getClient().getClientName());
				projectTo.setClientId(project.getClient().getClientId());
			}
			projectTo.setEndCustomer(project.getEndCustomer());
			projectTo.setOperationRegion(project.getOperationRegion());
			projectTo.setWorkRegion(project.getWorkRegion());
			projectTo.setClientPm(project.getClientPm());
			projectTo.setProjectCode(project.getProjectCode());
			projectTo.setProjectName(project.getProjectName());
			projectTo.setProjectScope(project.getProjectScope());
			projectTo.setCostCenter(project.getCostCenter());
			projectTo.setOffshorePm(project.getOffshorePm());
			if (project.getResource() != null) {
				projectTo.setResource(project.getResource().getFirstName()
						+ " " + project.getResource().getLastName());
				projectTo.setTlId(project.getResource().getResourceId());
			}
			if (project.getStartDate() != null)
				projectTo
						.setStartDate(DateUtil.formatDateAsString(project.getStartDate()));
			if (project.getEndDate() != null)
				projectTo.setEndDate(DateUtil.formatDateAsString(project.getEndDate()));
			projectTo.setInputValidationPercentage(project
					.getInputValidationPercentage());
			projectTo
					.setProductionPercentage(project.getProductionPercentage());
			projectTo.setQcPercentage(project.getQcPercentage());
			projectTo.setQaPercentage(project.getQaPercentage());
			projectTo.setDeliveryPercentage(project.getDeliveryPercentage());
			projectTo.setFeedbackPercentage(project.getFeedbackPercentage());
			projectTo
					.setRedeliveryPercentage(project.getRedeliveryPercentage());
		}
	}

}
