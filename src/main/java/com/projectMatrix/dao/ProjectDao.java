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

import com.projectMatrix.model.Project;
import com.projectMatrix.model.TeamMembers;
import com.projectMatrix.model.UserInfo;

@Repository
@Transactional
public class ProjectDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Project project) {
		currentSession().saveOrUpdate(project);
	}

	public void delete(Project project) {
		currentSession().delete(project);
	}

	public Project getById(long id) {
		Project project = (Project) sessionFactory.getCurrentSession().get(
				Project.class, id);
		return project;
	}

	public Project getByIds(Long id) {
		Criteria criteria = currentSession().createCriteria(Project.class);
		criteria.add(Restrictions.eq("projectId", id));
		return (Project) criteria.uniqueResult();
	}

	public Project getByCentillionProjectCode(final String cpc) {

		Criteria criteria = currentSession().createCriteria(Project.class);
		 criteria.add(Restrictions.eq("centProjectCode", cpc));
		return (Project) criteria.uniqueResult();
	}

	public List<TeamMembers> getResourceByProject(Long projectId) {

		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				TeamMembers.class);
		criteria.add(Restrictions.eq("project.projectId", projectId));
		

		return criteria.list();

	}

	@SuppressWarnings("unchecked")
	public List<Project> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Project.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

}
