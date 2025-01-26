<%@ page import="org.example.ecommercewebapplication.DTO.UserDTO" %>
<%@ page import="java.util.List" %><%--
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
        body {
            background-color: #ffe4ec;
            font-family: 'Arial', sans-serif;
        }


        .header {
            font-size: 30px;
            font-weight: bold;
            color: #333;

        }


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
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
                if (users != null) {
                    for (UserDTO user : users) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getRole() %></td>
                <td>
                    <!-- Delete Button -->
                    <button class="btn btn-sm btn-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteUserModal"
                            data-userid="<%= user.getId() %>"
                            data-username="<%= user.getName() %>">
                        Delete
                    </button>
                </td>
            </tr>
            <%
                    }
                }
            %>
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
                <form id="addUserForm" action="user-manage" method="post">
                    <div class="mb-3">
                        <label for="userName" class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" id="userName" placeholder="Enter name" required>
                    </div>
                    <div class="mb-3">
                        <label for="userEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="userEmail" placeholder="Enter email" required>
                    </div>
                    <div class="mb-3">
                        <label for="userPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="userPassword" placeholder="Enter password" required>
                    </div>
                    <div class="mb-3">
                        <label for="userConfirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" name="confirmPassword" id="userConfirmPassword" placeholder="Confirm password" required>
                    </div>
                    <div class="mb-3">
                        <label for="userRole" class="form-label">Role</label>
                        <select class="form-select" name="role" id="userRole" required>
                            <option selected>Choose role...</option>
                            <option value="Admin">Admin</option>
                            <option value="Customer">Customer</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">Add User</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteUserModalLabel">Delete User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete the user <strong id="userName2"></strong>?</p>
                <form id="deleteForm" action="deleteUser" method="post">
                    <input type="hidden" name="userId" id="id">
                    <button type="submit" class="btn btn-danger">Yes, Delete</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    var deleteUserModal = document.getElementById('deleteUserModal');
    deleteUserModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var userId = button.getAttribute('data-userid');
        var userName = button.getAttribute('data-username');

        var userName2 = document.getElementById('userName2');
        userName2.textContent = userName;

        var userIdInput = document.getElementById('id');
        userIdInput.value = userId;
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
