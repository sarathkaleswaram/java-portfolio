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

@Repository
@Transactional
public class DeptDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Dept dept) {
		currentSession().saveOrUpdate(dept);
	}

	public void delete(Dept dept) {
		currentSession().delete(dept);
	}

	public Dept getById(int id) {
		Dept dept = (Dept) sessionFactory.getCurrentSession().get(Dept.class,
				id);
		return dept;
	}

	@SuppressWarnings("unchecked")
	public List<Dept> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Dept.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

}
