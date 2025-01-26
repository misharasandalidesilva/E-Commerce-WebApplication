<%@ page import="org.example.ecommercewebapplication.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
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
        .add-product-btn {
            background-color: #ff79c6;
            border-color: #ff79c6;
            color: #fff;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px 20px;
        }
        .add-product-btn:hover {
            background-color: #e066b4;
            border-color: #e066b4;
        }
        .product-table {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }
        .product-table th {
            background-color: #ff79c6;
            color: #fff;
            font-weight: bold;
            text-align: center;
        }
        .product-table td {
            text-align: center;
        }
        .footer {
            text-align: center;
            margin-top: 460px;
            font-size: 14px;
            background: #ffdde1;
            padding: 10px 0;
            color: #555;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="header d-flex justify-content-between align-items-center">
        <span>Product Management</span>
        <button class="btn add-product-btn" data-bs-toggle="modal" data-bs-target="#addProductModal">+ Add Product</button>
    </div>
    <div class="table-responsive mt-4">
        <table class="table product-table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>Product Name</th>
                <th>CategoryID</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Size</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
                if (products != null) {
                    for (ProductDTO product : products) {
            %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getCategoryId() %></td>
                <td><%= product.getDescription() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getQuantity() %></td>
                <td><%= product.getSize() %></td>
                <td>
                <img src="<%= request.getContextPath() %>/uploads/<%= product.getImage() %>" alt="Product Image" width="100"></td>

                <td>
                    <button class="btn btn-sm btn-warning"
                            data-bs-toggle="modal"
                            data-bs-target="#updateProductModal"
                            data-productid="<%= product.getId() %>"
                            data-productname="<%= product.getName() %>"
                            data-productcategory="<%= product.getCategoryId() %>"
                            data-productdescription="<%= product.getDescription() %>"
                            data-productprice="<%= product.getPrice() %>"
                            data-productquantity="<%= product.getQuantity() %>"
                            data-productsize="<%= product.getSize() %>"
                            data-productimage="<%= product.getImage() %>">
                        Update
                    </button>
                    <button class="btn btn-sm btn-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteProductModal"
                            data-productid="<%= product.getId() %>"
                            data-productname="<%= product.getName() %>">
                        Delete
                    </button>
                </td>
            </tr>
            <%
                    }
                }
            %>

<%--            <c:forEach var="product" items="${products}">--%>
<%--                <div class="product">--%>
<%--                    <h3>${product.name}</h3>--%>
<%--                    <img src="uploads/${product.image}" alt="${product.name}" />--%>
<%--                    <p>${product.description}</p>--%>
<%--                    <p>Price: $${product.price}</p>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="product-manage" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" name="name" id="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <select class="form-select" name="categoryId" id="productCategory" required>
                            <option selected disabled>Choose category...</option>
                            <option value="1">Frock</option>
                            <option value="2">Trousers</option>
                            <option value="3">T-shirts</option>
                            <option value="4">Shirts</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="productDescription" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" name="price" id="productPrice" required>
                    </div>
                    <div class="mb-3">
                        <label for="productQuantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" name="quantity" id="productQuantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="productSize" class="form-label">Size</label>
                        <input type="text" class="form-control" name="size" id="productSize" required>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input type="file" name="image" id="productImage" class="form-control" accept="image/*" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">Add Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Update Product Modal -->
<div class="modal fade" id="updateProductModal" tabindex="-1" aria-labelledby="updateProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateProductModalLabel">Update Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateProductForm" action="product-update" method="post">
                    <input type="hidden" name="productId" id="updateProductId">
                    <div class="mb-3">
                        <label for="updateProductName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" name="name" id="updateProductName" placeholder="Enter product name" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateProductCategory" class="form-label">Category</label>
                        <select class="form-select" name="categoryId" id="updateProductCategory" required>
                            <option selected>Choose category...</option>
                            <option value="1">Frock</option>
                            <option value="2">Trousers</option>
                            <option value="3">T-shirts</option>
                            <option value="4">Shirts</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="updateProductDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="updateProductDescription" placeholder="Enter product description" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="updateProductPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" name="price" id="updateProductPrice" placeholder="Enter product price" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateProductQuantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" name="quantity" id="updateProductQuantity" placeholder="Enter quantity" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="background-color: #ff79c6; border-color: #ff79c6;">Update Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Product Modal -->
<div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteProductModalLabel">Delete Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete the product <strong id="productName2"></strong>?</p>
                <form id="deleteForm" action="product-delete" method="post">
                    <input type="hidden" name="productId" id="id">
                    <button type="submit" class="btn btn-danger">Yes, Delete</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // Update product modal
    var updateProductModal = document.getElementById('updateProductModal');
    updateProductModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;


        var productId = button.getAttribute('data-productid');
        var productName = button.getAttribute('data-productname');
        var productCategory = button.getAttribute('data-productcategory');
        var productDescription = button.getAttribute('data-productdescription');
        var productPrice = button.getAttribute('data-productprice');
        var productQuantity = button.getAttribute('data-productquantity');
        var productSize = button.getAttribute('data-productsize');
        var productImage = button.getAttribute('data-productimage');


        if (productId) {
            document.getElementById('updateProductId').value = productId; // Populate the product ID
        } else {
            console.error('Product ID is missing!');
        }

        // Ensure that the productName, category, description, price, quantity, and size are all set
        document.getElementById('updateProductName').value = productName || ''; // Set to empty if missing
        document.getElementById('updateProductCategory').value = productCategory || ''; // Set to empty if missing
        document.getElementById('updateProductDescription').value = productDescription || ''; // Set to empty if missing
        document.getElementById('updateProductPrice').value = productPrice || ''; // Set to empty if missing
        document.getElementById('updateProductQuantity').value = productQuantity || ''; // Set to empty if missing
        document.getElementById('updateProductSize').value = productSize || ''; // Set to empty if missing
        document.getElementById('updateProductImage').value = productImage || ''; // Set to empty if missing
    });






    // Delete product modal
    var deleteProductModal = document.getElementById('deleteProductModal');
    deleteProductModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var productId = button.getAttribute('data-productid');
        var productName = button.getAttribute('data-productname');

        var productName2 = document.getElementById('productName2');
        productName2.textContent = productName;

        var productIdInput = document.getElementById('id');
        productIdInput.value = productId;
    });
</script>

<!-- Footer -->
<div>
    <div class="footer">
        © 2025 Lulus Fashion. All rights reserved.
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
