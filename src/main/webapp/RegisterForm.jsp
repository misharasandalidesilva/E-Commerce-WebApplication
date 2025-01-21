<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 21/01/2025
  Time: 01:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Lulus Fashion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fffafc;
            color: #333;
            background-image: url('assests/HomePage/download (8).jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .register-section {
            background: linear-gradient(to bottom right, #ffd6e8, #ff8fdc);
            color: #2e2b2b;
            height: 20vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .register-section h1 {
            font-size: 3rem;
            font-weight: bold;
            text-shadow: 2px 2px 10px rgba(255, 255, 255, 0.6);

        }
        .register-form {
            background: #ffe6f3;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .register-form .btn-custom {
            background-color: #ff6bb4;
            color: white;
            border: none;
        }
        .register-form .btn-custom:hover {
            background-color: #ff4a9a;
        }
        footer {
            background-color: #ffd6e8;
            color: #333;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- Register Hero Section -->
<div class="register-section">
    <div>
        <h1>Join Lulus Fashion</h1>
        <p>Create your account and explore the latest trends!</p>
    </div>
</div>

<!-- Register Form -->
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="register-form">
                <h3 class="mb-4" style="color: #781e2d;">Register Form</h3>
                <form action="registration" method="post">
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" name="name" id="fullName" placeholder="Enter your full name">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Create a password">
                    </div>
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm your password">
                    </div>
                    <button type="submit" class="btn btn-custom w-100">Register</button>
                    <p class="text-center mt-3">Already have an account? <a href="LoginForm.jsp" style="color: #ff6bb4; text-decoration: underline;">Login here</a>.</p>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Lulus Fashion. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
