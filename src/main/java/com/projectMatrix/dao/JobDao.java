package com.projectMatrix.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.configration.Constants;
import com.projectMatrix.model.Job;

@Repository
@Transactional
public class JobDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Job job) {
		currentSession().saveOrUpdate(job);
	}

	public void delete(Job job) {
		currentSession().delete(job);
	}

	public Job getById(long id) {
		Job job = (Job) sessionFactory.getCurrentSession().get(Job.class, id);
		return job;
	}

	@SuppressWarnings("unchecked")
	public List<Job> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Job.class);
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Job> getJobsList() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Job.class);
		criteria.add(Restrictions.ne("jobStage",Constants.Approval));
		return criteria.list();
	}
	@SuppressWarnings("unchecked")
	public List<Job> getApprovedJobs() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Job.class);
		criteria.add(Restrictions.eq("jobStage",Constants.Approval));
		return criteria.list();
	}
	
	
	

	/*
	 * public List<ResourceAllocation> getResourceByJob(long job_id) { Criteria
	 * criteria
	 * =sessionFactory.getCurrentSession().createCriteria(ResourceAllocation
	 * .class); criteria.add(Restrictions.eq("job.jobId", job_id)); //
	 * criteria.add(Restrictions.eq("", ""));
	 * 
	 * return criteria.list(); }
	 */

	public List<Job> getJobsByProject(long projectId) {

		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Job.class)
				.setFetchMode("project", FetchMode.JOIN);
		criteria.add(Restrictions.eq("project.projectId", projectId));

		return criteria.list();

	}
	
	public List<Job> getJobsByProjectandDates(long projectId, Date from, Date to) {

		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Job.class)
				.setFetchMode("project", FetchMode.JOIN);
		criteria.add(Restrictions.eq("project.projectId", projectId));
		criteria.add(Restrictions.ge("expectedDelivery", from));
		criteria.add(Restrictions.le("expectedDelivery", to));
		return criteria.list();

	}

	public List<Job> getJobByProjectWhereJobsIncomplete(long projectId) {

		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Job.class)
				.setFetchMode("project", FetchMode.JOIN);
		criteria.add(Restrictions.eq("project.projectId", projectId));
//		criteria.createAlias("project", "p");
		criteria.add(Restrictions.ne("jobStage", Constants.Approval));
		criteria.add(Restrictions.ne("jobStatus", Constants.Query));
		criteria.add(Restrictions.ne("jobStatus", Constants.Hold));
//		criteria.add(Restrictions.ne("p.CFT1", "N"));
		return criteria.list();

	}
	
	public List<Job> getJobsCountByDates(long proId, Date from, Date to){
		
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Job.class)
				.setFetchMode("project", FetchMode.JOIN);
		criteria.add(Restrictions.eq("project.projectId", proId));
		criteria.add(Restrictions.ge("deliveredOn", from));
		criteria.add(Restrictions.le("deliveredOn", to));
		
		return criteria.list();
		
	}

	public int getCountByDeliveryDate(long projectId, Date date) {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Job.class)
				.setFetchMode("project", FetchMode.JOIN);
		criteria.add(Restrictions.eq("project.projectId", projectId)).add(Restrictions.eq("deliveredOn", date));
		
		
		System.out.println("Dao coming"+date);
		System.out.println("joblist---------"+criteria.list());
		
		return criteria.list().size();
	}
	
public List<Job> getAllJobsByDates(Date from, Date to){
		
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Job.class);
		criteria.add(Restrictions.ge("deliveredOn", from));
		criteria.add(Restrictions.le("deliveredOn", to));
		return criteria.list();
	}
	
	
	
	
	
	
	
	

}
