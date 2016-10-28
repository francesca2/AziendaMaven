
<%@page import="model.Voce"%>
<%@page import="model.Rubrica"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="cliente" class="it.alfasoft.francesca.bean.ClienteBean"
	scope="session"></jsp:useBean>
     <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

     <%
     String nome=request.getParameter("nome");
     String cognome= request.getParameter("cognome");
     String telefono= request.getParameter("telefono");
     
     Servizi s= new Servizi();
     
     String username = cliente.getUsername();
     char ruolo=cliente.getRuolo();
     Rubrica r=s.trovaRubrica(username);

     Voce v= new Voce(nome,cognome,telefono);
     if(v.isValid()) {
    	 s.registraVoce(r, v);
    	 switch(ruolo) {
    	 
    	 case 'c' :
    		 message.setMessage("Voce aggiunta alla tua rubrica!");
 	    	%>
 		<jsp:forward page=".././HomePage/HomePageCliente.jsp" />
 		<%
 		break;
 		
 		case 'd' :
	    	%>
	    	 message.setMessage("Voce aggiunta alla tua rubrica!");
		<jsp:forward page=".././HomePage/HomePageCliente.jsp" />
		<%
		break;
    	 
    	 }
    	 
     }
     %>