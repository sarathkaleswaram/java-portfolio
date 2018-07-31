package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.SubDept;

@Repository
@Transactional
public class SubDeptDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(SubDept subDept) {
		currentSession().saveOrUpdate(subDept);
	}

	public void delete(SubDept subDept) {
		currentSession().delete(subDept);
	}

	public SubDept getById(int id) {
		SubDept subDept = (SubDept) sessionFactory.getCurrentSession().get(
				SubDept.class, id);
		return subDept;
	}

	@SuppressWarnings("unchecked")
	public List<SubDept> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(SubDept.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

}
