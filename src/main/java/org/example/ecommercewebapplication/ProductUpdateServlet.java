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

        System.out.println("update post");
        int id = Integer.parseInt(req.getParameter("productId"));
        String name = req.getParameter("productName");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String description = req.getParameter("productDescription");
        double price = Double.parseDouble(req.getParameter("productPrice"));
        int quantity = Integer.parseInt(req.getParameter("productQuantity"));
        String size = req.getParameter("productSize");

        System.out.println(id + " " + name + " " + categoryId + " " + description + " " + price + " " + quantity + " " + size);

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE products SET name = ?, category_id = ?, description = ?, price = ?, quantity = ?, size = ? WHERE id = ?");
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, categoryId);
            preparedStatement.setString(3, description);
            preparedStatement.setDouble(4, price);
            preparedStatement.setInt(5, quantity);
            preparedStatement.setString(6, size);
            preparedStatement.setInt(7, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("product-manage");
    }
}



