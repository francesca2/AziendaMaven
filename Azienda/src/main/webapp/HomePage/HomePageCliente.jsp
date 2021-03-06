<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	    <jsp:include page="../blockCliente/header.jsp"></jsp:include>
    <jsp:include page="../blockCliente/navBar.jsp"></jsp:include>
        <%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:useBean id="cliente" class="it.alfasoft.francesca.bean.ClienteBean"
	scope="session"></jsp:useBean>

 		 <% 
if(cliente.isValid()){
%>   

 <div class="ch-container">
    <div class="row"> 
       <jsp:include page="../blockCliente/menu.jsp"></jsp:include>
       
       
          <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="../HomePage/HomeCliente.jsp">Home</a>
        </li>
        <li>
            <a href="#">Cliente</a>
        </li>
    </ul>
</div>

    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
    
        <hr>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">�</button>
                    <h3>Settings</h3>
                </div>
                <div class="modal-body">
                    <p>Here settings can be configured...</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
                </div>
            </div>
        </div>
    </div>
    
<jsp:include page="../blockCliente/footer.jsp"></jsp:include>

</div><!--/.fluid-container-->

<!-- Includo tutti gli script al temine della pagina -->

<jsp:include page="../blockCliente/includeScriptJs.jsp"></jsp:include>

<%
}else {
	response.sendRedirect("../Accesso/login.jsp");
}
%>