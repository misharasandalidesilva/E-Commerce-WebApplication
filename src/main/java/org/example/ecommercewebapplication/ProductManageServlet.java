package org.example.ecommercewebapplication;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.ecommercewebapplication.DTO.ProductDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ProductManageServlet", value = "/product-manage")
public class ProductManageServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ProductManageServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        // Extract form parameters
        String name = req.getParameter("name");
        String categoryParam = req.getParameter("categoryId");
        String description = req.getParameter("description");
        String priceParam = req.getParameter("price");
        String quantityParam = req.getParameter("quantity");
        String size = req.getParameter("size");

        // Validate inputs
        if (name == null || name.trim().isEmpty() ||
                categoryParam == null || categoryParam.trim().isEmpty() ||
                description == null || description.trim().isEmpty() ||
                priceParam == null || priceParam.trim().isEmpty() ||
                quantityParam == null || quantityParam.trim().isEmpty() ||
                size == null || size.trim().isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
            return;
        }

        try {
            // Parse numeric fields
            int categoryId = Integer.parseInt(categoryParam);
            double price = Double.parseDouble(priceParam);
            int quantity = Integer.parseInt(quantityParam);

            // Log the received data
            LOGGER.info(String.format("Adding product: %s, Category: %d, Description: %s, Price: %.2f, Quantity: %d, Size: %s",
                    name, categoryId, description, price, quantity, size));

            // Get the DataSource
            ServletContext servletContext = getServletContext();
            BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");
            if (ds == null) {
                throw new ServletException("DataSource not configured in ServletContext.");
            }

            // Insert product into the database
            try (Connection connection = ds.getConnection()) {
                String sql = "INSERT INTO products (name, category_id, description, price, quantity, size) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, name);
                    preparedStatement.setInt(2, categoryId);
                    preparedStatement.setString(3, description);
                    preparedStatement.setDouble(4, price);
                    preparedStatement.setInt(5, quantity);
                    preparedStatement.setString(6, size);
                    preparedStatement.executeUpdate();
                }
            }

            // Redirect to category list or success page
            resp.sendRedirect("getallcategory");

        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid number format for category, price, or quantity.", e);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format for category, price, or quantity.");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error occurred while adding product.", e);
            throw new RuntimeException("Database error occurred: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        List<ProductDTO> products = new ArrayList<>();

        // Get the DataSource
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");
        if (ds == null) {
            throw new ServletException("DataSource not configured in ServletContext.");
        }

        try (Connection connection = ds.getConnection()) {
            // Fetch products from the database
            String sql = "SELECT * FROM products";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    ProductDTO product = new ProductDTO();
                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setCategoryId(resultSet.getInt("category_id"));
                    product.setDescription(resultSet.getString("description"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setQuantity(resultSet.getInt("quantity"));
                    product.setSize(resultSet.getString("size"));
                    products.add(product);
                }
            }

            // Set the products list as a request attribute
            req.setAttribute("products", products);

            // Forward to JSP for display
            req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error occurred while fetching products.", e);
            throw new RuntimeException("Database error occurred: " + e.getMessage(), e);
        }
    }
}
