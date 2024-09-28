<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/styles/products.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
    <div class="container mt-5">
        <h2>Your Shopping Cart</h2>
        
        <!-- Check if there are items in the cart -->
        <c:choose>
            <c:when test="${not empty cartItems}">
                <!-- Table to display cart items -->
                <table class="table table-bordered mt-4">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Loop through cart items -->
                        <c:set var="totalPrice" value="0"></c:set>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td><a href="/products/${item.product.id}">${item.product.title}</a></td>
                                <td>&#8377; <fmt:formatNumber value="${item.product.price}" /></td>
                                <td>
                                    <!-- Form to update quantity -->
                                    <form:form method="put" class="d-inline">
                                        <input type="hidden" name="productId" value="${item.product.id}" />
                                        <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control d-inline w-50" />
                                        <button type="submit" class="btn btn-sm btn-primary">Update</button>
                                    </form:form>
                                </td>
                                <td>&#8377; <fmt:formatNumber value="${item.product.price * item.quantity}" /></td>
                                <c:set var="totalPrice" value="${totalPrice + item.product.price * item.quantity}"></c:set>
                                <td>
                                    <!-- Remove item from cart -->
                                    <form:form method="delete" class="d-inline">
                                        <input type="hidden" name="productId" value="${item.product.id}" />
                                        <button type="submit" class="btn btn-sm btn-danger">Remove</button>
                                    </form:form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Display total price -->
                <div class="row">
                    <div class="col-md-6">
                        <h4>Total Price: &#8377; <fmt:formatNumber value="${totalPrice}" /></h4>
                    </div>
                    <div class="col-md-6 text-end">
                        <!-- Button to proceed to checkout -->
                        <a href="/cart/checkout" class="btn btn-success">Proceed to Checkout</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning mt-4">
                    Your cart is empty. <a href="${pageContext.request.contextPath}/products">Continue Shopping</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    ]  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
