<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Customer Orders</title>
    <!-- Bootstrap CSS (4.5.2) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/styles/products.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container mt-5">
    <h2 class="mb-4 text-center">Your Orders</h2>

    <!-- No Orders Alert -->
    <c:if test="${empty orders}">
        <div class="alert alert-warning" role="alert">
            You have no orders yet.
        </div>
    </c:if>

    <!-- Orders Accordion -->
    <c:if test="${!empty orders}">
        <div class="accordion" id="ordersAccordion">
            <c:forEach var="order" items="${orders}">
                <div class="card mb-3">
                    <div class="card-header" id="heading${order.id}">
                        <h2 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${order.id}" aria-expanded="true" aria-controls="collapse${order.id}">
                                Order #${order.id} - ${order.fullName}
                            </button>
                        </h2>
                    </div>

                    <div id="collapse${order.id}" class="collapse" aria-labelledby="heading${order.id}" data-parent="#ordersAccordion">
                        <div class="card-body">
                            <div class="row">
                                <!-- Left Column: Shipping and Payment Information -->
                                <div class="col-md-4">
                                    <!-- Shipping Information Card -->
                                    <div class="card mb-3">
                                        <div class="card-header">
                                            <h5>Shipping Information</h5>
                                        </div>
                                        <div class="card-body">
                                            <p>
                                                <strong>Full Name:</strong> ${order.fullName}<br>
                                                <strong>Mobile Number:</strong> ${order.mobileNumber}<br>
                                                <strong>Address:</strong> ${order.shippingAddress}<br>
                                                <strong>Pincode:</strong> ${order.pincode}
                                            </p>
                                        </div>
                                    </div>

                                    <!-- Payment Information Card -->
                                    <div class="card mb-3">
                                        <div class="card-header">
                                            <h5>Payment Information</h5>
                                        </div>
                                        <div class="card-body">
                                            <p>
                                                <strong>Amount:</strong> $${order.paymentDetail.amount}<br>
                                                <strong>Provider:</strong> ${order.paymentDetail.provider}<br>
                                                <strong>Status:</strong> ${order.paymentDetail.status}
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Right Column: Order Details -->
                                <div class="col-md-8">
                                    <h5>Order Details</h5>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                <tr>
                                                    <td>${orderDetail.product.title}</td>
                                                    <td>$${orderDetail.price}</td>
                                                    <td>${orderDetail.quantity}</td>
                                                    <td>${orderDetail.orderStatus}</td>
                                                    <td>
                                                        <c:if test="${orderDetail.orderStatus == 'PENDING'}">
                                                            <!-- Cancel button for pending orders -->
                                                            <form:form method="put" class="d-inline">
                                                                <input type="hidden" name="orderDetailId" value="${orderDetail.id}"/>
                                                                <button type="submit" class="btn btn-danger btn-sm">Cancel</button>
                                                            </form:form>
                                                        </c:if>
                                                        <c:if test="${orderDetail.orderStatus != 'PENDING'}">
                                                            <span class="text-muted">N/A</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div> <!-- End of Row -->
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
