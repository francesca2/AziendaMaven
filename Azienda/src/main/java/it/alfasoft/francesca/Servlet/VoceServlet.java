package it.alfasoft.francesca.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Rubrica;
import model.Voce;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import it.alfasoft.francesca.bean.UtenteBean;
import it.alfasoft.francesca.dao.VoceDao;
import it.alfasoft.francesca.service.Servizi;


/**
 * Servlet implementation class VoceServlet
 */
@WebServlet(description = "questo viene chiamata tramite ajax", urlPatterns = { "/trovaVoce" })
public class VoceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome=request.getParameter("nme");
		String cognome=request.getParameter("cgnm");
		long id=Long.parseLong(request.getParameter("id"));
	
		PrintWriter out=response.getWriter();
		
		Gson gson=new Gson();
		
		JsonObject jobj= new JsonObject();
		
		Voce voce=this.getVoce(nome,cognome,id);

		JsonElement voceJson= gson.toJsonTree(voce);
		
		if(voce== null){
			jobj.addProperty("success",false);
			
		}else{
			jobj.addProperty("success",true);
		}
		
		jobj.add("voce", voceJson);
		
		out.println(jobj.toString());
		
		System.out.println(jobj);
		
		
		out.close();
	}
	
	public Voce getVoce(String nome,String cognome,long id){
		Servizi s=new Servizi();
		
		UtenteBean u=s.getUtenteById(id);
		Rubrica r=s.trovaRubrica(u.getUsername());
		VoceDao vDao=new VoceDao();
		return vDao.trovaVoce(nome, cognome, r.getId_Rubrica());
		
	}

}

