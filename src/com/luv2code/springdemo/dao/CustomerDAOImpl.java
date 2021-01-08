package com.luv2code.springdemo.dao;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Customer> getCustomers() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query <Customer> query = 
				currentSession.createQuery("from Customer order by lastname", Customer.class);
		
		List<Customer> customers  = query.getResultList();
		return customers;
		
		
	}
	
	@Transactional
	public void saveCustomer(Customer theCustomer)
	{
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(theCustomer); 
	}

	@Transactional
	@Override
	public Customer getCustomer(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Customer c = currentSession.get(Customer.class,id);
		return c;
	}

	@Transactional
	@Override
	public void deleteCustomer(int theid) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = 
				currentSession.createQuery("delete from Customer  where id = :customerId");
		query.setParameter("customerId", theid);
		query.executeUpdate();
	}

}
