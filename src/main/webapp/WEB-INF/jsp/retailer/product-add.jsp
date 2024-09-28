<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
<title>Inventory management</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container mt-5">
		<h1 class="mb-4">Add New Product</h1>

		<form method="post">
			<div class="mb-3">
				<label for="productName" class="form-label">Product Name</label> <input
					type="text" class="form-control" id="productName" name="title"
					required>
			</div>

			<div class="mb-3">
				<label for="productDescription" class="form-label">Description</label>
				<textarea class="form-control" id="productDescription"
					name="description" rows="4" required></textarea>
			</div>

			<div class="mb-3">
				<label for="productCategory" class="form-label">Category</label> <input
					type="text" class="form-control" id="producCategory"
					name="category" required>
			</div>

			<div class="mb-3">
				<label for="productPrice" class="form-label">Price</label> <input
					type="number" step="0.01" class="form-control" id="productPrice"
					name="price" required>
			</div>
			<c:if test="${not empty errorMessage}">
				<div class="alert alert-danger" role="alert">${errorMessage}</div>
			</c:if>
			<button type="submit" class="btn btn-primary">Add Product</button>
		</form>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>