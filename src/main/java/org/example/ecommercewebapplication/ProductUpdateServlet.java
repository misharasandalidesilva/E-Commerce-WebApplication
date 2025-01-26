package org.example.ecommercewebapplication;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "UpdateProductServlet", value = "/product-update")
public class ProductUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Logging to help debug
        System.out.println("update post");

        // Fetching parameters from the request
        String productIdStr = req.getParameter("productId");
        String name = req.getParameter("productName");
        String priceStr = req.getParameter("productPrice");
        String categoryStr = req.getParameter("categoryId");
        String description = req.getParameter("productDescription");
        String quantityStr = req.getParameter("productQuantity");
        String size = req.getParameter("productSize");

        // Validate if any required field is missing
        if (productIdStr == null || name == null || priceStr == null || categoryStr == null ||
                description == null || quantityStr == null || size == null ||
                productIdStr.isEmpty() || name.isEmpty() || priceStr.isEmpty() || categoryStr.isEmpty() ||
                description.isEmpty() || quantityStr.isEmpty() || size.isEmpty()) {
            req.setAttribute("errorMessage", "All fields are required.");
            req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);
            return;
        }

        // Convert the strings to appropriate data types
        int id = Integer.parseInt(productIdStr);
        double price = Double.parseDouble(priceStr);
        int categoryId = Integer.parseInt(categoryStr);
        int quantity = Integer.parseInt(quantityStr);

        // Logging to help debug
        System.out.println(id + " " + name + " " + description + " " + price + " " + categoryId + " " + quantity + " " + size);

        // Get the data source from the servlet context
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try (Connection connection = ds.getConnection()) {
            // Prepare SQL query to update the product
            String updateQuery = "UPDATE products SET name = ?, category_id = ?, description = ?, price = ?, quantity = ?, size = ? WHERE id = ?";

            // Prepare the statement
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setString(1, name);
                preparedStatement.setInt(2, categoryId);
                preparedStatement.setString(3, description);
                preparedStatement.setDouble(4, price);
                preparedStatement.setInt(5, quantity);
                preparedStatement.setString(6, size);
                preparedStatement.setInt(7, id);

                // Execute the update
                int rowsUpdated = preparedStatement.executeUpdate();

                // If update is successful, redirect to the product management page
                if (rowsUpdated > 0) {
                    resp.sendRedirect("product-manage");
                } else {
                    req.setAttribute("errorMessage", "Failed to update product.");
                    req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);
                }
            }
        } catch (SQLException e) {
            // Handle any SQL errors
            e.printStackTrace();
            req.setAttribute("errorMessage", "Error updating product: " + e.getMessage());
            req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);
        }
    }
}
