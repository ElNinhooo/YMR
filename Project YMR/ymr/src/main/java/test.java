import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.yves.project.ymr.model.*;


public class test {

	public static void main(String[] args) {
		
		
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		TbLanguages lg = new TbLanguages("Deutsch");
		TbCountries country = new TbCountries(lg,"Germany");
		session.save(lg);
		session.save(country);
		session.getTransaction().commit();
		session.close();
	}

}
