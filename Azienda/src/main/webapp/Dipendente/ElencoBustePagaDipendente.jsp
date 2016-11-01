<%@page import="it.alfasoft.francesca.bean.DipendenteBean"%>
<%@page import="model.BustaPaga"%>
<%@page import="java.util.List"%>
<%@page import="it.alfasoft.francesca.service.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <jsp:include page="../blockDipendente/header.jsp"></jsp:include>
    <jsp:include page="../blockDipendente/navBar.jsp"></jsp:include>
 
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dipendente" class="it.alfasoft.francesca.bean.DipendenteBean"
	scope="session"></jsp:useBean>
	
	<%@ page isELIgnored="false" %>
	
<% 
if(dipendente.isValid()){
%>

 <div class="ch-container">
    <div class="row"> 
       <jsp:include page="../blockDipendente/menu.jsp"></jsp:include>
       
       
          <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="../HomePage/HomeDipendente.jsp.jsp">Home</a>
        </li>
        <li>
            <a href="#">Elenco Buste Paga</a>
        </li>
    </ul>
</div>
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-th-list"></i> Buste Paga Emesse</h2>

    </div>
    <div class="box-content">
    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
		<th>Nome</th>
		<th>Cognome</th>
		<th>Data</th>
		<th>Importo</th>
    </tr>
    </thead>
    <tbody>
				<%
					Servizi s = new Servizi();
					List<BustaPaga> lista = s.getBustePagaDipendente(dipendente);
					request.setAttribute("lista", lista);
				%>

				<c:forEach items="${lista}" var="b">

					<tr>
						<td class="center" ><c:out value="${b.dipendente.nome}" /></td>
						<td class="center" ><c:out value="${b.dipendente.nome}" /></td>
						<td class="center" ><c:out value="${b.data}" /></td>
						<td class="center" ><c:out value="${b.importo}" /></td>
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
    
<jsp:include page="../blockDipendente/footer.jsp"></jsp:include>

</div><!--/.fluid-container-->

<!-- Includo tutti gli script al temine della pagina -->

<jsp:include page="../blockDipendente/includeScriptJs.jsp"></jsp:include>

<%
}else {
	response.sendRedirect("../Accesso/login.jsp");
}
%>