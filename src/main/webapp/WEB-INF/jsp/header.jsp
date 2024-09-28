<!-- header.jsp -->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="/">QuickCart</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="/products">Browse</a>
			</li>
			<c:if test="${sessionScope.role eq 'CUSTOMER'}">
				<li class="nav-item"><a class="nav-link" href="/cart">Cart</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/wishlist">Wishlist</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/orders">Orders</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/reviews">Reviews</a>
				</li>
			</c:if>
		</ul>

		<!-- Profile Dropdown -->
		<ul class="navbar-nav">
		<c:choose>
		<c:when test="${sessionScope.role eq 'CUSTOMER'}">
		<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="navbarDropdown">
					<c:choose>
						<c:when test="${not empty sessionScope.username}">
							<span class="dropdown-item-text">Welcome,
								${sessionScope.username}</span>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/logout">Logout</a>
						</c:when>
						<c:otherwise>
							<a class="dropdown-item" href="/login">Login</a>
						</c:otherwise>
					</c:choose>
				</div></li>
		
		</c:when>
		<c:otherwise>
			<a href="/login">Login</a>
		</c:otherwise>
		</c:choose>
			
		</ul>
	</div>
</nav>
