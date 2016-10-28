<%@page import="it.alfasoft.francesca.bean.DipendenteBean"%>
<%@page import="it.alfasoft.francesca.bean.ClienteBean"%>
<%@page import="it.alfasoft.francesca.bean.AdminBean"%>
<%@page import="Utility.MessageBean"%>
<%@page import="it.alfasoft.francesca.bean.UtenteBean"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="utente" class="it.alfasoft.francesca.bean.UtenteBean"
	scope="request"></jsp:useBean>
	<jsp:useBean id="admin" class="it.alfasoft.francesca.bean.AdminBean"
	scope="session"></jsp:useBean>
	<jsp:useBean id="cliente" class="it.alfasoft.francesca.bean.ClienteBean"
	scope="session"></jsp:useBean>
	<jsp:useBean id="dipendente" class="it.alfasoft.francesca.bean.DipendenteBean"
	scope="session"></jsp:useBean>
<jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

<jsp:setProperty property="*" name="utente" />

<%
    Servizi s= new Servizi();
    
	String usnm= request.getParameter("username");
    UtenteBean u= s.getUtente(usnm);
    String pass= request.getParameter("password");
    
    pass=s.convertiPass(pass);
    
    if(u!=null && u.getPassword().equals(pass))
    {
    	char ruolo= u.getRuolo();
    	utente.setNome(u.getNome());
    	utente.setCognome(u.getCognome());
    	utente.setRuolo(ruolo);
    		
    		switch(ruolo) {
 				
    		case 'a' :
    			AdminBean ad=s.getAdmin(usnm);
    			session.setAttribute("admin",ad);
    			
    			%>
			<jsp:forward page="../HomePage/HomePageAdmin.jsp" />
			<%
			break;

    		case 'c' :
    			ClienteBean cl=s.getCliente(usnm);
    			session.setAttribute("cliente",cl);
    	    	%>
    		<jsp:forward page="../HomePage/HomePageCliente.jsp" />
    		<%
    		break;
    		
    		case 'd' :
    			DipendenteBean dp=s.getDipendente(usnm);
    			session.setAttribute("dipendente", dp);
    	    	%>
    		<jsp:forward page="../HomePage/HomePageDipendente.jsp" />
    		<%
    		break;
    		}
    }
    else{
    	message.setMessage("Username o password non corretti");
    			%>
			<jsp:forward page="login.jsp" />
			<%
    }
    
    %>