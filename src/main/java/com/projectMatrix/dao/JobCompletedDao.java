package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.Dept;
import com.projectMatrix.model.JobCompleted;

@Repository
@Transactional
public class JobCompletedDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(JobCompleted jobCompleted) {
		currentSession().saveOrUpdate(jobCompleted);
	}

	public void delete(JobCompleted jobCompleted) {
		currentSession().delete(jobCompleted);
	}

	public JobCompleted getById(long id) {
		JobCompleted jobCompleted = (JobCompleted) sessionFactory
				.getCurrentSession().get(JobCompleted.class, id);
		return jobCompleted;
	}

	@SuppressWarnings("unchecked")
	public List<JobCompleted> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(JobCompleted.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

}
