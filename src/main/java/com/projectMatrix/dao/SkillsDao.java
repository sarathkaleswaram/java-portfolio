package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.Skills;

@Repository
@Transactional
public class SkillsDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Skills skills) {
		currentSession().saveOrUpdate(skills);
	}

	public void delete(Skills skills) {
		currentSession().delete(skills);
	}

	public Skills getById(int id) {
		Skills skills = (Skills) sessionFactory.getCurrentSession().get(
				Skills.class, id);
		return skills;
	}

	@SuppressWarnings("unchecked")
	public List<Skills> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Skills.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

}
