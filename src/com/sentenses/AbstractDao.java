package com.sentence.based;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;


public class AbstractDao implements DataAccess{

	private static SessionFactory factory;
	public AbstractDao() {
		// TODO Auto-generated constructor stub
		setFactory(SessionFactorys.getSessionFactory());
	}

	
	@Override
	public String add(DataInterface dataInterface) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
	      Transaction tx = null;
	      String result="error";
	      try{
	         tx = session.beginTransaction();
		         session.save(dataInterface); 
		         tx.commit();
		         result="Added";
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace();	         
	      }finally {
	         session.close(); 
	      }
		return result;	     
	}
	
	
	public String addByCriteria(HashMap<String , String> map, DataInterface dataInterface,Class<?> da) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction tx = null;
		String result="error";
		try{
	    	  	tx = session.beginTransaction();
	    	  	int flag=0;
	    	  	if(map.size()>0)
	    	  	{	
	    	  		Criteria criteriaclasses=createCriteriaQuery(session, map, da);
	    	  		if(criteriaclasses.uniqueResult()!=null)
	    	  			flag=1;
	    	  	}
	    	  	if(flag==0)
		    	{
	    	  		session.save(dataInterface); 
			        tx.commit();
			        result="Added";
	    	  	}
	    	  	else
	    	  	{
	    	  		result="Already Exist";
	    	  	}
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace();	         
	      }finally {
	         session.close(); 
	      }
		return result;	     
	}
	

	public Object authenticate(HashMap<String , String> map,Class<?> da) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction tx = null;
		try{
	    	  	tx = session.beginTransaction();
	    	  	if(map.size()>0)
	    	  	{	
	    	  		Criteria criteriaclasses=createCriteriaQuery(session, map, da);
	    	  		return criteriaclasses.uniqueResult();	
	    	  	}
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace();	         
	      }finally {	
	         session.close(); 
	      }
		return null;	     
	}
	
	public Criteria createCriteriaQuery(Session session,HashMap<String , String> mp,Class<?> da)
	{
		Iterator<Entry<String, String>> it = mp.entrySet().iterator();
		Criteria criteriaclasses = session.createCriteria(da);
	    while (it.hasNext()) {
	        @SuppressWarnings("rawtypes")
			Map.Entry pair = (Map.Entry)it.next();
	        //System.out.println(pair.getKey() + " = " + pair.getValue());
	        it.remove(); // avoids a ConcurrentModificationException
	        criteriaclasses.add(Restrictions.eq(pair.getKey().toString(), pair.getValue()));
	    }
	    return criteriaclasses;
	}
	
	
	
	@Override
	public String delete(DataInterface dataInterface) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
	      Transaction tx = null;
	      String result="error";
	      try{
	         tx = session.beginTransaction();
		         session.delete(dataInterface); 
		         tx.commit();
		         result="Deleted";
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace();	         
	      }finally {
	         session.close(); 
	      }
		return result;
	}

	
	
	@Override
	public String update(DataInterface dataInterface) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
	      Transaction tx = null;
	      String result="error";
	      try{
	         tx = session.beginTransaction();
		         session.update(dataInterface); 
		         tx.commit();
		         result="updated";
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace();	         
	      }finally {
	         session.close(); 
	      }
		return result;
	}

	
	
	@Override
	public Object getById(String colname,String value,Class<?> da) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	       
	         Criteria criteriaclasses = session.createCriteria(da)
	                    .add(Restrictions.eq(colname, value));
	         return criteriaclasses.uniqueResult();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace();	         
	      }finally {
	         session.close(); 
	      }
		return null;
	}
	
	
	
	@Override
	public Object getById(String colname,long value,Class<?> da) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         Criteria criteriaclasses = session.createCriteria(da)
	                    .add(Restrictions.eq(colname, value));
	         return criteriaclasses.uniqueResult();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace();	         
	      }finally {
	         session.close(); 
	      }
		return null;
	}
	
	@SuppressWarnings("unused")
	public Object getMaxId(String colname,Class<?> da) {
		// TODO Auto-generated method stub
			Session session = factory.openSession();
			Transaction tx = null;
	      try{
	    	  Criteria c = session.createCriteria(da);
	  			c.addOrder(Order.desc(colname));
	  			c.setMaxResults(1);
	  		return c.uniqueResult();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace();	         
	      }finally {
	         session.close(); 
	      }
		return null;
	}
	
	

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<DataInterface> listByQuery(String hSql) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
	    Transaction tx = null;
	    List<?> dataInterfaceList=null;
	    try{
	       tx = session.beginTransaction();
		   dataInterfaceList = session.createQuery(hSql).list(); 
	       tx.commit();
	       
	    }catch (HibernateException e) {
	        if (tx!=null) tx.rollback();
	        e.printStackTrace(); 
	       
	     }finally {
	        session.close();
	     }
		return (List<DataInterface>)dataInterfaceList;
	}

	
	public static SessionFactory getFactory() {
		return factory;
	}

	
	public static void setFactory(SessionFactory factory) {
		AbstractDao.factory = factory;
	}
	

	public static void main(String args[]) {
		/*
		
		*/
		@SuppressWarnings("unused")
		AbstractDao abstractDao=new AbstractDao();
		
		
		
		
		
		
		
		
		//System.out.println(features.toString());
	}
	
	
	
}
