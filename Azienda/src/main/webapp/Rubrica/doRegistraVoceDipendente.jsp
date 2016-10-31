
<%@page import="model.Voce"%>
<%@page import="model.Rubrica"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="dipendente" class="it.alfasoft.francesca.bean.DipendenteBean"
	scope="session"></jsp:useBean>
     <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

     <%
     String nome=request.getParameter("nome");
     String cognome= request.getParameter("cognome");
     String telefono= request.getParameter("telefono");
     
     Servizi s= new Servizi();
     
     String username = dipendente.getUsername();
     char ruolo=dipendente.getRuolo();
     Rubrica r=s.trovaRubrica(username);

     Voce v= new Voce(nome,cognome,telefono);
     if(v.isValid()) {
    	 s.registraVoce(r, v);
    	 switch(ruolo) {
    	 
    	 case 'c' :
    		 message.setMessage("Voce aggiunta alla tua rubrica!");
 	    	%>
 		<jsp:forward page="../HomePage/HomePageDipendente.jsp" />
 		<%
 		break;
 		
 		case 'd' :
	    	%>
	    	 message.setMessage("Voce aggiunta alla tua rubrica!");
		<jsp:forward page="../HomePage/HomePageDipendente.jsp" />
		<%
		break;
    	 
    	 }
    	 
     }
     %>