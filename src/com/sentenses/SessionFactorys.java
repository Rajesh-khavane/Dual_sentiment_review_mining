package com.sentence.based;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class SessionFactorys {
	private static SessionFactory session=null;
	public static SessionFactory getSessionFactory()
	{
		try{
	         session = new AnnotationConfiguration().
	                   configure().                  
	                   buildSessionFactory();
	      }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
		return session;
	}
	public static void main(String args[])
	{
		if(SessionFactorys.getSessionFactory()!=null)

			System.out.println("hello");
		else
			System.out.println("hi");
	}
	
}
