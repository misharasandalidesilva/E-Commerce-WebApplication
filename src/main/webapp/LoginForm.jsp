<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 21/01/2025
  Time: 01:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Lulus Fashion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-image: url('assests/HomePage/minimalist-wardrobe-composition-pink-colors-sweaters-hanger-whte-shoes-flowers-ai-genera_113954-506.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            /*background: linear-gradient(to bottom, #ffdde1, #ffe4f4);*/
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }
        .login-container {
            background-color: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .login-container h3 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ff6bb4;
            text-align: center;
            margin-bottom: 20px;
        }
        .login-container .form-label {
            color: #555;
            font-weight: 500;
        }
        .login-container .form-control {
            border-radius: 10px;
            border: 1px solid #ffaad4;
        }
        .login-container .btn-custom {
            background-color: #ff6bb4;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            width: 100%;
            transition: all 0.3s ease;
        }
        .login-container .btn-custom:hover {
            background-color: #ff4a9a;
        }
        .login-container p {
            margin-top: 15px;
            text-align: center;
            color: #777;
        }
        .login-container a {
            color: #ff6bb4;
            text-decoration: underline;
            font-weight: 500;
        }
        .login-container .forgot-password {
            font-size: 0.9rem;
            text-align: end;
            color: #555;
        }
        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            background: #ffdde1;
            text-align: center;
            padding: 10px 0;
            color: #555;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<!-- Login Container -->
<div class="login-container">
    <h3>Welcome Back Lulus Fashion!</h3>
    <form action="login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password">
            <div class="forgot-password">
                <a href="#">Forgot password?</a>
            </div>
        </div>
        <button type="submit" class="btn btn-custom">Login</button>
        <p class="mt-3">
            Don't have an account? <a href="RegisterForm.jsp">Register here</a>.
        </p>
    </form>
</div>

<!-- Footer -->
<footer>
    &copy; 2025 Lulus Fashion. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

