<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Products</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"></link>
<!-- External CSS -->
<link rel="stylesheet" type="text/css" href="/styles/products.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

    
    <div class="container mt-4">
        <div class="row">
            <!-- Sidebar (Search and Categories) -->
            <div class="col-md-3">
                <div class="sidebar p-3">
                    <form>
                        <div class="input-group mb-4">
                            <input type="text" class="form-control" placeholder="Search products" name="search" value="${param.search}">
                            <c:if test="${not empty param.category}">
                                <input type="hidden" name="category" value="${param.category}">
                            </c:if>
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </div>
                    </form>

                    <h5>Category</h5>
                    
                    <!-- Dropdown for mobile -->
                    <div class="d-md-none mb-4">
                        <form method="get" action="/products">
                            <select class="form-control" name="category" onchange="this.form.submit()">
                                <option value="">Select Category</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category}" ${param.category == category ? 'selected' : ''}>${category}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                    
                    <!-- List for desktop -->
                    <div class="d-none d-md-block">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="/products" class="text-decoration-none">All products</a>
                            </li>
                            <c:forEach var="category" items="${categories}">
                                <c:choose>
                                    <c:when test="${not empty param.category && param.category eq category}">
                                        <li class="list-group-item active">${category}</li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="list-group-item">
                                            <a href="/products?category=${category}" class="text-decoration-none d-flex justify-content-between align-items-center">
                                                ${category}
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Product List -->
            <div class="col-md-9">
                <div class="row">
                    <c:forEach var="product" items="${producs}">
                        <div class="col-12 col-sm-6 col-md-4 mb-4">
                            <div class="product-card shadow-sm p-3">
                                <img src="https://via.placeholder.com/400" alt="${product.title}" class="img-fluid mb-3" />
                                <h5 class="product-title">${product.title}</h5>
                                <p class="product-description">${product.description}</p>
                                <p class="price">₹${product.price}</p>
                                <p class="category">${product.category}</p>
                                <a href="products/${product.id}" class="btn btn-primary mt-2">View details</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
