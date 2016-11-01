<%@page import="model.BustaPaga"%>
<%@page import="it.alfasoft.francesca.bean.DipendenteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

    <%
Servizi s= new Servizi();


long id=Long.parseLong(request.getParameter("id_Utente"));
long importo=Long.parseLong(request.getParameter("importo"));
String data=request.getParameter("data");

DipendenteBean d= (DipendenteBean) s.getUtenteById(id);

BustaPaga b= new BustaPaga();

b.setData(data);
b.setDipendente(d);
b.setImporto(importo);

	s.salvaBustaPaga(b);
	response.sendRedirect("../HomePage/HomePageAdmin.jsp");	



%>