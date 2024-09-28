<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e0f2f1; 
            font-family: 'Roboto';
        }

        .register-form-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 90%;
            max-width: 1110px;
            margin: auto;
        }

        @media screen and (min-width: 992px) {
            .register-form-container {
                flex-direction: row;
                justify-content: space-around;
            }
        }

        .register-website-logo-mobile-img {
            width: 165px;
            margin-top: 50px;
            margin-bottom: 35px;
        }

        @media screen and (min-width: 992px) {
            .register-website-logo-mobile-img {
                display: none;
            }
        }

        .register-img {
            width: 278px;
        }

        @media screen and (min-width: 992px) {
            .register-img {
                width: 60%;
                max-width: 524px;
                flex-shrink: 1;
                margin-right: 20px;
            }
        }

        .register-website-logo-desktop-img {
            width: 185px;
        }

        @media screen and (max-width: 991px) {
            .register-website-logo-desktop-img {
                display: none;
            }
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            border-radius: 8px;
            width: 100%;
            max-width: 500px; 
        }

        @media screen and (min-width: 992px) {
            .form-container {
                width: 500px;
                flex-shrink: 0;
                box-shadow: 0px 8px 40px rgba(7, 7, 7, 0.08);
                padding: 64px 48px 64px 48px;
            }
        }

        .input-container {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
            width: 100%;
        }

        .input-label {
            margin-bottom: 0px;
            font-weight: bold;
            font-size: 15px;
            line-height: 16px;
            color: #006400;
        }

        .username-input-field, .password-input-field, .email-input-field {
            font-size: 14px;
            height: 40px;
            width: 300px;
            border: 1px solid #006400; /* Thick green */
            background-color: #e0f2f1; /* Light green */
            border-radius: 2px;
            margin-top: 5px;
            padding: 8px 16px;
            outline: none;
        }
		
		.heading {
			color: #006400;
		}

        .login-button {
            font-weight: bold;
            font-size: 14px;
            color: #ffffff;
            height: 40px;
            width: 100%;
            margin-top: 20px;
            margin-bottom: 2px;
            background-color: #006400; /* Thick green */
            border-radius: 8px;
            border: none;
            cursor: pointer;
            outline: none;
        }

        .error-message {
            align-self: start;
            font-size: 12px;
            margin-top: 3px;
            margin-bottom: 0px;
            line-height: 16px;
            color: #ff0b37; /* Error color */
        }
    </style>
</head>
<body>
    <div class="register-form-container">
        <img src="https://assets.ccbp.in/frontend/react-js/nxt-trendz-logo-img.png" class="register-website-logo-mobile-img" alt="website logo" />
        <img src="https://assets.ccbp.in/frontend/react-js/nxt-trendz-login-img.png" class="register-img" alt="website register" />
        
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 form-container">
                    <h2 class="text-center mb-4 heading">Customer Registration</h2>

                    <form action="/register" method="post">
                        <div class="mb-3 input-container">
                            <label for="username" class="input-label">Username</label>
                            <input type="text" class="username-input-field" id="username" name="username" required placeholder="Username">
                        </div>
                        <div class="mb-3 input-container">
                            <label for="email" class="input-label">Email address</label>
                            <input type="text" class="email-input-field" id="email" name="email" required placeholder="Email address">
                        </div>
                        <div class="mb-3 input-container">
                            <label for="password" class="input-label">Password</label>
                            <input type="password" class="password-input-field" id="password" name="password" required placeholder="Password">
                        </div>
                        <button type="submit" class="login-button">Sign Up</button>
                    </form>
                    
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger mt-4" role="alert">
                            ${errorMessage}
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
