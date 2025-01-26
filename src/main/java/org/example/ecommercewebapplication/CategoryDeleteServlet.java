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

@WebServlet(name = "DeleteCategoryServlet", value = "/deleteCategory")
public class CategoryDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("categoryId");

        if (idParam == null || idParam.isEmpty()) {
            req.setAttribute("errorMessage", "Category ID is missing.");
            req.getRequestDispatcher("CategoryManage.jsp").forward(req, resp);
            return;
        }

        int categoryId;
        try {
            categoryId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid category ID.");
            req.getRequestDispatcher("CategoryManage.jsp").forward(req, resp);
            return;
        }

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try (Connection connection = ds.getConnection()) {
            String deleteQuery = "DELETE FROM categories WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(deleteQuery)) {
                statement.setInt(1, categoryId);
                int rowsDeleted = statement.executeUpdate();

                if (rowsDeleted > 0) {
                    resp.sendRedirect("category-manage");
                } else {
                    req.setAttribute("errorMessage", "Category not found or could not be deleted.");
                    req.getRequestDispatcher("CategoryManage.jsp").forward(req, resp);
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Error deleting category", e);
        }
    }
}
