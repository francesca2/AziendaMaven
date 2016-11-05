<%@page import="it.alfasoft.francesca.bean.ClienteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

<%
    long id=Long.parseLong(request.getParameter("id_Utente"));
    String nome= request.getParameter("nome0");
    String cognome= request.getParameter("nome1");
    String username= request.getParameter("nome2");
    String rg= request.getParameter("nome3");
    String piva= request.getParameter("nome4");
    
    Servizi s= new Servizi();
    
    ClienteBean cbean=(ClienteBean) s.getUtenteById(id);
    
    String usnm=cbean.getUsername();
    if(!usnm.equals(username)){
    	if(cbean.isValid() && !s.trovaUsername(username)) {
    		cbean.setNome(nome);
    		cbean.setCognome(cognome);
    		cbean.setUsername(username);
    		cbean.setRagioneSociale(rg);
    		cbean.setpIVA(piva);
    		s.saveCliente(cbean);   
        %>
<jsp:forward page="ElencoClienti.jsp" />
<%
    }
   		 else{
    	message.setMessage("Lo username è già in uso oppure i dati inseriti non sono validi");
        %>
<jsp:forward page="ElencoClienti.jsp" />
<%
   			 }
    }
    else{
    	if(cbean.isValid()){
    		cbean.setNome(nome);
    		cbean.setCognome(cognome);
    		cbean.setUsername(username);
    		cbean.setRagioneSociale(rg);
    		cbean.setpIVA(piva);
    		s.saveCliente(cbean);       
        %>
<jsp:forward page="ElencoClienti.jsp" />
<%
    }
    else{
    	message.setMessage("Lo username è già in uso oppure i dati inseriti non sono validi");
        %>
<jsp:forward page="ElencoClienti.jsp" />
<%
    }
    }
    %>