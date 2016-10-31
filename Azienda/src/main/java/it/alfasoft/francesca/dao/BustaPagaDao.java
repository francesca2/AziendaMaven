package it.alfasoft.francesca.dao;

import it.alfasoft.francesca.bean.DipendenteBean;

import java.util.ArrayList;
import java.util.List;

import hibernateUtil.HibernateUtil;
import model.BustaPaga;
import model.Rubrica;
import model.Voce;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BustaPagaDao {

	public boolean aggiungiBustaPaga(BustaPaga b)
	{
		boolean result=false;
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		session.persist(b);
		
		 result=true;
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		
		return result;

	}
	
	public List<BustaPaga> getBustePaga(DipendenteBean d)
	{
		List<BustaPaga> lista= new ArrayList<BustaPaga>();
		long id=d.getId_Utente();
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
		tx=session.getTransaction();
		tx.begin();

		Query query= session.createQuery("from BustaPaga where Dipendente_Id_Dipendente=:x");
		query.setLong("x", id);
		lista=query.list();
		
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return lista;
	}
	
	public boolean eliminaBustaPaga(BustaPaga b)
	{
		boolean result=false;
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		session.delete(b);
		result=true;
		 
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return result;
}

}
