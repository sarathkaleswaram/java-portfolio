package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.ClientVertical;

@Transactional
@Repository
public class ClientVerticalDao {
	

	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	public List<ClientVertical> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				ClientVertical.class);
		return criteria.list();
	}
	
	

}
