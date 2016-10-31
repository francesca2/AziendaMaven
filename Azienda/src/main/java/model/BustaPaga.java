package model;

import java.util.List;

import it.alfasoft.francesca.bean.DipendenteBean;
import it.alfasoft.francesca.dao.DipendenteDao;

import javax.persistence.*;

import Utility.IsValid;

@Entity
public class BustaPaga implements IsValid {

	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id_BustaPaga;
	
	@ManyToOne
	private DipendenteBean dipendente;
	
	private String date;
	private long importo;
	
	public BustaPaga() {
	}

	public long getId_BustaPaga() {
		return id_BustaPaga;
	}

	public void setId_BustaPaga(long id_BustaPaga) {
		this.id_BustaPaga = id_BustaPaga;
	}
	
	public DipendenteBean getDipendente() {
		return dipendente;
	}
	
	public void setDipendente(DipendenteBean dipendente) {
		this.dipendente = dipendente;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public long getImporto() {
		return importo;
	}

	public void setImporto(long importo) {
		this.importo = importo;
	}

	@Override
	public boolean isValid() {
		boolean result=false;
		DipendenteDao ddao=new DipendenteDao();
		List<DipendenteBean> lista=ddao.getTuttiDipendenti();
		if(lista.contains(dipendente) && importo<=dipendente.getStipendio())
		{
			result=true;
		}
		return result;
	}

}
