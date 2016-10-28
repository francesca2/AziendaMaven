<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:useBean id="cliente" class="it.alfasoft.francesca.bean.ClienteBean"
	scope="session"></jsp:useBean>

 		 <% 
if(cliente.isValid()){
%>   
	
<jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/stat.css">

<title>Insert title here</title>
</head>
<body>

  <div class="header">
<h2>Home page Cliente</h2>
<p>
  <c:out value="${cliente.nome}"/>
  <c:out value="${cliente.cognome}"/>
</p>
  
  </div>
  
<div class="row">
  
<div class="col-2 menu">
  <jsp:include page=".././MenuLaterale/MenuLateraleCliente.jsp"></jsp:include>
  
  </div>
    <div class="col-10 content">
   <h1>Benvenuto
   <%=cliente.getNome() %> !
   </h1>
      <%=message.getMessage()%>
  </div>
    <div id="footer">
 <h1>Footer</h1>
 
  </div>
  
  
  </div> <!--  end of container -->
</body>
</html>

<%
}else {
	response.sendRedirect("../login.jsp");
}
%>