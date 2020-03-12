package com.sanjeev.data;

import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.sanjeev.model.Item;

public class ItemDAOImpl implements ItemDAO {
	
	SessionFactory factory = SessionFactoryProvider.getSessionFactory();

	@Override
	public List<Item> getItems() throws Exception {
		
		Session session = factory.getCurrentSession();
		
		List<Item> items = null;
		
		try {
			session.beginTransaction();
			
			//HQL
			
			items = session.createQuery("from Item",Item.class).getResultList();
			
			session.getTransaction().commit();
			
		}
		finally {
			session.close();
		}
		
		return items;
			
	}

	@Override
	public void addOrUpdateItem(Item item) throws Exception {
		
		Session session = factory.getCurrentSession();
		
				
		try {
			session.beginTransaction();
			
			//session.save(item);
			
			session.saveOrUpdate(item); // saveOrUpdate() method work for both add and update
			
			session.getTransaction().commit();
			
		}
		finally {
			session.close();
		}
		
	}

	@Override
	public Item getItem(int itemCode) throws Exception {
		
		Session session = factory.getCurrentSession();
		
		Item item = null;
				
		try {
			session.beginTransaction();
			
			item = session.get(Item.class, itemCode);
			
			if(item == null) {
				throw new Exception("Could not find Item Code: " + itemCode);
			}
			
			session.getTransaction().commit();
			
		}
		finally {
			session.close();
		}
		
		return item;
		
		
	}

	@Override
	public void deleteItem(int itemCode) throws Exception {
		
		
		Session session = factory.getCurrentSession();
				
		try {
			session.beginTransaction();
			
			Item item  = session.get(Item.class,itemCode);
			
			session.delete(item);
			
			session.getTransaction().commit();
			
		}
		finally {
			session.close();
		}
	}
	
	@Override
	public List<Item> searchItems(String searchName) throws Exception {
		
		Session session = factory.getCurrentSession();
		List<Item> items = null;		
		try {
			
			session.beginTransaction();
			
			if(searchName != null  && searchName.trim().length()>0) {
			
			Query query  = session.createQuery("from Item i where i.itemName like '%' || :itemName || '%'");
			query.setParameter("itemName", searchName.toLowerCase());
			
			items = query.getResultList();
			}
			
			else {
				items = session.createQuery("from Item",Item.class).getResultList();
			}
			
			
			session.getTransaction().commit();
			
		}
		finally {
			session.close();
		}
		
		return items;
		
	}
	
}
