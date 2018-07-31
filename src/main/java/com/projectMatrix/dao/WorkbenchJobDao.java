package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.Resource;
import com.projectMatrix.model.WorkbenchJob;


@Repository
@Transactional
public class WorkbenchJobDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public void saveOrUpdate(WorkbenchJob workbenchJob){
		currentSession().saveOrUpdate(workbenchJob);
	}
	
	public void delete(WorkbenchJob workbenchJob){
		currentSession().delete(workbenchJob);
	}
	
	public WorkbenchJob getById(long id){
		WorkbenchJob workbenchJob = (WorkbenchJob) currentSession().get(WorkbenchJob.class, id);
		return workbenchJob;
	}
	
	@SuppressWarnings("unchecked")
	public List<WorkbenchJob> getAll() {
		Criteria criteria = currentSession().createCriteria(WorkbenchJob.class);
		return criteria.list();
	}
	
	public WorkbenchJob getByJobIdandWorkBenchId(Long jobId, Long workId,String jobStage) {
		Criteria criteria = currentSession().createCriteria(WorkbenchJob.class);
		criteria.add(Restrictions.eq("job.jobId", jobId));
		criteria.add(Restrictions.eq("workBench.workBenchId", workId));
		criteria.add(Restrictions.eq("jobStage", jobStage));
		return (WorkbenchJob) criteria.uniqueResult();
		
	}
	public List<WorkbenchJob> getAllByworkBenchId(long workBenchId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				WorkbenchJob.class);
		criteria.add(Restrictions.eq("workBench.workBenchId",workBenchId));
		return criteria.list();
	}

	
	
	
}
