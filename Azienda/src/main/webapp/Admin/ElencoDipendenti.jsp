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

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="Modifiche.js"></script>

<%@ page isELIgnored="false"%>

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
					<li><a href="#">Home</a></li>
					<li><a href="#">Admin</a></li>
				</ul>
			</div>
			<div class="row">
				<div class="box col-md-12">
					<div class="box-inner">
						<div class="box-header well" data-original-title="">
							<h2>
								<i class="glyphicon glyphicon-th-list"></i> Elenco Dipendenti
							</h2>

						</div>
						<div class="box-content">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable responsive">
								<thead>

									<tr>
										<th>Nome</th>
										<th>Cognome</th>
										<th>Username</th>
										<th>Posizione</th>
										<th>Stipendio</th>
									</tr>

								</thead>

								<%
					Servizi s = new Servizi();
					List<DipendenteBean> lista = s.getDipendenti();
					request.setAttribute("lista", lista);
				%>

								<c:forEach items="${lista}" var="u">

									<tr>
										<td class="center"><c:out value="${u.nome}" /></td>
										<td class="center"><c:out value="${u.cognome}" /></td>
										<td class="center"><c:out value="${u.username}" /></td>
										<td class="center"><c:out value="${u.posizione}" /></td>
										<td class="center"><c:out value="${u.stipendio}" /></td>
										<td class="center">
											<form id="form" method="get">
												<input type="hidden" value="${u.id_Utente}" name="id_Utente" />
												<button id="editDipendente" type="button" class="btn btn-info">
													<i class="glyphicon glyphicon-edit icon-white"></i> Edit
												</button>
												<button type="submit" class="btn btn-danger"
													onclick="conferma()">
													<i class="glyphicon glyphicon-trash icon-white"></i> Delete
												</button>
											</form>
										</td>
									</tr>
								</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
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
					<button type="button" class="close" data-dismiss="modal">�</button>
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

<!-- Includo tutti gli script al temine della pagina -->

<jsp:include page="../blockAdmin/includeScriptJs.jsp"></jsp:include>

<%
}else {
	response.sendRedirect("../Accesso/login.jsp");
}
%>