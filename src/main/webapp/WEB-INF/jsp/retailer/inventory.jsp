<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Inventory management</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Main Content -->
	<div class="container mt-5">
		<h1 class="mb-4">Inventory Management</h1>

		<!-- Add New Product Button -->
		<div class="mb-3">
			<a href="inventory/add-product" class="btn btn-success">Add New
				Product</a>
		</div>

		<!-- Inventory Table -->
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th scope="col">Product ID</th>
					<th scope="col">Product Name</th>
					<th scope="col">Description</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>

					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${inventory}">
					<tr>
						<td>${product.id}</td>
						<td><a href="inventory/${product.id}">${product.title}</a></td>
						<td>${product.description}</td>
						<td>${product.category}</td>
						<td>&#8377;${product.price}</td>

						<td><a href="inventory/${product.id}/edit-product"
							class="btn btn-warning btn-sm">Edit</a> <form:form
								method="DELETE" style="display:inline;">
								<input type="hidden" name="id" value="${product.id}">
								<input type="submit" class="btn btn-danger btn-sm" value="Delete">
							</form:form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>