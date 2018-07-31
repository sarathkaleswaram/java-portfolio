package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.Performance;

@Repository
@Transactional
public class PerformanceDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Performance performance) {
		currentSession().saveOrUpdate(performance);
	}

	public void delete(Performance performance) {
		currentSession().delete(performance);
	}

	public Performance getById(int id) {
		Performance performance = (Performance) sessionFactory.getCurrentSession().get(Performance.class,
				id);
		return performance;
	}

	@SuppressWarnings("unchecked")
	public List<Performance> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Performance.class)
				.setFetchMode("resource", FetchMode.JOIN);

		return criteria.list();
	}

}
