package com.example;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addProduct")
public class ProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int supplierId = Integer.parseInt(request.getParameter("supplierId"));

        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStockQuantity(stockQuantity);
        product.setCategoryId(categoryId);
        product.setSupplierId(supplierId);

        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.addProduct(product);
            response.getWriter().println("Product added successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding product: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }
}
