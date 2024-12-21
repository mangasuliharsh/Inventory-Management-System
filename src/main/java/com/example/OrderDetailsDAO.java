package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailsDAO {
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/InventoryDB", "root", "myadmin123");
    }

    public void addOrderDetails(OrderDetails orderDetails) throws SQLException {
        String sql = "INSERT INTO OrderDetails (productID, quantity, orderDate, orderStatus) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderDetails.getProductID());
            stmt.setInt(2, orderDetails.getQuantity());
            stmt.setDate(3, orderDetails.getOrderDate());
            stmt.setString(4, orderDetails.getOrderStatus());
            stmt.executeUpdate();
        }
    }

    public List<OrderDetails> getAllOrderDetails() throws SQLException {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        String sql = "SELECT * FROM OrderDetails";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setOrderDetailsID(rs.getInt("orderDetailsID"));
                orderDetails.setProductID(rs.getInt("productID"));
                orderDetails.setQuantity(rs.getInt("quantity"));
                orderDetails.setOrderDate(rs.getDate("orderDate"));
                orderDetails.setOrderStatus(rs.getString("orderStatus"));
                orderDetailsList.add(orderDetails);
            }
        }
        return orderDetailsList;
    }

    public OrderDetails getOrderDetails(int orderDetailsID) throws SQLException {
        OrderDetails orderDetails = null;
        String sql = "SELECT * FROM OrderDetails WHERE orderDetailsID = ?";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderDetailsID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                orderDetails = new OrderDetails();
                orderDetails.setOrderDetailsID(rs.getInt("orderDetailsID"));
                orderDetails.setProductID(rs.getInt("productID"));
                orderDetails.setQuantity(rs.getInt("quantity"));
                orderDetails.setOrderDate(rs.getDate("orderDate"));
                orderDetails.setOrderStatus(rs.getString("orderStatus"));
            }
        }
        return orderDetails;
    }

    public void updateOrderDetails(OrderDetails orderDetails) throws SQLException {
        String sql = "UPDATE OrderDetails SET productID = ?, quantity = ?, orderDate = ?, orderStatus = ? WHERE orderDetailsID = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderDetails.getProductID());
            stmt.setInt(2, orderDetails.getQuantity());
            stmt.setDate(3, orderDetails.getOrderDate());
            stmt.setString(4, orderDetails.getOrderStatus());
            stmt.setInt(5, orderDetails.getOrderDetailsID());
            stmt.executeUpdate();
        }
    }

    public void deleteOrderDetails(int orderDetailsID) throws SQLException {
        String sql = "DELETE FROM OrderDetails WHERE orderDetailsID = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderDetailsID);
            stmt.executeUpdate();
        }
    }

    // New method to count distinct product IDs
    public int distinctCount() throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT orderDetailsID) AS distinctCount FROM OrderDetails";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt("distinctCount");
            }
        }
        return count;
    }
}
