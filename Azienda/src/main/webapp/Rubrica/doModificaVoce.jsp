<%@page import="model.Voce"%>
<%@page import="it.alfasoft.francesca.bean.UtenteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    long id=Long.parseLong(request.getParameter("id_Utente"));
long idv=Long.parseLong(request.getParameter("id_Voce"));
    String nome= request.getParameter("nome0");
    String cognome= request.getParameter("nome1");
    String telefono= request.getParameter("nome2");
    
    Servizi s= new Servizi();
    
    UtenteBean ubean= s.getUtenteById(id);
    Voce v=s.getVoceById(idv);
   
    		v.setNomeVoce(nome);
    		v.setCognomeVoce(cognome);
    		v.setTelefono(telefono);
    		s.saveVoce(v);
    		char ruolo=ubean.getRuolo();

    		if(ruolo=='c'){
    		response.sendRedirect("ElencoContattiCliente.jsp");
    		}
    		else if(ruolo=='d'){
    			response.sendRedirect("ElencoContattiDipendente.jsp");
    		}

  %>	
    		