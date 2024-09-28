<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>My Reviews</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 4.5.2 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/styles/products.css">
</head>
<body>
    <jsp:include page="../header.jsp"></jsp:include>

    <!-- Main Content -->
    <div class="container mt-5">
        <h1 class="mb-4">My Reviews</h1>

        <c:choose>
            <c:when test="${not empty reviews}">
                <ul class="list-group">
                    <c:forEach var="review" items="${reviews}">
                        <li class="list-group-item">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <!-- Product Title and Review Content -->
                                    <h5 class="mb-1">${review.product.title}</h5>
                                    <p class="mb-1">${review.reviewContent}</p>
                                    <small>Rating: ${review.rating} / 5</small>
                                </div>
                                <!-- Remove Button -->
                                <form:form method="delete" style="display:inline;">
                                    <input type="hidden" name="reviewId" value="${review.id}">
                                    <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                </form:form>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info" role="alert">
                    You have not submitted any reviews yet.
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
