package com.projectMatrix.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.configration.Constants;
import com.projectMatrix.model.WorkBench;

@Transactional
@Repository
public class WorkBenchDao {

	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(WorkBench workBench) {
		currentSession().saveOrUpdate(workBench);
	}

	public WorkBench getById(long id) {
		WorkBench workBench = (WorkBench) sessionFactory.getCurrentSession()
				.get(WorkBench.class, id);
		return workBench;
	}

	@SuppressWarnings("unchecked")
	public List<WorkBench> getByUser(Long User) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				WorkBench.class);
		criteria.add(Restrictions.eq("resource.resourceId", User));
		return criteria.addOrder(Order.desc("doc")).list();
	}
	
	public List<WorkBench> getAll(){
		Criteria criteria = currentSession().createCriteria(WorkBench.class);
		return criteria.list();
	}
	
	public List<WorkBench> getByDatesAndWorkedOn(Date from, Date to, String workedOn){
		Criteria criteria = currentSession().createCriteria(WorkBench.class);
		criteria.add(Restrictions.ge("doc", from));
		criteria.add(Restrictions.le("doc", to));
		criteria.add(Restrictions.eq("workedOn", workedOn));
		return criteria.list();
	}

	public List<WorkBench> getByDatesAndWorkedOnWhenOthers(Date fromDate,
			Date toDate, String workedOn) {
		Criteria criteria = currentSession().createCriteria(WorkBench.class);
		criteria.add(Restrictions.ge("doc", fromDate));
		criteria.add(Restrictions.le("doc", toDate));
		criteria.add(Restrictions.ne("workedOn", Constants.InTraining));
		criteria.add(Restrictions.ne("workedOn", Constants.OnBench));
		criteria.add(Restrictions.ne("workedOn", Constants.ProjectManagement));
		return criteria.list();
	}

	public List<WorkBench> getAllByDates(Date fromDate, Date toDate) {
		Criteria criteria = currentSession().createCriteria(WorkBench.class);
		criteria.add(Restrictions.ge("doc", fromDate));
		criteria.add(Restrictions.le("doc", toDate));
		return criteria.list();
	}

	public WorkBench getByResourceIdAndDate(Long resourceId, Date date) {
		Criteria criteria = currentSession().createCriteria(WorkBench.class);
		
//		 Criterion qa = Restrictions.and(
//				    Restrictions.eq("resource.resourceId", resourceId),
//				    Restrictions.eq("doc",date));
//		 criteria.add(Restrictions.disjunction(qa));
		criteria.add(Restrictions.eq("resource.resourceId", resourceId));
		criteria.add(Restrictions.eq("doc", date));

		 
		return (WorkBench) criteria.uniqueResult();
		
		
	}

}
