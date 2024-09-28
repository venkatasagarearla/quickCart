<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<title>Product details</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="/styles/products.css">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
	<div class="container mt-5">
		<h1 class="mb-4">Product Details</h1>
        <div class="row">
            <!-- Product Details and Actions -->
            <div class="col-md-8">
                <c:choose>
                    <c:when test="${not empty product}">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h2 class="card-title">${product.title}</h2>
                                <p class="card-text">${product.description}</p>
                                <p class="card-text">
                                    <strong>Category:</strong> ${product.category}
                                </p>
                                <p class="card-text">
                                    <strong>Price:</strong> &#8377;${product.price}
                                </p>

                                <c:choose>
                                    <c:when test="${wishlisted}">
                                        <form:form method="delete" action="/wishlist">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <button type="submit" class="btn btn-success mt-3">Remove from wishlist</button>
                                        </form:form>
                                    </c:when>
                                    <c:otherwise>
                                        <form:form method="post" action="/wishlist">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <button type="submit" class="btn btn-success mt-3">Add to wishlist</button>
                                        </form:form>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${inCart}">
                                        <a href="/cart">View in cart</a>
                                    </c:when>
                                    <c:otherwise>
                                        <form:form method="post" action="/cart">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <button type="submit" class="btn btn-success mt-3">Add to cart</button>
                                        </form:form>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-danger" role="alert">Product not found.</div>
                        <a href="/products" class="btn btn-primary">Back to Products</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="mt-5">
            <h3>Reviews</h3>
            <c:choose>
                <c:when test="${not empty reviews}">
                    <ul class="list-group">
                        <c:forEach var="review" items="${reviews}">
                            <li class="list-group-item">
                                <strong>Rating:</strong> ${review.rating} <br>
                                <strong>Comment:</strong> ${review.reviewContent} <br>
                                <small>Reviewed on: ${review.createdAt}</small>
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>No reviews yet.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Review Form -->
        <c:if test="${not empty product}">
            <div class="mt-4">
                <h4>Post a New Review</h4>
                <form:form method="post" action="/reviews">
                    <input type="hidden" name="productId" value="${product.id}" />
                    <div class="mb-3">
											<label class="form-label">Rating</label>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" id="rating1"
													name="rating" value="1" required> <label
													class="form-check-label" for="rating1">1 - Poor</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" id="rating2"
													name="rating" value="2"> <label
													class="form-check-label" for="rating2">2 - Fair</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" id="rating3"
													name="rating" value="3"> <label
													class="form-check-label" for="rating3">3 - Good</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" id="rating4"
													name="rating" value="4"> <label
													class="form-check-label" for="rating4">4 - Very
													Good</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" id="rating5"
													name="rating" value="5"> <label
													class="form-check-label" for="rating5">5 -
													Excellent</label>
											</div>
										</div>
                    <div class="mb-3">
                        <label for="reviewContent" class="form-label">Comment</label>
                        <textarea class="form-control" id="reviewContent" name="reviewContent" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Review</button>
                </form:form>
            </div>
        </c:if>

    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
