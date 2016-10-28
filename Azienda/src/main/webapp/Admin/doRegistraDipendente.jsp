<%@page import="it.alfasoft.francesca.bean.DipendenteBean"%>
<%@page import="it.alfasoft.francesca.bean.ClienteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="utente" class="it.alfasoft.francesca.bean.UtenteBean"
	scope="session"></jsp:useBean>
	    <jsp:useBean id="dipendente" class="it.alfasoft.francesca.bean.DipendenteBean"
	scope="request"></jsp:useBean>	
<jsp:setProperty property="*" name="dipendente"/>
	 <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

    <%

    dipendente.setRuolo('d');    
    Servizi s= new Servizi();
    
    if(dipendente.isValid() && !s.trovaUsername(dipendente.getUsername())) {
    	String password=s.convertiPass(dipendente.getPassword());
    	dipendente.setPassword(password);
        s.registraDipendente(dipendente);
        s.registraRubrica(dipendente.getUsername());
        message.setMessage("Dipendente registrato!");
        
        %>
    	<jsp:forward page="../HomePage/HomePageAdmin.jsp"/>
    <%
    }
    else{
    	message.setMessage("Lo username è già in uso oppure i dati inseriti non sono validi");
        %>
    	<jsp:forward page="RegistrazioneNuovoCliente.jsp"/>
    <%
    }

    
    %>