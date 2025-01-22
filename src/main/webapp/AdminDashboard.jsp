<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 22/01/2025
  Time: 01:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lulus Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* General Styling */
        body {
            background-color: #ffe4ec;
            font-family: 'Arial', sans-serif;
        }

        /* Top Navbar Styling */
        .navbar {
            background-color: #ffc1c1;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            font-family: KDDESIE;
        }

        /* Main Content Styling */
        .main-content {
            padding: 20px;
            margin-top: 100px;
        }

        /* Header Section Styling */
        .header {
            font-size: 40px;
            font-weight: bold;
            color: #333;
            margin-bottom: 100px;
            margin-left: 320px;
        }

        /* Card Styling */
        .card {
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 150px;
        }

        .card-title {
            color: #ff79c6;
        }

        /* Footer Styling */
        .footer {
            position: fixed;
            text-align: center;
            margin-top: 100px;
            font-size: 14px;
            background: #ffdde1;
            padding: 10px 500px;
            color: #555;
        }
    </style>
</head>
<body>
<!-- Top Navbar -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Lulus Fashion</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UsersManage.jsp">Users </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Products </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Catogories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a>
                </li>
            </ul>
            <div class="ms-auto">
                <a href="LoginForm.jsp" class="btn btn-outline-pink btn-sm">Login</a>
                <a href="RegisterForm.jsp" class="btn btn-pink btn-sm">Register</a>
            </div>
        </div>
    </div>
</nav>


<!-- Main Content -->
<div class="main-content container">
    <!-- Header -->
    <div class="header">Welcome to Admin Dashboard</div>

    <!-- Dashboard Cards -->
    <div class="row">
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Users</h5>
                    <p class="card-text">Manage all users</p>
                    <a href="#" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">View</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Brands</h5>
                    <p class="card-text">Manage all brands</p>
                    <a href="#" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">View</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Products</h5>
                    <p class="card-text">Manage all products</p>
                    <a href="#" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">View</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Orders</h5>
                    <p class="card-text">Manage all orders</p>
                    <a href="#" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">View</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        © 2025 Lulus Fashion. All rights reserved.
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

