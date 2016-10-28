<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="../blockAdmin/header.jsp"></jsp:include>
    <jsp:include page="../blockAdmin/navBar.jsp"></jsp:include>
    <jsp:useBean id="admin" class="it.alfasoft.francesca.bean.AdminBean"
	scope="session"></jsp:useBean>
	<jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<% 
if(admin.isValid()){
%>

 <div class="ch-container">
    <div class="row"> 
       <jsp:include page="../blockAdmin/menu.jsp"></jsp:include>
       
       
          <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="#">Home</a>
        </li>
        <li>
            <a href="#">Admin</a>
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
                    <button type="button" class="close" data-dismiss="modal">×</button>
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
    
<jsp:include page="../blockAdmin/footer.jsp"></jsp:include>

</div><!--/.fluid-container-->

<!-- Includo tutti gli script al temine della pagina -->

<jsp:include page="../blockAdmin/includeScriptJs.jsp"></jsp:include>

<%
}else {
	response.sendRedirect("../Accesso/login.jsp");
}
%>