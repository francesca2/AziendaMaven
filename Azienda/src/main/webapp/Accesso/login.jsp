<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  	 <jsp:include page="../blockAdmin/header.jsp"></jsp:include>
     <jsp:useBean id="message" class="Utility.MessageBean" scope="request"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  
<body>
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2>Welcome to the Login Page</h2>
            <%=message.getMessage()%>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
            <div class="alert alert-info">
       Please login with your Username and Password.
            </div>
            <form class="form-horizontal" action="doLogin.jsp" method="post">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <input type="text" class="form-control" name="username">
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                         <input type="password" class="form-control" name="password">
                    </div>
                    <div class="clearfix"></div>

                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" id="remember"> Remember me</label>
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">

<input type="submit" class="btn btn-primary" value ="Login"/>

                    </p>
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

<jsp:include page="../blockAdmin/includeScriptJs.jsp"></jsp:include>

</body>
</html>