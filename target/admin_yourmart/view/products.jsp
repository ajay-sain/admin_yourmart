<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@	taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin.yourmart.com</title>
<link rel="stylesheet" type="text/css" href="/admin_yourmart/css/home.css">
<script type="text/javascript" src="/admin_yourmart/javascript/product.js"></script>
</head>
<body onload="onloadFunction(${pageStart},${contentSize},${totalRecords})">
	<header>
		<jsp:include page="./header.jsp"></jsp:include>
	</header>
	<jsp:include page="./navigation.jsp"></jsp:include>
	<div class="main-component">
		<div class="item-list">
		    <!-- <div class="item-list" *ngFor="let i of itemList">
		        <app-item [item]=i></app-item>
		    </div> -->
		    <div class="table-container">
		        <div class="search-area">
		            <div class="seacrh-box">
		                <i><svg fill="#000000" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30" width="30px" height="30px"><path d="M 13 3 C 7.4889971 3 3 7.4889971 3 13 C 3 18.511003 7.4889971 23 13 23 C 15.396508 23 17.597385 22.148986 19.322266 20.736328 L 25.292969 26.707031 A 1.0001 1.0001 0 1 0 26.707031 25.292969 L 20.736328 19.322266 C 22.148986 17.597385 23 15.396508 23 13 C 23 7.4889971 18.511003 3 13 3 z M 13 5 C 17.430123 5 21 8.5698774 21 13 C 21 17.430123 17.430123 21 13 21 C 8.5698774 21 5 17.430123 5 13 C 5 8.5698774 8.5698774 5 13 5 z"/></svg></i>
		                <input type="text" name="search" id="search" placeholder="Search" value="${searchParam}" onChange="searchSeller(this.value)">
		            </div>
		        </div>
		        <div class="table-box">
		            <table class="product-list">
		                <form:form action="/admin_yourmart/products" method="POST" modelAttribute="table">
			                <thead>
			                    <tr class="table-header table-row">
			                    	<th class="column-header"></th>
			                        <th class="column-header">Seller Id</th>
			                        <th class="column-header">Product name</th>
			                        <th class="column-header">Catagorie</th>
			                        <th class="column-header">
			                        	<a href="javascript:void(0);" onClick="sortTale('mrp')">
			                        		MRP
			                        		<svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 0 1792 1792" ><path d="M1408 1088q0 26-19 45l-448 448q-19 19-45 19t-45-19l-448-448q-19-19-19-45t19-45 45-19h896q26 0 45 19t19 45zm0-384q0 26-19 45t-45 19h-896q-26 0-45-19t-19-45 19-45l448-448q19-19 45-19t45 19l448 448q19 19 19 45z"/></svg>
			                        	</a>
			                        </th>
			                        <th class="column-header">
			                        	<a href="javascript:void(0);" onClick="sortTale('ssp')">
			                        		SSP
			                        		<svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 0 1792 1792" ><path d="M1408 1088q0 26-19 45l-448 448q-19 19-45 19t-45-19l-448-448q-19-19-19-45t19-45 45-19h896q26 0 45 19t19 45zm0-384q0 26-19 45t-45 19h-896q-26 0-45-19t-19-45 19-45l448-448q19-19 45-19t45 19l448 448q19 19 19 45z"/></svg>
			                        	</a>
			                        </th>
			                        <th class="column-header">
			                        	<a href="javascript:void(0);" onClick="sortTale('ymp')">
			                        		YMP
			                        		<svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 0 1792 1792" ><path d="M1408 1088q0 26-19 45l-448 448q-19 19-45 19t-45-19l-448-448q-19-19-19-45t19-45 45-19h896q26 0 45 19t19 45zm0-384q0 26-19 45t-45 19h-896q-26 0-45-19t-19-45 19-45l448-448q19-19 45-19t45 19l448 448q19 19 19 45z"/></svg>
			                        	</a>
			                        </th>
			                        <th class="column-header">Status</th>
			                        <th class="column-header">
			                        	<a href="javascript:void(0);" onClick="sortTale('registrationTime')">
			                        		Creation/Update time
			                        		<svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 0 1792 1792" ><path d="M1408 1088q0 26-19 45l-448 448q-19 19-45 19t-45-19l-448-448q-19-19-19-45t19-45 45-19h896q26 0 45 19t19 45zm0-384q0 26-19 45t-45 19h-896q-26 0-45-19t-19-45 19-45l448-448q19-19 45-19t45 19l448 448q19 19 19 45z"/></svg>
			                        	</a>
			                        </th>
			                        <th class="column-header mini-column">Actions</th>
			                    </tr>
			                </thead>
			                <tbody>
			                	<c:forEach var="i" items="${product}">
				                    <tr class="table-row">
				                    	<td class="column-body"><div class="check-box-container"><form:checkbox id="${i.getProductId()}" name="SellerIds" value="${i.getProductId()}" class="check-box" path="id"/><label for="${i.getProductId()}" class="check-box-label" ></label></div></td>
				                        <td class="column-body"><c:out value="${i.getSellerId()}" /></td>
				                        <td class="column-body"><c:out value="${i.getName()}" /></td>
				                        <td class="column-body"><c:out value="${i.getCatagories()}" /></td>
				                        <td class="column-body"><c:out value="${i.getMrp()}" /></td>
				                        <td class="column-body"><c:out value="${i.getSsp()}" /></td>
				                        <td class="column-body"><c:out value="${i.getYmp()}" /></td>
				                        <td class="column-body"><c:out value="${i.getStatus()}" /></td>
				                        <td class="column-body"><c:out value="${i.getRegistrationTime()}" /></td>
				                        <td>
				                            <div>
				                                <a class="button" href="/admin_yourmart/sellable?productId=${i.getProductId()} " (click)=edit(item)>
				                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
				                                        <g>
				                                            <g>
				                                                <g>
				                                                    <polygon points="85.333,282.64 85.333,362.64 165.333,362.64 378.667,149.307 298.667,69.307 			"/>
				                                                    <path d="M441.707,56.08L391.893,6.267c-8.32-8.32-21.867-8.32-30.187,0L320,47.973l80,80l41.707-41.707
				                                                        C450.027,77.947,450.027,64.4,441.707,56.08z"/>
				                                                </g>
				                                            </g>
				                                        </g>
				                                    </svg>
				                                </a>
				                                <!-- <a href="javascript:void(0);" onClick="dapproveUser(${i.getSellerId()})" class="button approve">&#10004</a>
				                                <a href="javascript:void(0);" onClick="delete(${i.getSellerId()})" class="button delete">&#10008;</a> -->
				                            </div>
				                        </td>
				                    </tr>
			                    </c:forEach>
			                </tbody>
			            </table>
			            <div class="sumition-box">
			            	<button type="Submit" id="submit">Approve all</button><form:input type="text" path="status" id="status" name="status" class="display-none"/>
			            </div>
                    </form:form>
		        </div>
		        <div class="table-config">
		            <label for="pageSize">Items per page:</label>
		            <div class="page-size">
		                <input type="number" name="pageSize" id="pageSize" placeholder="Seller Product Id" value="${contentSize}" onChange="changePageSize(this.value)">
		            </div>
		            <label for="pagination"><c:out value="${pageStart}" />-<c:out value="${pageStart+contentSize}" /> of <c:out value="${totalRecords}" /></label>
		            <div class="pagination ">
		                <button class="page-button" onClick="changePage( 'first',${pageStart},${pageSize},${totalRecords}) " id="first" >&#171;</button>
		                <button class="page-button " onClick="changePage( 'prev',${pageStart},${pageSize},${totalRecords}) " id="prev">&#8249;</button>
		                <button class="page-button " onClick="changePage( 'next',${pageStart},${pageSize},${totalRecords}) " id="next">&#8250;</button>
		                <button class="page-button " onClick="changePage( 'last',${pageStart},${pageSize},${totalRecords}) " id="last">&#187;</button>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</body>
</html>