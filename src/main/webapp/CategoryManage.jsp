<%@ page import="org.example.ecommercewebapplication.DTO.CategoryDto" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommercewebapplication.DTO.CategoryDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
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

        .add-category-btn {
            background-color: #ff79c6;
            border-color: #ff79c6;
            color: #fff;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px 20px;
        }

        .add-category-btn:hover {
            background-color: #e066b4;
            border-color: #e066b4;
        }

        .category-table {
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }

        .category-table th {
            background-color: #ff79c6;
            color: #fff;
            font-weight: bold;
            text-align: center;
        }

        .category-table td {
            text-align: center;
        }

        .footer {
            text-align: center;
            margin-top: 340px;
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
        <span>Category Management</span>
        <button class="btn add-category-btn" data-bs-toggle="modal" data-bs-target="#addCategoryModal">+ Add Category</button>
    </div>

    <!-- Category Table -->
    <div class="table-responsive mt-4">
        <table class="table category-table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>Category Name</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<CategoryDto> categories = (List<CategoryDto>) request.getAttribute("categories");
                if (categories != null) {
                    for (CategoryDto category : categories) {
            %>
            <tr>
                <td><%= category.getId() %></td>
                <td><%= category.getName() %></td>
                <td><%= category.getDescription() %></td>
                <td>
                    <button class="btn btn-sm btn-warning"
                            data-bs-toggle="modal"
                            data-bs-target="#editCategoryModal"
                            data-id="<%= category.getId() %>"
                            data-name="<%= category.getName() %>"
                            data-description="<%= category.getDescription() %>">
                        <i class="bi bi-pencil"></i> Update
                    </button>
                    <!-- Delete Button -->
                    <button class="btn btn-sm btn-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteCategoryModal"
                            data-categoryid="<%= category.getId() %>"
                            data-categoryname="<%= category.getName() %>">
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

<!-- Add Category Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add New Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addCategoryForm" action="category-manage" method="post">
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" name="name" id="categoryName" placeholder="Enter category name" required>
                    </div>
                    <div class="mb-3">
                        <label for="categoryDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="categoryDescription" rows="3" placeholder="Enter description" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">Add Category</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCategoryModalLabel">Edit Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editCategoryForm" action="category-update" method="post">
                    <input type="hidden" name="id" id="editCategoryId">
                    <div class="mb-3">
                        <label for="editCategoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" name="name" id="editCategoryName" placeholder="Enter category name" required>
                    </div>
                    <div class="mb-3">
                        <label for="editCategoryDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="editCategoryDescription" rows="3" placeholder="Enter description" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">Update Category</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Delete Category Modal -->
<div class="modal fade" id="deleteCategoryModal" tabindex="-1" aria-labelledby="deleteCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteCategoryModalLabel">Delete Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete the category <strong id="categoryName2"></strong>?</p>
                <form id="deleteForm" action="deleteCategory" method="post">
                    <input type="hidden" name="categoryId" id="categoryId">
                    <button type="submit" class="btn btn-danger">Yes, Delete</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var deleteCategoryModal = document.getElementById('deleteCategoryModal');
    deleteCategoryModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var categoryId = button.getAttribute('data-categoryid');
        var categoryName = button.getAttribute('data-categoryname');

        var categoryName2 = document.getElementById('categoryName2');
        categoryName2.textContent = categoryName;

        var categoryIdInput = document.getElementById('categoryId');
        categoryIdInput.value = categoryId;
    });
    const editCategoryModal = document.getElementById('editCategoryModal');


    editCategoryModal.addEventListener('show.bs.modal', function (event) {

        const button = event.relatedTarget;


        const categoryId = button.getAttribute('data-id');
        const categoryName = button.getAttribute('data-name');
        const categoryDescription = button.getAttribute('data-description');


        const editCategoryNameInput = document.getElementById('editCategoryName');
        const editCategoryDescriptionInput = document.getElementById('editCategoryDescription');
        const editCategoryIdInput = document.getElementById('editCategoryId');


        editCategoryIdInput.value = categoryId;
        editCategoryNameInput.value = categoryName;
        editCategoryDescriptionInput.value = categoryDescription;


        if (editCategoryIdInput) {
            editCategoryIdInput.value = categoryId;
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
