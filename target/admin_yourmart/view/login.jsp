<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@	taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@	page import="admin.yourmart.model.Admin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin.yourmart.com</title>
<link rel="stylesheet" type="text/css" href="/admin_yourmart/css/login.css">
</head>
<body>
	<header>
		<jsp:include page="./header.jsp"></jsp:include>
	</header>
	<div class="main-component">
		<div class="page-wrapper font-robo">
		    <div class="wrapper wrapper--w960">
		        <div class="card card-2">
		            <div class="card-body">
		
		                <!-- login -->
		                <div class="form-container">
		                    <h2 class="title">Log in to your account</h2>
		                    <form:form action="/admin_yourmart/login" method="POST" modelAttribute="admin">
			                    <div class="box">
			                    	<h3 class="error-message"><%=request.getAttribute("errorMessage") %></h3>
			                    </div>
		                        <div class="box">
		                            <form:label for="sellerId" path="">Admin Id</form:label>
		                            <div class="input-box">
		                                <form:input type="text" placeholder="Admin Id" class="form-input" name="adminId" id="adminId" ngModel="" path="id"/>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <form:label for="password" path="">Password</form:label>
		                            <div class="input-box">
		                                <form:input type="password" placeholder="Password" class="form-input" name="password" id="password" ngModel="" path="password"/>
		                            </div>
		                        </div>
		                        <div class="box">
		                        </div>
		                        <div class="box">
		                            <div class="input-box border-none">
		                                <button type="submit" class="button submit">Submit</button>
		                                <button type="reset" class="button">Reset</button>
		                            </div>
		                        </div>
		                    </form:form>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
	
</body>
</html>

