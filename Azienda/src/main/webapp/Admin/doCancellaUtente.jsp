<%@page import="it.alfasoft.francesca.dao.ClienteDao"%>
<%@page import="it.alfasoft.francesca.bean.UtenteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	 <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

<%
Servizi s= new Servizi();

long id=Long.parseLong(request.getParameter("id_Utente"));

s.eliminaUtenteById(id);

response.sendRedirect("ElencoClienti.jsp");

%>