package org.example.ecommercewebapplication;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.ecommercewebapplication.DTO.ProductDTO;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 50    // 50 MB
)
@WebServlet(name = "ProductManageServlet", value = "/product-manage")
public class ProductManageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String cid = req.getParameter("categoryId");
        String description = req.getParameter("description");
        Double price = Double.valueOf(req.getParameter("price"));
        String quantity = req.getParameter("quantity");
        String size = req.getParameter("size");

        Part filePart = req.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        filePart.write(uploadPath + File.separator + fileName);

        System.out.println(name + " " + cid + " " + description + " " + price + " " + quantity + " " + size + " " + fileName);

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");
        try {
            Connection connection = ds.getConnection();
            String sql = "INSERT INTO products (name, category_id, description, price, quantity, size, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, name);
                preparedStatement.setInt(2, Integer.valueOf(cid));
                preparedStatement.setString(3, description);
                preparedStatement.setDouble(4, price);
                preparedStatement.setInt(5, Integer.parseInt(quantity));
                preparedStatement.setString(6, size);
                preparedStatement.setString(7, fileName);
                preparedStatement.executeUpdate();
                connection.close();

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("product-manage");
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> products = new ArrayList<>();

        ServletContext servletContext = getServletContext();
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

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
                product.setPrice(resultSet.getDouble("price"));
                product.setQuantity(Integer.parseInt(resultSet.getString("quantity")));
                product.setSize(resultSet.getString("size"));
                products.add(product);
            }
            connection.close();

            req.setAttribute("products", products);
            req.getRequestDispatcher("ProductManage.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
