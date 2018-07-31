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

import com.projectMatrix.model.ProjectUom;
import com.projectMatrix.model.ResourceAllocation;
import com.projectMatrix.model.UomStored;

@Repository
@Transactional
public class ProjectUomDao {

	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(ProjectUom projectUom) {
		currentSession().saveOrUpdate(projectUom);
	}

	public void delete(ProjectUom projectUom) {
		currentSession().delete(projectUom);
	}

	public ProjectUom getById(long id) {
		ProjectUom projectUom = (ProjectUom) sessionFactory.getCurrentSession()
				.get(ProjectUom.class, id);
		return projectUom;
	}

	@SuppressWarnings("unchecked")
	public List<ProjectUom> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				ProjectUom.class);
		return criteria.list();
	}

	public List<ProjectUom> getUomByProject(long project_id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				ProjectUom.class);
		criteria.add(Restrictions.eq("project.projectId", project_id));
		// criteria.add(Restrictions.eq("", ""));

		return criteria.list();
	}

	public List<ProjectUom> getProjectUomIdByProjectId(long projectId) {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(ProjectUom.class)
				.setFetchMode("jobUom", FetchMode.JOIN);
		criteria.add(Restrictions.eq("project.projectId", projectId));
		// criteria.add(Restrictions.eqProperty("j.jobId", "job.jobId"));

		return criteria.list();
	}

}
