<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                <%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="admin" class="it.alfasoft.francesca.bean.AdminBean"
	scope="session"></jsp:useBean>
		 <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>
		 
		 <% 
if(admin.isValid()){
%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/stat.css">

<title>Insert title here</title>
</head>
<body>

  <div class="header">
  <h2>Admin</h2>
	<p>
  <c:out value="${admin.nome}"/>
  <c:out value="${admin.cognome}"/>
	</p>
</div>
  
<div class="row">
  
<div class="col-2 menu">
<jsp:include page=".././MenuLaterale/MenuLateraleAdmin.jsp"></jsp:include>
</div>

    <div class="col-10 content">
   <h1>Registrazione Nuovo Dipendente</h1>
   <%=message.getMessage()%>
<form action="doRegistraDipendente.jsp" method="post">
Nome :<br>
 <input type="text" name="nome" /> <br>
Cognome :<br>
 <input type="text" name="cognome"/> <br>
Username :<br>
 <input type="text" name="username"/> <br>
Password :<br>
 <input type="password" name="password"/> <br>
Posizione :<br>
 <input type="text" name="posizione"/> <br>
Stipendio :<br>
 <input type="number" name="stipendio"/> <br>

<input type="submit" value ="Registra"/>

</form>

   
  </div>
    <div id="footer">
 <h1>Footer</h1>
 
  </div>
  
  
  </div> <!--  end of container -->
</body>
</html>

<%
}else {
	session.invalidate();
	response.sendRedirect("../login.jsp");
}
%>