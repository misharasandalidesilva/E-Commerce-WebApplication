
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

@WebServlet(name = "CustomerViewProducts", value = "/productViewCustomer")
public class ProductsCustomerView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("start CustomerViewProducts");
        List<ProductDTO> products = new ArrayList<>();

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("dataSource");

        try {
            Connection connection = ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setCategoryId(resultSet.getInt("category_id"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(Double.parseDouble(resultSet.getString("price")));
                product.setQuantity(Integer.parseInt(resultSet.getString("quantity")));
                product.setSize(resultSet.getString("size"));
                products.add(product);
            }
            for (ProductDTO product : products) {
                System.out.println(product.getName()+ "  :   product Name");
            }
            connection.close();
            req.setAttribute("products", products);
            req.getRequestDispatcher("index.jsp").forward(req, resp);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
