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

@WebServlet(name = "CategoryUpdateServlet", value = "/category-update")
public class CategoryUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try (Connection connection = ds.getConnection()) {
            String updateQuery = "UPDATE categories SET name = ?, description = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(updateQuery)) {
                statement.setString(1, name);
                statement.setString(2, description);
                statement.setInt(3, categoryId);
                int rowsUpdated = statement.executeUpdate();
                if (rowsUpdated > 0) {
                    resp.sendRedirect("category-manage");
                } else {
                    req.setAttribute("errorMessage", "Failed to update category.");
                    req.getRequestDispatcher("category-manage").forward(req, resp);
                }
            }
        } catch (SQLException e) {
            req.setAttribute("errorMessage", "Error updating category: " + e.getMessage());
            req.getRequestDispatcher("category-manage").forward(req, resp);
        }
    }

}
