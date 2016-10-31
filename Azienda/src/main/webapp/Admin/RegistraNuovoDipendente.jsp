<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <jsp:include page="../blockAdmin/header.jsp"></jsp:include>
    <jsp:include page="../blockAdmin/navBar.jsp"></jsp:include>
     <%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="admin" class="it.alfasoft.francesca.bean.AdminBean"
	scope="session"></jsp:useBean>
		 <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>
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
            <a href="../HomePage/HomePageAdmin.jsp">Home</a>
        </li>
        <li>
            <a href="#">Registra Nuovo Dipendente</a>
        </li>
    </ul>
</div>
<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-edit"></i> Registrazione Nuovo Dipendente</h2>
   <%=message.getMessage()%>
                <div class="box-icon">
                    <a href="#" class="btn btn-setting btn-round btn-default"><i
                            class="glyphicon glyphicon-cog"></i></a>
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div>
            </div>
            <div class="box-content">
                <form role="form" action="doRegistraDipendente.jsp" method="post">
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" name="nome" class="form-control" placeholder="Nome">
                    </div>
                    <div class="form-group">
                        <label>Cognome</label>
                        <input type="text" name="cognome" class="form-control" placeholder="Cognome">
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="username" class="form-control" placeholder="Username">
                    </div>
                                        <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Password">
                    </div>
                                        <div class="form-group">
                        <label>Posizione</label>
                        <input type="text" name="posizione" class="form-control" placeholder="Posizione">
                    </div>
                                        <div class="form-group">
                        <label>Stipendio</label>
                        <input type="number" name="stipendio" class="form-control" placeholder="Stipendio">
                    </div>
                    <button type="submit" class="btn btn-default">Registra</button>
                </form>

            </div>
        </div>
    </div>
    <!--/span-->   
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
</div>
<!-- Includo tutti gli script al temine della pagina -->

<jsp:include page="../blockAdmin/includeScriptJs.jsp"></jsp:include>

<%
}else {
	response.sendRedirect("../Accesso/login.jsp");
}
%>