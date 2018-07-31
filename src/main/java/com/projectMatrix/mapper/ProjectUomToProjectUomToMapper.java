package com.projectMatrix.mapper;

import org.springframework.stereotype.Component;

import com.projectMatrix.model.ProjectUom;
import com.projectMatrix.to.ProjectUomTo;

@Component
public class ProjectUomToProjectUomToMapper {
	public void map(ProjectUom projectUom,ProjectUomTo projectUomTo){
		projectUomTo.setProject(projectUom.getProject().getProjectId());
		projectUomTo.setProjectUomId(projectUom.getProjectUomId());
		projectUomTo.setUom(projectUom.getUom().getUomName());
		projectUomTo.setUomId(projectUom.getUom().getUomId());
		
	}

}
