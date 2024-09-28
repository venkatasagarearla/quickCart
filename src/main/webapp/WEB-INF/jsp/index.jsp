<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Header Styling */
		* {
			font-family: 'Roboto'
		}
        .navbar {
            background-color: #f8f9fa;
            border-bottom: 1px solid rgb(243, 243, 243);
            padding: 15px;
        }

        .navbar-brand {
            margin-right: 0;
        }

        .navbar-nav .nav-link {
            font-size: 1.25rem; /* Adjust this value as needed */
            color: black;
        }

        .nav-item .cart-count-badge {
            background-color: #bfdbfe;
            color: #0967d2;
            font-size: 12px;
            font-weight: 500;
            border-radius: 50%;
            padding: 2px 5px;
            margin-left: 8px;
        }

        .nav-item .cart-count-badge {
            background-color: #e6f6ff;
        }

        .navbar-toggler {
            border: none;
            outline: none;
        }

        .navbar-toggler-icon {
            background-image: url('https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css');
        }

        .content-section {
            height: 85vh;
            display: flex;
            flex-direction: row;
			justify-content: space-between;
            align-items: center;
        }

        .content-text {
            max-width: 90%;
        }

        .card-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .card {
            flex: 1;
            margin: 10px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 300px;
            overflow: hidden;
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            padding: 20px;
        }

        .card h5 {
            margin-bottom: 15px;
        }

        .register-btn {
            text-align: center;
            margin: 20px;
        }

        .register-btn a {
            font-size: 1.25rem;
            padding: 10px 20px;
        }

        @media (max-width: 767px) {
            .navbar-nav {
                flex-direction: column;
            }

            .navbar-toggler {
                display: block;
            }
			
			

            .content-section {
                flex-direction: column;
            }

            .card-section {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <nav class="navbar navbar-expand-md navbar-light">
        <a class="navbar-brand" href="#">QuickCart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="/login" class="nav-link">Login</a>
                </li>
                <li class="nav-item">
                    <a href="/register" class="nav-link">Signup</a>
                </li>
            </ul>
        </div>
    </nav>

	<div class="container content-section">
	    <div class="row align-items-center mt-5">
	        <!-- Text Content Column -->
	        <div class="col-12 col-md-6 content-text d-flex flex-column justify-content-center text-center text-md-left mb-4 mb-md-0">
	            <h1 class="mb-5">Welcome To QuickCart...</h1>
	            <h3>Discover the Best Products</h3>
	            <p>At QuickCart, we offer a wide range of products at unbeatable prices. Whether you're looking to buy or sell, we've got you covered!</p>
	            <a href="/products" class="btn btn-primary mt-5">View Products</a>
	        </div>
	        <!-- Image Column -->
	        <div class="col-12 col-md-6 d-flex justify-content-center">
	            <img src="/images/shopping-illu.jpg" alt="Shopping illustration" class="img-fluid" style="max-width: 90%;">
	        </div>
	    </div>
	</div>



    <!-- Card Section -->
    <div class="container card-section">
        <!-- Heading Before Cards -->
        <h2 class="text-center w-100 my-5">Why Retailers Should Register on QuickCart</h2>

        <!-- Card 1 -->
        <div class="card">
            <img src="https://via.placeholder.com/300x200" alt="Customer Reach">
            <div class="card-body">
                <h5>Wide Customer Reach</h5>
                <p>Registering on QuickCart allows retailers to reach a large and diverse customer base. Expand your business by showcasing your products to millions of customers.</p>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="card">
            <img src="https://via.placeholder.com/300x200" alt="Inventory Management">
            <div class="card-body">
                <h5>Easy Inventory Management</h5>
                <p>Our platform provides a simple and intuitive interface for retailers to manage their inventory, helping you keep track of stock and product availability with ease.</p>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="card">
            <img src="https://via.placeholder.com/300x200" alt="Secure Payments">
            <div class="card-body">
                <h5>Fast and Secure Payments</h5>
                <p>We offer fast, reliable, and secure payment solutions that ensure retailers get paid on time, without any hassle. You can focus on selling, and we handle the rest.</p>
            </div>
        </div>
    </div>

    <!-- Register as a Retailer Button -->
    <div class="register-btn mb-3">
        <a href="/retailer-register" class="btn btn-primary btn-lg">Register as a Retailer</a>
    </div>

    <!-- Optional Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
