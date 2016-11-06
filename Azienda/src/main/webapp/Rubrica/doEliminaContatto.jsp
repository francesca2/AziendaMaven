<%@page import="it.alfasoft.francesca.bean.UtenteBean"%>
<%@page import="model.Rubrica"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
Servizi s= new Servizi();

long id=Long.parseLong(request.getParameter("id_Voce"));

long idutn=Long.parseLong(request.getParameter("id_Utente"));

UtenteBean u=s.getUtenteById(idutn);

String usn=u.getUsername();

Rubrica r=s.trovaRubrica(usn);

s.eliminaVoce(r, id);

char ruolo=u.getRuolo();

if(ruolo=='c'){
response.sendRedirect("ElencoContattiCliente.jsp");
}
else if(ruolo=='d'){
	response.sendRedirect("ElencoContattiDipendente.jsp");
}

%>