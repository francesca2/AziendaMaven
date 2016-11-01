<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Servizi s= new Servizi();

long id=Long.parseLong(request.getParameter("id_BustaPaga"));

s.eliminaUtenteById(id);

response.sendRedirect("ElencoBustePaga.jsp");

%>