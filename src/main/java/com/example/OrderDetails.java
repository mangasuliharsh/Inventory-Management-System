package com.example;

import java.sql.Date;

public class OrderDetails {
    private int orderDetailsID;
    private int productID;
    private int quantity;
    private Date orderDate;
    private String orderStatus;

    public OrderDetails() {}

    public OrderDetails(int orderDetailsID, int productID, int quantity, Date orderDate, String orderStatus) {
        this.orderDetailsID = orderDetailsID;
        this.productID = productID;
        this.quantity = quantity;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
    }

    // Getters and Setters
    public int getOrderDetailsID() {
        return orderDetailsID;
    }

    public void setOrderDetailsID(int orderDetailsID) {
        this.orderDetailsID = orderDetailsID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
}
