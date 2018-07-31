package com.projectMatrix.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.projectMatrix.dao.ResourceDao;
import com.projectMatrix.model.Resource;
import com.projectMatrix.model.TeamMembers;
import com.projectMatrix.to.TeamMembersTo;

@Component
public class TeamMembersToTeamMembersToMapper {

	@Autowired
	ResourceDao resourceDao = new ResourceDao();
	public void map(TeamMembers teamMembers, TeamMembersTo teamMembersTo){
		teamMembersTo.setKeyResourceIndication(teamMembers.getKeyResourceIndication());
		teamMembersTo.setProject(teamMembers.getProject().getProjectId());
		teamMembersTo.setResourceId(teamMembers.getResource().getResourceId());
		teamMembersTo.setTmId(teamMembers.getTmId());
		Resource resource = resourceDao.getById(teamMembers.getResource().getResourceId());
		teamMembersTo.setFirstName(resource.getFirstName()+" "+resource.getLastName());
	}
}
