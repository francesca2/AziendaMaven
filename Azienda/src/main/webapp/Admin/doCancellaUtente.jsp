<%@page import="it.alfasoft.francesca.dao.ClienteDao"%>
<%@page import="it.alfasoft.francesca.bean.UtenteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:setProperty property="*" name="dipendente"/>
    
        <jsp:useBean id="utente" class="it.alfasoft.francesca.bean.UtenteBean"
	scope="session"></jsp:useBean>
	 <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

<%
Servizi s= new Servizi();
UtenteBean u= s.getUtente(request.getParameter("username"));
s.eliminaUtente(u);

response.sendRedirect("ElencoClienti.jsp");

%>