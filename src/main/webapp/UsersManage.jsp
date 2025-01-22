<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 22/01/2025
  Time: 01:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* General Styling */
        body {
            background-color: #ffe4ec;
            font-family: 'Arial', sans-serif;
        }

        /* Header Section */
        .header {
            font-size: 30px;
            font-weight: bold;
            color: #333;

        }

        /* Add User Button */
        .add-user-btn {
            background-color: #ff79c6;
            border-color: #ff79c6;
            color: #fff;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px 20px;
        }

        .add-user-btn:hover {
            background-color: #e066b4;
            border-color: #e066b4;
        }

        /* Table Styling */
        .user-table {
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }

        .user-table th {
            background-color: #ff79c6;
            color: #fff;
            font-weight: bold;
            text-align: center;
        }

        .user-table td {
            text-align: center;
        }

        /* Footer Styling */
        .footer {
            text-align: center;
            margin-top: 350px;
            font-size: 14px;
            background: #ffdde1;
            padding: 10px 0;
            color: #555;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <!-- Header Section -->
    <div class="header d-flex justify-content-between align-items-center">
        <span>Users Management</span>
        <button class="btn add-user-btn" data-bs-toggle="modal" data-bs-target="#addUserModal">+ Add User</button>
    </div>

    <!-- Users Table -->
    <div class="table-responsive mt-4">
        <table class="table user-table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Jane Doe</td>
                <td>jane.doe@example.com</td>
                <td>Admin</td>
                <td>
                    <button type="button" class="btn btn-success">Active</button>

                </td>
                <td>
                    <button class="btn btn-warning btn-sm">Edit</button>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>John Smith</td>
                <td>john.smith@example.com</td>
                <td>User</td>
                <td>
                    <button type="button" class="btn btn-danger">Deactivated</button>
                </td>
                <td>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <div class="footer">
        © 2025 Lulus Fashion. All rights reserved.
    </div>
</div>

<!-- Add User Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addUserForm">
                    <div class="mb-3">
                        <label for="userName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="userName" placeholder="Enter name" required>
                    </div>
                    <div class="mb-3">
                        <label for="userEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="userEmail" placeholder="Enter email" required>
                    </div>
                    <div class="mb-3">
                        <label for="userPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="userPassword" placeholder="Enter password" required>
                    </div>
                    <div class="mb-3">
                        <label for="userConfirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="userConfirmPassword" placeholder="Confirm password" required>
                    </div>
                    <div class="mb-3">
                        <label for="userRole" class="form-label">Role</label>
                        <select class="form-select" id="userRole" required>
                            <option selected>Choose role...</option>
                            <option value="Admin">Admin</option>
                            <option value="User">User</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">Add User</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("addUserForm").addEventListener("submit", function (e) {
        e.preventDefault();
        const password = document.getElementById("userPassword").value;
        const confirmPassword = document.getElementById("userConfirmPassword").value;

        if (password !== confirmPassword) {
            alert("Passwords do not match!");
            return;
        }

        alert("User added successfully!");
        // Add logic to submit form data to server here
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
