package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.JobUom;

@Repository
@Transactional
public class JobUomDao {

	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(JobUom jobUom) {
		currentSession().saveOrUpdate(jobUom);
	}

	public void delete(JobUom jobUom) {
		currentSession().delete(jobUom);
	}

	public JobUom getById(long id) {
		JobUom jobUom = (JobUom) sessionFactory.getCurrentSession().get(
				JobUom.class, id);
		return jobUom;
	}

	@SuppressWarnings("unchecked")
	public List<JobUom> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				JobUom.class);
		return criteria.list();
	}

	public List<JobUom> getUomByJob(long job_id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				JobUom.class);
		criteria.add(Restrictions.eq("job.jobId", job_id));
		// criteria.add(Restrictions.eq("", ""));
		return criteria.list();
	}

	public List<JobUom> getJobUomByProjectUom(Long projectUomId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				JobUom.class);
		criteria.add(Restrictions.eq("projectUom.projectUomId", projectUomId));
		// criteria.add(Restrictions.eq("", ""));
		return criteria.list();
	}

	public List<JobUom> getUomByJobAndDate(long jobId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				JobUom.class);
		criteria.add(Restrictions.eq("job.jobId", jobId));
		return criteria.list();
	}
}
