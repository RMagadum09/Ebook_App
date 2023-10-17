
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	
    <c:if test="${empty userobj }">
    <c:redirect url="../login.jsp"></c:redirect>
    </c:if>
	
	<h3 class="text-center">Hello Admin</h3>
	<c:if test="${not empty successMessage }">
		<h5> <p class="text-center text-success">${ successMessage}</p></h5>
		<c:remove var="successMessage" scope="session" />
	</c:if>

	<c:if test="${not empty failedMessage }">
		<h5><p class="text-center text-danger">${ failedMessage}</p></h5>
		<c:remove var="failedMessage" scope="session" />
	</c:if>


	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
			List<BookDetails> list = dao.getAllBooks();
			for (BookDetails b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="editbooks.jsp?id=<%=b.getBookId()%>"class="btn btm-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a> 
					<a href="../delete?id=<%=b.getBookId() %>" class="btn btm-sm btn-danger"><i class="fa-regular fa-trash-can"></i>Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	<div style="margin-top: 130px">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>