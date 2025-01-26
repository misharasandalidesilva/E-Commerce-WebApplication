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

@WebServlet(name = "RegistrationServlet", value = "/registration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("dataSource");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String comfirmPassword = req.getParameter("confirmPassword");
        String role = "Customer";

        System.out.println("name: " + name + " email: " + email + " password: " + password + " comfirmPassword: " + comfirmPassword);

        if (password.equals(comfirmPassword)) {
            System.out.println("try ekata awa");
            try {
                Connection connection = ds.getConnection();
                PreparedStatement statement = connection.prepareStatement("INSERT INTO users (name,email,password,role) VALUES (?,?,?,?)");
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setString(3, password);
                statement.setString(4, role);
                statement.executeUpdate();

                System.out.println("data set");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            resp.sendRedirect("LoginForm.jsp");
        } else {
            resp.sendRedirect("registration.jsp?error=passwordMismatch");
        }
    }
}
