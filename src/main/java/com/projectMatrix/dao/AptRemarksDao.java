package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.AptRemarks;

@Repository
@Transactional
public class AptRemarksDao {

	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(AptRemarks aptRemarks) {
		currentSession().saveOrUpdate(aptRemarks);
	}

	public void delete(AptRemarks aptRemarks) {
		currentSession().delete(aptRemarks);
	}

	public AptRemarks getById(long id) {
		AptRemarks aptRemarks = (AptRemarks) currentSession().get(
				AptRemarks.class, id);
		return aptRemarks;
	}

	@SuppressWarnings("unchecked")
	public List<AptRemarks> getAll() {
		Criteria criteria = currentSession().createCriteria(AptRemarks.class);
		return criteria.list();
	}

	public List<AptRemarks> getByAptId(long aptId) {
		Criteria criteria = currentSession().createCriteria(AptRemarks.class);
		criteria.add(Restrictions.eq("actionPointTracker.aptId", aptId));
		return criteria.list();
	}

}
