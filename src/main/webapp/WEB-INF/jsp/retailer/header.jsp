<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/retailer">QuickCart - Retailer</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="/retailer/inventory">Inventory</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/retailer/orders">Orders</a></li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="/retailer/profile"> <i class="bi bi-person-circle"></i>
							Hi, ${sessionScope.username}
					</a></li>
					<li class="nav-item"><a class="btn btn-outline-danger ms-3"
						href="/logout"> <i class="bi bi-box-arrow-right"></i> Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>