<%@page import="it.alfasoft.francesca.bean.ClienteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="utente" class="it.alfasoft.francesca.bean.UtenteBean"
	scope="session"></jsp:useBean>
	 <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

    <%
    String nome= request.getParameter("nome");
    String cognome= request.getParameter("cognome");
    String username= request.getParameter("username");
    String password= request.getParameter("password");
    String rg= request.getParameter("ragioneSociale");
    String piva= request.getParameter("piva");
    
    ClienteBean cbean= new ClienteBean(nome,cognome,username,password,'c',rg,piva);
    
    Servizi s= new Servizi();
    
    if(cbean.isValid() && !s.trovaUsername(username)) {
    	password=s.convertiPass(password);
    	cbean.setPassword(password);
        s.registraCliente(cbean);
        s.registraRubrica(username);        
        %>
    	<jsp:forward page="ElencoClienti.jsp"/>
    <%
    }
    else{
    	message.setMessage("Lo username è già in uso oppure i dati inseriti non sono validi");
        %>
    	<jsp:forward page="RegistrazioneNuovoCliente.jsp"/>
    <%
    }

    
    %>