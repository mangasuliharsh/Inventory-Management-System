package com.example;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addOrderDetails")
public class OrderDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Date orderDate = Date.valueOf(request.getParameter("orderDate"));
        String orderStatus = request.getParameter("orderStatus");

        OrderDetails orderDetails = new OrderDetails();
        orderDetails.setProductID(productID);
        orderDetails.setQuantity(quantity);
        orderDetails.setOrderDate(orderDate);
        orderDetails.setOrderStatus(orderStatus);

        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
        try {
            orderDetailsDAO.addOrderDetails(orderDetails);
            response.getWriter().println("OrderDetails added successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error adding OrderDetails: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addOrderDetails.jsp").forward(request, response);
    }
}
