package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.configration.Constants;
import com.projectMatrix.model.ResourceAllocation;

@Repository
@Transactional
public class ResourceAllocationDao {

	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(ResourceAllocation resourceAllocation) {
		currentSession().saveOrUpdate(resourceAllocation);
	}

	public void delete(ResourceAllocation resourceAllocation) {
		currentSession().delete(resourceAllocation);
	}

	public ResourceAllocation getById(long id) {
		ResourceAllocation resourceAllocation = (ResourceAllocation) sessionFactory.getCurrentSession().get(ResourceAllocation.class,
				id);
		return resourceAllocation;
	}
	
	public ResourceAllocation getByJobId(long id) {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(ResourceAllocation.class);
		criteria.add(Restrictions.eq("job.jobId", id));
		
		return (ResourceAllocation) criteria.uniqueResult();
	}
	
	

	@SuppressWarnings("unchecked")
	public List<ResourceAllocation> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(ResourceAllocation.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

	 public List<ResourceAllocation> getJobsByUser(long userId) {
		  Criteria criteria = sessionFactory.getCurrentSession()
		    .createCriteria(ResourceAllocation.class)
		    .setFetchMode("job", FetchMode.JOIN)
		    .setFetchMode("resource", FetchMode.JOIN);
		  criteria.createAlias("job", "j");
		  criteria.add(Restrictions.disjunction().add(Restrictions
		    .eq("resourceByProductionAllocatedId.resourceId",
		      userId))
		    .add(Restrictions.eq(
		      "resourceByFeedbackAllocatedId.resourceId", userId))
		    .add(Restrictions.eq(
		      "resourceByQaAllocatedId.resourceId", userId))
		    .add(Restrictions.eq("resourceByQcAllocatedId.resourceId",
		      userId)));
		  return criteria.list();
		 }

	 @SuppressWarnings("unchecked")
	 public List<ResourceAllocation> getJobsByJobStage(long userId) {
	  Criteria criteria = sessionFactory.getCurrentSession()
	    .createCriteria(ResourceAllocation.class)
	    .setFetchMode("job", FetchMode.JOIN)
	    .setFetchMode("resource", FetchMode.JOIN);
	  criteria.createAlias("job", "j");

	  Criterion production = Restrictions.and(Restrictions.eq(
	    "resourceByProductionAllocatedId.resourceId", userId),
	    Restrictions.eq("j.jobStage", Constants.Production));

	  Criterion qc = Restrictions.and(Restrictions.eq(
	    "resourceByQcAllocatedId.resourceId", userId),
	    Restrictions.eq("j.jobStage", Constants.QC));

	  Criterion qa = Restrictions.and(
	    Restrictions.eq("resourceByQaAllocatedId.resourceId", userId),
	    Restrictions.eq("j.jobStage", Constants.QA));
	  Criterion feedback = Restrictions.and(
	    Restrictions.eq("resourceByFeedbackAllocatedId.resourceId", userId),
	    Restrictions.eq("j.jobStage", Constants.Delivery));
	  criteria.add(Restrictions.disjunction(production, qc, qa, feedback));

	  return criteria.list();
	 }
	 
	 
	 
	 
	 
	 
}
