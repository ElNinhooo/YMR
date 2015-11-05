package org.yves.project.ymr.hibernate.test;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.yves.project.ymr.model.TbLanguages;

public class TestHibernate {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TbLanguages lg = new TbLanguages("Francais");
		
		SessionFactory sessionFactory = new Configuration().configure("../src/hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(lg);
		session.getTransaction().commit();
	}

}
