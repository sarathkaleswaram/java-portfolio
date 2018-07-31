package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.Uom;

@Repository
@Transactional
public class UomDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Uom uom) {
		currentSession().saveOrUpdate(uom);
	}

	public void delete(Uom uom) {

		currentSession().delete(uom);
	}

	public Uom getById(int id) {
		Uom uom = (Uom) sessionFactory.getCurrentSession().get(Uom.class, id);
		return uom;
	}

	@SuppressWarnings("unchecked")
	public List<Uom> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Uom.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

}
