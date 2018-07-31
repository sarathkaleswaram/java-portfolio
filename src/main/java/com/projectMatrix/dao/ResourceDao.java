package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.configration.Constants;
import com.projectMatrix.model.Resource;

@Transactional
@Repository
public class ResourceDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Resource resource) {
		currentSession().saveOrUpdate(resource);
	}

	public void delete(Resource resource) {
		currentSession().delete(resource);
	}

	public Resource getById(long id) {
		Resource resource = (Resource) sessionFactory.getCurrentSession().get(
				Resource.class, id);
		return resource;
	}

	public List<Resource> getAllByRoleTemLead() {
		Criteria criteria = currentSession().createCriteria(Resource.class)
				.setFetchMode("resourceTable", FetchMode.JOIN);
		Criterion tl = Restrictions.and(Restrictions.eq("role",
				Constants.TeamLead));
		Criterion manager = Restrictions.and(Restrictions.eq("role",
				Constants.Manager));

		criteria.add(Restrictions.disjunction(tl, manager));

		return criteria.list();
	}

	public List<Resource> getAllByDesignationEmployee() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);
		criteria.add(Restrictions.ne("designation", Constants.COO))
				.add(Restrictions.ne("designation", Constants.AVP))
				.add(Restrictions.ne("designation", Constants.CEO));
		/*
		 * criteria.add(Restrictions.ne("designation", Constants.AVP));
		 * criteria.add(Restrictions.ne("designation", Constants.CEO));
		 */
		return criteria.list();
	}
	
	public Resource getByEmpId(final String empid) {
		Criteria criteria = currentSession().createCriteria(Resource.class);
		criteria.add(Restrictions.eq("empId", empid));
		return (Resource) criteria.uniqueResult();
	}


	public Resource getByResourceName(final String rfn) {
		Criteria criteria = currentSession().createCriteria(Resource.class);
		criteria.add(Restrictions.eq("firstName", rfn));
		return (Resource) criteria.uniqueResult();
	}

	public List<Resource> getAllByProjectId(long ProjectId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);
		criteria.add(Restrictions.ne("designation", "TeamLeader"));
		String sqlStr = "Select * from team_members";
		criteria.add(Restrictions.sqlRestriction(sqlStr));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Resource> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);

		return criteria.list();
	}

	public List<Resource> getResourceByTMId(List<Long> longlist) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);

		// criteria.add(Restrictions.in("resourceId", longlist));

		criteria.add(Restrictions.not(Restrictions.in("resourceId", longlist)));

		// criteria.add(Restrictions.not(Restrictions.in("resourceId",
		// longlist)));

		return criteria.list();
	}

	public List<Resource> getAllByRoles() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);
		criteria.add(Restrictions.disjunction()
				.add(Restrictions.eq("role", Constants.Manager))
				.add(Restrictions.eq("role", Constants.Admin)));
		return criteria.list();
	}

	public List<Resource> getResourceUnderSuperAdmin() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);
		criteria.add(Restrictions.ne("role", Constants.User));
		
//		return criteria.list();		
		return criteria.addOrder(Order.desc("firstName")).list();
	}
	
	public List<Resource> getResourceUnderAdmin() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);
		criteria.add(Restrictions.ne("role", Constants.SuperAdmin));
		criteria.add(Restrictions.ne("role", Constants.User));
		
		return criteria.addOrder(Order.asc("firstName")).list();
//		return criteria.list();		
	}

	public List<Resource> getResourceUnderManager() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);
		criteria.add(Restrictions.ne("role", Constants.SuperAdmin));
		criteria.add(Restrictions.ne("role", Constants.Admin));
		criteria.add(Restrictions.ne("role", Constants.User));
		
//		return criteria.list();	
		return criteria.addOrder(Order.asc("firstName")).list();
	}

	public List<Resource> getResourceUnderTeamLead() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);
		criteria.add(Restrictions.ne("role", Constants.SuperAdmin));
		criteria.add(Restrictions.ne("role", Constants.Admin));
		criteria.add(Restrictions.ne("role", Constants.Manager));
		criteria.add(Restrictions.ne("role", Constants.User));
		
//		return criteria.list();	
		return criteria.addOrder(Order.asc("firstName")).list();
	}
	public List<Resource> getAllByrollWs() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Resource.class);
		return criteria.list();
	}


}
