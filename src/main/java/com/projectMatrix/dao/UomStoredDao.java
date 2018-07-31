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

import com.projectMatrix.model.TeamMembers;
import com.projectMatrix.model.UomStored;

@Repository
@Transactional        
public class UomStoredDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(UomStored uomStored) {
		currentSession().saveOrUpdate(uomStored);
	}

	public void delete(UomStored uomStored) {
		currentSession().delete(uomStored);
	}

	public UomStored getById(int id) {
		UomStored uomStored = (UomStored) sessionFactory.getCurrentSession()
				.get(UomStored.class, id);
		return uomStored;
	}
	

	@SuppressWarnings("unchecked")
	public List<UomStored> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(UomStored.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

	public List<UomStored> getResourceByProject(long project_id) {
		Criteria criteria =sessionFactory.getCurrentSession().createCriteria(UomStored.class);
		criteria.add(Restrictions.eq("project.projectId", project_id));
//		criteria.add(Restrictions.eq("", ""));
		return criteria.list();
	}

}
