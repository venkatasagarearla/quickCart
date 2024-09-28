<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e0f2f1; 
            font-family: 'Roboto';
        }

        .login-form-container {
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
            .login-form-container {
                flex-direction: row;
                justify-content: space-around;
            }
        }

        .login-website-logo-mobile-img {
            width: 165px;
            margin-top: 50px;
            margin-bottom: 35px;
        }

        @media screen and (min-width: 992px) {
            .login-website-logo-mobile-img {
                display: none;
            }
        }

        .login-img {
            width: 278px;
        }

        @media screen and (min-width: 992px) {
            .login-img {
                width: 60%;
                max-width: 524px;
                flex-shrink: 1;
                margin-right: 20px;
            }
        }

        .login-website-logo-desktop-img {
            width: 185px;
        }

        @media screen and (max-width: 991px) {
            .login-website-logo-desktop-img {
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
            background-color: #e0f2f1;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        @media screen and (min-width: 992px) {
            .form-container {
                width: 500px;
                flex-shrink: 0;
                box-shadow: 0px 8px 40px rgba(7, 7, 7, 0.08);
                padding: 64px 48px;
            }
        }

        .input-box {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
            width: 100%;
        }

        .input-label {
            margin-bottom: 0px;
            font-family: 'Roboto';
            font-weight: bold;
            font-size: 15px;
            line-height: 16px;
            color: #004d40; /* Thick green color */
        }

        .username-input-field, .password-input-field {
            font-size: 14px;
            height: 40px;
			width: 300px;
            border: 1px solid #004d40; /* Thick green border */
            background-color: #e8f5e9; /* Light green input background */
            color: #004d40; /* Thick green text color */
            border-radius: 2px;
            margin-top: 5px;
            padding: 8px 16px;
            outline: none;
        }

        .login-button {
            font-family: 'Roboto';
            font-weight: bold;
            font-size: 14px;
            color: #ffffff;
            height: 40px;
            width: 100%;
            margin-top: 20px;
            background-color: #004d40; /* Thick green button color */
            border-radius: 8px;
            border: none;
            cursor: pointer;
            outline: none;
        }
		
		.heading {
			color: #004d40;
		}

        .login-button:hover {
            background-color: #00332e; /* Darker green for hover effect */
        }

        .error-message {
            align-self: start;
            font-size: 12px;
            margin-top: 3px;
            margin-bottom: 0px;
            font-family: 'Roboto';
            line-height: 16px;
            color: #ff0b37; /* Red color for error messages */
        }
		
    </style>
</head>
<body>
    <div class="login-form-container">
        <img src="https://assets.ccbp.in/frontend/react-js/nxt-trendz-logo-img.png" class="login-website-logo-mobile-img" alt="website logo" />
        <img src="https://assets.ccbp.in/frontend/react-js/nxt-trendz-login-img.png" class="login-img" alt="website login" />
        
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4 form-container">
                    <h2 class="text-center mb-4 heading">Login</h2>

                    <form action="/login" method="post">
                        <div class="mb-3 input-box">
                            <label for="username" class="input-label">Username</label>
                            <input type="text" class="username-input-field" id="username" name="username" required placeholder="Username">
                        </div>
                        <div class="mb-3 input-box">
                            <label for="password" class="input-label">Password</label>
                            <input type="password" class="password-input-field" id="password" name="password" required placeholder="Password">
                        </div>
                        <button type="submit" class="login-button">Login</button>
                    </form>
                    
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger mt-4" role="alert">
                            ${errorMessage}
                        </div>
                    </c:if>

                    <div class="text-center mt-3">
                        <p>Don't have an account? <a href="/register">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
