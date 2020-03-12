package com.sanjeev.data;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sanjeev.model.Item;
import com.sanjeev.model.User;

public class SessionFactoryProvider {
	
	private static SessionFactory factory = null;
	
	public static SessionFactory getSessionFactory() {
		
		factory = new  Configuration()
				.configure("hibernate.cfg.xml")
				.addAnnotatedClass(User.class)
				.addAnnotatedClass(Item.class)
				.buildSessionFactory();
		
		return factory;
		
	}

}
