<%@page import="it.alfasoft.francesca.bean.DipendenteBean"%>
<%@page import="java.util.List"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="../blockAdmin/header.jsp"></jsp:include>
<jsp:include page="../blockAdmin/navBar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="admin" class="it.alfasoft.francesca.bean.AdminBean"
	scope="session"></jsp:useBean>
<jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="BustePaga.js"></script>
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
					<li><a href="../HomePage/HomePageAdmin.jsp">Home</a></li>
					<li><a href="#">Busta Paga</a></li>
				</ul>
			</div>
			<div class="row">
				<div class="box col-md-12">
					<div class="box-inner">
						<div class="box-header well" data-original-title="">
							<h2>
								<i class="glyphicon glyphicon-edit"></i> Nuova Busta Paga
							</h2>
							<%=message.getMessage()%>
						</div>
						                <div class="control-group">
                    <label class="control-label" for="selectError2">Dipendenti</label>

                    <div class="controls">
                        <select data-placeholder="Dipendente" id="selection" data-rel="chosen" style="width: 150px;">
                            <option value=""></option>
				<%
					Servizi s = new Servizi();
					List<DipendenteBean> lista = s.getDipendenti();
					session.setAttribute("lista", lista);
				%>

				<c:forEach items="${lista}" var="u">
								<option><c:out value="${u.nome} ${u.cognome} ${u.username}" /></option>
								</c:forEach>				
				
                        </select>
                    </div>
                </div>
                <br>
						<div class="box-content">
							<form role="form" id="bustaPaga" action="doBustaPaga.jsp" method="post">
								<div class="form-group">
									<label>Data di emissione</label> <input type="text" id="data" name="data"
										class="form-control" placeholder="Data di emissione">
								</div>
								<div class="form-group">
									<label>Importo</label> <input type="number" name="importo"
										class="form-control" placeholder="Importo">
								</div>
								<input type="hidden" value="${u.id_Utente}" name="id_Utente"/>
								<button type="submit" class="btn btn-default">Salva</button>
							</form>

						</div>
					</div>
				</div>
				<!--/span-->
				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->

		<hr>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">

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
						<a href="#" class="btn btn-primary" data-dismiss="modal">Save
							changes</a>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="../blockAdmin/footer.jsp"></jsp:include>

	</div>
	<!--/.fluid-container-->
</div>
<!-- Includo tutti gli script al temine della pagina -->

<jsp:include page="../blockAdmin/includeScriptJs.jsp"></jsp:include>

<%
}else {
	response.sendRedirect("../Accesso/login.jsp");
}
%>