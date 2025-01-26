package org.example.ecommercewebapplication;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.ecommercewebapplication.DTO.CategoryDto;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryManageServlet", value = "/category-manage")
public class CategoryManageServlet extends HttpServlet {

    // Fetch and display categories from the database (doGet)
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDto> categories = new ArrayList<>();

        // Fetch all categories from the database
        try (Connection connection = getDatabaseConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM categories");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                CategoryDto category = new CategoryDto();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setDescription(resultSet.getString("description"));
                categories.add(category);
            }
        } catch (SQLException e) {
            req.setAttribute("errorMessage", "Error fetching categories: " + e.getMessage());
        }

        // Set the categories list as an attribute to pass it to the JSP
        req.setAttribute("categories", categories);

        // Forward the request to the JSP page to render the updated table
        req.getRequestDispatcher("CategoryManage.jsp").forward(req, resp);
    }

    // Add a new category to the database (doPost)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Fetch category data from the form
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        // Validate inputs
        if (name == null || name.trim().isEmpty() ||
                description == null || description.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Both name and description are required.");
            req.getRequestDispatcher("CategoryManage.jsp").forward(req, resp);
            return;
        }

        // Insert category into the database
        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";
        try (Connection connection = getDatabaseConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                req.setAttribute("successMessage", "Category added successfully.");
            } else {
                req.setAttribute("errorMessage", "Failed to add category.");
            }
        } catch (SQLException e) {
            req.setAttribute("errorMessage", "Error adding category: " + e.getMessage());
        }

        // After processing the form, fetch the updated list of categories
        doGet(req, resp); // This will forward the updated list back to the JSP
    }

    // Helper method to get the database connection
    private Connection getDatabaseConnection() throws SQLException {
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");
        return ds.getConnection();
    }
}
