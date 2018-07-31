package com.projectMatrix.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.projectMatrix.dao.ClientDao;
import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.model.Project;
import com.projectMatrix.model.Resource;
import com.projectMatrix.to.ProjectTo;
import com.projectMatrix.utils.DateUtil;

@Component
public class ProjectToToProjectMapper {

	@Autowired
	ClientDao clientDao;
	@Autowired
	ResourceDao resourceDao;

	public void map(ProjectTo projectTo, Project project) {

		if (projectTo.getClientId() != 0)
			project.setClient(clientDao.getById(projectTo.getClientId()));
		project.setEndCustomer(projectTo.getEndCustomer());
		project.setWorkRegion(projectTo.getWorkRegion());
		project.setOperationRegion(projectTo.getOperationRegion());
		project.setClientPm(projectTo.getClientPm());
		project.setProjectCode(projectTo.getProjectCode());
		project.setCentProjectCode(projectTo.getCentProjectCode());
		project.setProjectName(projectTo.getProjectName());
		project.setProjectScope(projectTo.getProjectScope());
		project.setCostCenter(projectTo.getCostCenter());
		project.setOffshorePm(projectTo.getOffshorePm());
		if (projectTo.getTlId() != 0)
			project.setResource(resourceDao.getById(projectTo.getTlId()));
		if(!projectTo.getStartDate().isEmpty())
			project.setStartDate(DateUtil.formatDate(projectTo.getStartDate()));
		if(!projectTo.getEndDate().isEmpty())
			project.setEndDate(DateUtil.formatDate(projectTo.getEndDate()));
		project.setProductionPercentage(projectTo.getProductionPercentage());
		project.setQcPercentage(projectTo.getQcPercentage());
		project.setQaPercentage(projectTo.getQaPercentage());
		project.setFeedbackPercentage(projectTo.getFeedbackPercentage());
	}

}
