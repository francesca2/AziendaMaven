<%@page import="model.Rubrica"%>
<%@page import="it.alfasoft.francesca.bean.DipendenteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

<%
    long id=Long.parseLong(request.getParameter("id_Utente"));
    String nome= request.getParameter("nome0");
    String cognome= request.getParameter("nome1");
    String username= request.getParameter("nome2");
    String posizione= request.getParameter("nome3");
    double stipendio=Double.parseDouble(request.getParameter("nome4"));
    
    Servizi s= new Servizi();
    
    DipendenteBean dbean=(DipendenteBean) s.getUtenteById(id);
    
    String usnm=dbean.getUsername();
    if(!usnm.equals(username)){
    	if(dbean.isValid() && !s.trovaUsername(username)) {
    		dbean.setNome(nome);
    		dbean.setCognome(cognome);
    		dbean.setUsername(username);
    		dbean.setPosizione(posizione);
    		dbean.setStipendio(stipendio);
    		s.saveDipendente(dbean);  
    		Rubrica r= s.trovaRubrica(usnm);
    		r.setNomeRubrica(username);
    		s.saveRubrica(r);
        %>
<jsp:forward page="ElencoDipendenti.jsp" />
<%
    }
   		 else{
    	message.setMessage("Lo username è già in uso oppure i dati inseriti non sono validi");
        %>
<jsp:forward page="ElencoDipendenti.jsp" />
<%
   			 }
    }
    else{
    	if(dbean.isValid()){
    		dbean.setNome(nome);
    		dbean.setCognome(cognome);
    		dbean.setUsername(username);
    		dbean.setPosizione(posizione);
    		dbean.setStipendio(stipendio);
    		s.saveDipendente(dbean);       
        %>
<jsp:forward page="ElencoDipendenti.jsp" />
<%
    }
    else{
    	message.setMessage("Lo username è già in uso oppure i dati inseriti non sono validi");
        %>
<jsp:forward page="ElencoDipendenti.jsp" />
<%
    }
    }
    %>