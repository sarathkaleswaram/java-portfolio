package com.projectMatrix.dao;

import java.util.Arrays;
import java.util.List;

import javax.transaction.Transactional;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.codehaus.jettison.json.JSONTokener;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.ActionPointTracker;

@Repository
@Transactional
public class ActionPointTrackerDao {

	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(ActionPointTracker actionPointTracker) {
		currentSession().saveOrUpdate(actionPointTracker);
	}

	public void delete(ActionPointTracker actionPointTracker) {
		currentSession().delete(actionPointTracker);
	}

	public ActionPointTracker getById(long id) {
		ActionPointTracker actionPointTracker = (ActionPointTracker) currentSession()
				.get(ActionPointTracker.class, id);
		return actionPointTracker;
	}

	@SuppressWarnings("unchecked")
	public List<ActionPointTracker> getAll() {
		Criteria criteria = currentSession().createCriteria(
				ActionPointTracker.class);
		return criteria.addOrder(Order.desc("aptId")).list();
	}

	@SuppressWarnings("unchecked")
	public List<ActionPointTracker> getByFromId(Long resourceId) {
		Criteria criteria = currentSession().createCriteria(
				ActionPointTracker.class);
		criteria.add(Restrictions.eq("resourceByAssignedFrom.resourceId", resourceId));
		return criteria.addOrder(Order.desc("aptId")).list();
	}

	@SuppressWarnings("unchecked")
	public List<ActionPointTracker> getAptListByCcAndTo(long id) {
		Criteria criteria = currentSession().createCriteria(
				ActionPointTracker.class);
		criteria.add(Restrictions.eq("resourceByAssignedTo.resourceId", id));
		
//		criteria.add(Restrictions.eq("stackHolders", id));
		return criteria.addOrder(Order.desc("aptId")).list();
	}

}
