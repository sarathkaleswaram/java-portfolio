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

import com.projectMatrix.model.JobStage;
import com.projectMatrix.model.UserInfo;
@Repository
@Transactional
public class JobStageDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(JobStage jobStage) {
		currentSession().saveOrUpdate(jobStage);
	}

	public void delete(JobStage jobStage) {
		currentSession().delete(jobStage);
	}

	public JobStage getById(long id) {
		JobStage jobStage = (JobStage) sessionFactory.getCurrentSession().get(
				JobStage.class, id);
		return jobStage;
	}

	@SuppressWarnings("unchecked")
	public List<JobStage> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(JobStage.class);

		return criteria.list();
	}

	public List<JobStage> getJobStageByJobId(long job_id) {
		 Criteria criteria = currentSession().createCriteria(JobStage.class);
		  criteria.add(Restrictions.eq("job.jobId", job_id));
		  return  criteria.list();
	}
	
	public List<JobStage> getJobStageByDates(Date date) {
		 Criteria criteria = currentSession().createCriteria(JobStage.class);
		  criteria.add(Restrictions.eq("wipTime", date));
		  return  criteria.list();
	}


}
