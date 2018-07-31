package com.projectMatrix.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectMatrix.model.Invoice;

@Repository
@Transactional
public class InvoiceDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Invoice invoice) {
		currentSession().saveOrUpdate(invoice);
	}

	public void delete(Invoice invoice) {
		currentSession().delete(invoice);
	}

	public Invoice getById(long id) {
		Invoice invoice = (Invoice) sessionFactory.getCurrentSession().get(
				Invoice.class, id);
		return invoice;
	}

	@SuppressWarnings("unchecked")
	public List<Invoice> getAll() {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(Invoice.class)
				.setFetchMode("client_vertical", FetchMode.JOIN);

		return criteria.list();
	}

}
