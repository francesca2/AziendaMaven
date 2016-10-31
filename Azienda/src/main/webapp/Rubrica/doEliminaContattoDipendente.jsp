<%@page import="model.Rubrica"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="dipendente" class="it.alfasoft.francesca.bean.DipendenteBean"
	scope="session"></jsp:useBean>
<%
Servizi s= new Servizi();

long id=Long.parseLong(request.getParameter("id_Voce"));

String usn= dipendente.getUsername();

Rubrica r=s.trovaRubrica(usn);

s.eliminaVoce(r, id);

response.sendRedirect("ElencoContattiDipendente.jsp");

%>