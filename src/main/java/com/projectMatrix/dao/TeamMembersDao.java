package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.TeamMembers;
import com.projectMatrix.model.UomStored;

@Repository
@Transactional
public class TeamMembersDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(TeamMembers teamMembers) {
		currentSession().saveOrUpdate(teamMembers);
	}

	public void delete(TeamMembers teamMembers) {
		currentSession().delete(teamMembers);
	}

	public TeamMembers getById(long id) {
		TeamMembers teamMembers = (TeamMembers) sessionFactory
				.getCurrentSession().get(TeamMembers.class, id);
		return teamMembers;
	}

	
	public List<TeamMembers> getNonAllocatedTeamMembers(long project_id) {
		Criteria criteria =sessionFactory.getCurrentSession().createCriteria(TeamMembers.class);
		criteria.add(Restrictions.eq("project.projectId", project_id));
		return criteria.list();
	}

	public List<TeamMembers> getTeamMembersByProjectId(long project_id) {
		Criteria criteria =sessionFactory.getCurrentSession().createCriteria(TeamMembers.class);
		criteria.add(Restrictions.eq("project.projectId", project_id));
		return criteria.list();
	}
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public List<TeamMembers> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(TeamMembers.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

}
