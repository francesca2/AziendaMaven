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
   <h1>Cancella account</h1>
   <%=message.getMessage()%>
<form action="doCancellaUtente.jsp" method="post">
Nome : <input type="text" name="nome" /> <br>
Cognome : <input type="text" name="cognome"/> <br>
Username : <input type="text" name="username"/> <br>
Password : <input type="password" name="password"/> <br>

<input type="submit" value ="Elimina"/>

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
	response.sendRedirect("../Accesso/login.jsp");
}
%>