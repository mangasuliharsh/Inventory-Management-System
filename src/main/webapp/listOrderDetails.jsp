<%@ page import="java.util.List" %>
<%@ page import="com.example.OrderDetails" %>
<%@ page import="com.example.OrderDetailsDAO" %>
<%@ page import="com.example.ProductDAO" %>
<%@ page import="com.example.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Order Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="wrapper d-flex">
        <%@ include file="sidebar.jsp" %>

        <div id="content" class="p-4">
            <h2>List of Order Details</h2>
            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>Order Details ID</th>
                        <th>Order Date</th>
                        <th>Order Status</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
                        ProductDAO productDAO = new ProductDAO();

                        List<OrderDetails> orderDetailsList = orderDetailsDAO.getAllOrderDetails();
                        for (OrderDetails orderDetails : orderDetailsList) {
                            Product product = productDAO.getProduct(orderDetails.getProductID());
                    %>
                    <tr>
                        <td><%= orderDetails.getOrderDetailsID() %></td>
                        <td><%= orderDetails.getOrderDate() %></td>
                        <td><%= orderDetails.getOrderStatus() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= orderDetails.getQuantity() %></td>
                        <td>
                            <a class="btn btn-primary btn-sm" href="updateOrderDetails.jsp?orderDetailsID=<%= orderDetails.getOrderDetailsID() %>">Update</a>
                            <a class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this order detail?');" href="deleteOrderDetails.jsp?orderDetailsID=<%= orderDetails.getOrderDetailsID() %>">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <br>
            <a class="btn btn-success" href="addOrderDetails.jsp">Add Order Details</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
