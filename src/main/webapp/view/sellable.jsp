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
<link rel="stylesheet" type="text/css" href="/admin_yourmart/css/sellable.css">
<script type="text/javascript" src="/admin_yourmart/javascript/sellable.js"></script>
</head>
<body>
	<header>
		<jsp:include page="./header.jsp"></jsp:include>
	</header>
	<jsp:include page="./navigation.jsp"></jsp:include>
	<div class="overlay">
	    <div class="page-wrapper font-robo">
	        <div class="wrapper wrapper--w960">
	            <div class="card card-2">
	                <div class="card-heading">
	                    <div class="slide-box">
	                        <div class="slide">
	                            <img src="${product.primaryUrl }" alt="">
	                        </div>
	                        <c:forEach var="i" items="${product.galeryUrl}">
		                        <div class="slide">
		                            <img src="${i }" alt="" srcset="" />
		                        </div>
	                        </c:forEach>
	                    </div>
	                    <div class="preview">
	                        <img src="${product.primaryUrl }" alt="" srcset="">
	                    </div>
	                </div>
	                <div class="card-body">
	                    <div class="page-content">
	                        <h2 class="form-heading"> Product details</h2>
	                        <form:form action="/admin_yourmart/sellable" method="POST" modelAttribute="productForm">
	                        	<div class="box">
	                                <label for="sellerId" path="sellerId">Seller Product Id</label>
	                                <div class="input-block">
	                                    <input type="text" name="sellerId" id="sellerId" placeholder="SellerId" value="${product.sellerId }" path="sellerId" disabled="true"/>
	                                    <i class="fas fa-info-circle" ></i>
	                                </div>
	                            </div>
	                            <div class="box">
	                                <label for="sellerProductId" path="sellerProductId">Seller Product Id</label>
	                                <div class="input-block">
	                                    <input type="text" name="sellerProductId" id="sellerProductId" placeholder="Seller Product Id" value="${product.sellerProductId }" path="sellerProductId" disabled="true"/>
	                                    <i class="fas fa-info-circle" ></i>
	                                </div>
	                            </div>
	                            <div class="box">
	                                <label for="name" path="name">Product Name</label>
	                                <div class="input-block">
	                                    <input type="text" name="name" id="name" placeholder="Product Name" path="name" value="${product.name }" disabled="true"/>
	                                    <i class="fas fa-info-circle" ></i>
	                                </div>
	                            </div>
	                            <div class="box">
	                                <label for="catagories" path="catagories">Catagories</label>
	                                <div class="input-block custom-dropdown">
	                                    <input class="select-input" name="catagories" id="catagories" path="catagories" value="${product.catagories }" disabled="true"/>
	                                    <i class="fas fa-info-circle" ></i>
	                                </div>
	                            </div>
	                            <div class="box">
	                                <label for="mrp" path="mrp">MRP</label>
	                                <div class="input-block">
	                                    <input type="number" name="mrp" id="mrp" placeholder="MRP" path="mrp" value="${product.mrp }" disabled="true"/>
	                                    <i class="fas fa-info-circle" ></i>
	                                </div>
	                            </div>
	                            <div class="box">
	                                <label for="ssp" path="ssp">Suggested Selling Price (SSP)</label>
	                                <div class="input-block">
	                                    <input type="number" name="ssp" id="ssp" placeholder="Suggested Selling Price" value="${product.ssp }" path="ssp" disabled="true"/>
	                                </div>
	                            </div>
	                            <div class="box">
	                                <label for="ymp" path="ymp">YourMart Price (YMP).</label>
	                                <div class="input-block">
	                                    <input type="number" name="ymp" id="ymp" placeholder="YourMart Price (YMP)" value="${product.ymp }" path="ymp" disabled="true"/>
	                                    <i class="fas fa-info-circle"></i>
	                                </div>
	                            </div>
	                            <div class="box full-width">
	                                <label for="dimensions">Dimensions (in CM please)</label>
	                                <div class="input-block border-none">
	                                    <div class="input-block mini-input-block margin-left-0">
	                                        <input type="number" name="height" id="height" placeholder="Height" value="${product.height }" path="height" disabled="true"/>
	                                    </div>
	                                    <div class="input-block mini-input-block">
	                                        <input type="number" name="width" id="width" placeholder="Width" value="${product.width }" path="width" disabled="true"/>
	                                    </div>
	                                    <div class="input-block mini-input-block margin-right-0">
	                                        <input type="number" name="length" id="length" placeholder="Length" value="${product.length }" path="length" disabled="true"/>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="box full-width">
	                                <label for="shortDescription" path="shortDescription">Short Description</label>
	                                <div class="input-block full-width-98">
	                                    <textarea name="shortDescription" id="shortDescription" placeholder="Short Description" value="${product.shortDescription }" class="textarea-block" path="shortDescription" disabled="true"></textarea>
	                                    <i class="fas fa-info-circle"></i>
	                                </div>
	                            </div>
	                            <div class="box full-width">
	                                <label for="longDescription" path="longDescription">Long Description</label>
	                                <div class="input-block full-width-98">
	                                    <textarea name="longDescription" id="longDescription" placeholder="Long Description" value="${product.longDescription }" class="textarea-block" path="longDescription" disabled="true"></textarea>
	                                </div>
	                            </div>
	                             <div class="box full-width">
	                                <label for="comment" path="comment">Comment</label>
	                                <div class="input-block full-width-98">
	                                    <form:textarea name="comment" id="comment" placeholder="Comment" class="textarea-block" path="comment"></form:textarea>
	                                </div>
	                            </div>
	                            <div class="box full-width">
	                                <label for="status" path="status">Status</label>
	                                <div class="input-block full-width-98 custom-dropdown">
	                                    <form:select name="status" id="status" placeholder="Status" class="select-input" path="status">
	                                    	<form:option value="NEW">New</form:option>
	                                    	<form:option value="REJECTED">Rejected</form:option>
	                                    	<form:option value="REVIEW">Review</form:option>
	                                    	<form:option value="APPROVED">Approved</form:option>
	                                    </form:select>
	                                </div>
	                            </div>
		                                <form:input type="text" name="product" id="product" placeholder="Product Id" class="display-none hide"  path="id"/>
	                            
	                            <div class="box full-width">
	                                <button type="submit" class="button submit" >Update</button>
	                                <button class="button" onClick="navigate()">Cancle</button>
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