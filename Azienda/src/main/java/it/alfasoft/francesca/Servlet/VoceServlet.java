package it.alfasoft.francesca.Servlet;

import it.alfasoft.francesca.dao.VoceDao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Voce;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

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
		
		String nome=request.getParameter("nome");
		String cognome=request.getParameter("cognome");
		long id=Long.parseLong(request.getParameter("id"));
	
		PrintWriter out=response.getWriter();
		
		Gson gson=new Gson();
		
		JsonObject jobj= new JsonObject();
		
		Voce voce=this.getVoce(nome,cognome,id);
		
		
		JsonElement sudenteJson= gson.toJsonTree(voce);
		
		if(voce== null){
			jobj.addProperty("success",false);
			
		}else{
			jobj.addProperty("success",true);
		}
		
		jobj.add("studente", sudenteJson);
		
		out.println(jobj.toString());
		
		System.out.println(jobj);
		
		
		out.close();
	}
	
	public Voce getVoce(String nome,String cognome, long id){
		VoceDao vDao=new VoceDao();
		
		return vDao.trovaVoce(nome, cognome, id);
		
	}

}

