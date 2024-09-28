<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Retailer Orders Management</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container mt-5">
		<h2 class="mb-4 text-center">Retailer Orders Management</h2>

		<!-- Filter Orders by Status -->
		<div class="row mb-4">
			<div class="col-md-12">
				<form method="get" class="form-inline">
					<label class="mr-2">Filter by Status:</label> <select name="status"
						class="form-control mr-2">
						<option value="">All</option>
						<option value="PENDING"
							${param.status == 'PENDING' ? 'selected' : ''}>Pending</option>
						<option value="SHIPPED"
							${param.status == 'SHIPPED' ? 'selected' : ''}>Shipped</option>
						<option value="DELIVERED"
							${param.status == 'DELIVERED' ? 'selected' : ''}>Delivered</option>
						<option value="CANCELED"
							${param.status == 'CANCELED' ? 'selected' : ''}>Canceled</option>
					</select>
					<button type="submit" class="btn btn-primary">Filter</button>
				</form>
			</div>
		</div>

		<!-- Display Orders -->
		<c:if test="${empty orderDetails}">
			<div class="alert alert-warning" role="alert">No orders found.
			</div>
		</c:if>

		<c:if test="${!empty orderDetails}">
			<div class="accordion" id="ordersAccordion">
				<c:forEach var="orderDetail" items="${orderDetails}">
					<div class="card mb-3">
						<div class="card-header" id="heading${orderDetail.id}">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button"
									data-toggle="collapse" data-target="#collapse${orderDetail.id}"
									aria-expanded="true" aria-controls="collapse${orderDetail.id}">
									Order #${orderDetail.order.id} - ${orderDetail.order.fullName}
									(${orderDetail.order.customer.email})</button>
							</h2>
						</div>

						<div id="collapse${orderDetail.id}" class="collapse"
							aria-labelledby="heading${orderDetail.id}"
							data-parent="#ordersAccordion">
							<div class="card-body">
								<div class="row">
									<!-- Left Column: Customer Information -->
									<div class="col-md-4">
										<!-- Shipping Information Card -->
										<div class="card mb-3">
											<div class="card-header">
												<h5>Customer Information</h5>
											</div>
											<div class="card-body">
												<p>
													<strong>Full Name:</strong> ${orderDetail.order.fullName}<br>
													<strong>Email:</strong> ${orderDetail.order.customer.email}<br>
													<strong>Mobile Number:</strong>
													${orderDetail.order.mobileNumber}<br> <strong>Address:</strong>
													${orderDetail.order.shippingAddress}<br> <strong>Pincode:</strong>
													${orderDetail.order.pincode}
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
													<strong>Amount:</strong>
													$${orderDetail.order.paymentDetail.amount}<br> <strong>Status:</strong>
													${orderDetail.order.paymentDetail.status}
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
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${orderDetail.product.title}</td>
													<td>$${orderDetail.price}</td>
													<td>${orderDetail.quantity}</td>
													<td>${orderDetail.orderStatus}</td>
													<td>
														<!-- Actions based on the current status --> <c:choose>
															<c:when test="${orderDetail.orderStatus == 'PENDING'}">
																<form:form method="put" class="d-inline">
																	<input type="hidden" name="orderDetailId"
																		value="${orderDetail.id}" />
																	<input type="hidden" name="status" value="SHIPPED" />
																	<button type="submit" class="btn btn-success btn-sm">Ship</button>
																</form:form>
																<form:form method="put" class="d-inline">
																	<input type="hidden" name="orderDetailId"
																		value="${orderDetail.id}" />
																	<input type="hidden" name="status" value="CANCELED" />
																	<button type="submit" class="btn btn-danger btn-sm">Cancel</button>
																</form:form>
															</c:when>
															<c:when test="${orderDetail.orderStatus == 'SHIPPED'}">
																<form:form method="put" class="d-inline">
																	<input type="hidden" name="orderDetailId"
																		value="${orderDetail.id}" />
																	<input type="hidden" name="status" value="DELIVERED" />
																	<button type="submit" class="btn btn-info btn-sm">Mark
																		as Delivered</button>
																</form:form>
															</c:when>
															<c:when test="${orderDetail.orderStatus == 'DELIVERED'}">
																<span class="text-success">Delivered</span>
															</c:when>
															<c:when test="${orderDetail.orderStatus == 'CANCELED'}">
																<span class="text-danger">Canceled</span>
															</c:when>
														</c:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- End of Row -->
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
