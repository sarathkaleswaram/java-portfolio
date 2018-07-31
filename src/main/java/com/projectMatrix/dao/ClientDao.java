package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.Client;

@Repository
@Transactional
public class ClientDao {

	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Client client) {
		currentSession().saveOrUpdate(client);
	}

	public void delete(Client client) {
		currentSession().delete(client);
	}

	public Client getById(int id) {
		Client client = (Client) sessionFactory.getCurrentSession().get(
				Client.class, id);
		return client;
	}

	@SuppressWarnings("unchecked")
	public List<Client> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Client.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);
		return criteria.list();
	}

}
