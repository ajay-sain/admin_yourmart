<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/admin_yourmart/css/seller.css">
</head>
<body>
	<header>
		<jsp:include page="./header.jsp"></jsp:include>
	</header>
	<jsp:include page="./navigation.jsp"></jsp:include>
	<div class="main-component">
		<div class="page-wrapper font-robo">
		    <div class="wrapper wrapper--w960">
		        <div class="card card-2">
		            <div class="card-heading"></div>
		            <div class="card-body">
		                <div class="form-container">
		                    <h2 class="title">Seller Details</h2>
		                    <form:form action="/admin_yourmart/status-update" method="POST" modelAttribute="tableForm">
		                        <div class="box">
		                            <label for="sellerId" path="sellerId">Seller Id</label>
		                            <div class="input-box">
		                                <input type="text" name="sellerId" id="sellerId" placeholder="Seller Id"  value="${seller.getSellerId() }" path="sellerId" disabled="true"/>
		                                <i class="fas fa-exclamation importent" ></i>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <label for="companyName" path="companyName">Company Name</label>
		                            <div class="input-box">
		                                <input type="text" name="companyName" id="companyName" placeholder="Company Name"  value="${seller.getCompanyName() }" path="companyName" disabled="true"/>
		                                <i class="fas fa-exclamation importent" ></i>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <label for="ownerName" path="ownerName">Owner Name</label>
		                            <div class="input-box">
		                                <input type="text" name="ownerName" id="ownerName" placeholder="Owner Name" value="${seller.getOwnerName() }" path="ownerName" disabled="true"/>
		                                <i class="fas fa-exclamation importent"></i>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <label for="address" path="address">Address</label>
		                            <div class="input-box">
		                                <input type="text" name="address" id="address" placeholder="address" value="${seller.getAddress() }" path="address" disabled="true"/>
		                                <i class="fas fa-exclamation importent"></i>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <label for="email" path="email">email</label>
		                            <div class="input-box">
		                                <input type="email" name="email" id="email" placeholder="Email" value="${seller.getEmail() }" path="email" disabled="true"/>
		                                <i class="fas fa-exclamation importent" ></i>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <label for="gstNumber" path="gstNumber">GST Number</label>
		                            <div class="input-box">
		                                <input type="text" name="gstNumber" id="gstNumber" placeholder="GST Number" value="${seller.getGstNumber() }" path="gstNumber" disabled="true"/>
		                                <i class="fas fa-exclamation importent"></i>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <label for="telephone" path="telephone">Telephone (without +91)</label>
		                            <div class="input-box">
		                                <input type="number" name="telephone" id="telephone" placeholder="Telephone" value="${seller.getTelephone() }"" path="telephone" disabled="true"/>
		                                <i class="fas fa-exclamation importent"></i>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <form:label for="status" path="status">Status</form:label>
		                            <div class="input-box custom-select">
		                                <form:select path="status">
		                                	<form:option value="NEED_APPROVAL">NEED_APPROVAL</form:option>
		                                	<form:option value="APPROVED">APPROVED</form:option>
		                                	<form:option value="REJECTED">REJECTED</form:option>
		                                </form:select>
		                                <i class="fas fa-exclamation importent"></i>
		                                <form:input type="text" name="sellers" id="sellers" placeholder="Seller Id" class="display-none"  onChange="validateField(this.value,0)" path="id"/>
		                            </div>
		                        </div>
		                        <div class="box">
		                            <div class="input-box border-none">
		                                <button type="submit" class="button approve" >Update &#10004;</button>
		                                <button type="reset" class="button ">Reset</button>
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