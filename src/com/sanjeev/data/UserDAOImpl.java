package com.sanjeev.data;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sanjeev.model.User;

public class UserDAOImpl implements UserDAO {
	
	SessionFactory factory = SessionFactoryProvider.getSessionFactory();

	@Override
	public void addUser(User user) throws Exception {
		
		
		Session session = factory.getCurrentSession();
		
		try {
			
			session.beginTransaction();
			
			session.save(user);
			
			session.getTransaction().commit();
		}
		finally {
			session.close();
		}
		
			
	}

	@Override
	public User getUser(String userId) throws Exception {
		
		Session session = factory.getCurrentSession();
		
		User user = null;
		
		try {
			
			session.beginTransaction();
			
			user = session.get(User.class, userId);
			
			if(user == null) {
				throw new Exception("Invalid user id");
			}
			
			session.getTransaction().commit();
		}
		finally {
			session.close();
		}
		
		return user;
		
		
	}

	@Override
	public void updatePhoto(String userId, byte[] photo) throws Exception {
		
		
	Session session = factory.getCurrentSession();
		User user = null;
		try {
			
			session.beginTransaction();
			
			user = session.get(User.class, userId);
			
			user.setPhoto(photo);
			
			session.getTransaction().commit();
		}
		finally {
			session.close();
		}
				
	}

}
