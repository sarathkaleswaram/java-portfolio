package com.projectMatrix.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.projectMatrix.model.Resource;
import com.projectMatrix.model.ResourceAllocation;
import com.projectMatrix.model.UserInfo;

@Repository
@Transactional
public class UserInfoDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

public  UserInfo getById(Long userInfoId){
	  Criteria criteria = currentSession().createCriteria(UserInfo.class);
	  criteria.add(Restrictions.eq("userInfoId", userInfoId));
	  return (UserInfo) criteria.uniqueResult();
}

public  UserInfo getByResourcrId(Long resourceId){
	  Criteria criteria = currentSession().createCriteria(UserInfo.class);
	  criteria.add(Restrictions.eq("resource.resourceId", resourceId));
	  return (UserInfo) criteria.uniqueResult();
}


	public  UserInfo getByUserName(Resource resource){
		Criteria criteria=currentSession().createCriteria(UserInfo.class);
		criteria.setFetchMode("resource", FetchMode.JOIN);
        criteria.createAlias("resource", "r");
		criteria.add(Restrictions.eq("r.empId", resource.getEmpId()));
		  return (UserInfo) criteria.uniqueResult();
	}
	
	
	public  UserInfo getByUserNamews(String resource){
		Criteria criteria=currentSession().createCriteria(UserInfo.class);
		criteria.setFetchMode("resource", FetchMode.JOIN);
        criteria.createAlias("resource", "r");
		criteria.add(Restrictions.eq("r.empId", resource));
		  return (UserInfo) criteria.uniqueResult();
	}
	
	public  UserInfo getByPassword(String  password){
		Criteria criteria=currentSession().createCriteria(UserInfo.class);
		criteria.setFetchMode("resource", FetchMode.JOIN);
//        criteria.createAlias("resource", "r");
		criteria.add(Restrictions.eq("password", password));
		  return (UserInfo) criteria.uniqueResult();
	}
	
	
	public void saveOrUpdate(UserInfo info){
		currentSession().saveOrUpdate(info);
	}
	
	public void delete(UserInfo info){
		currentSession().delete(info);
	}
	
	@SuppressWarnings("unchecked")
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
	      "resourceByProductionAllocatedId.resourceId", userId))
	    .add(Restrictions.eq("resourceByQcAllocatedId.resourceId",
	      userId)));

	  

	  return criteria.list();
	 }
}
