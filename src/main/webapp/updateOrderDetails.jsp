<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.example.OrderDetails" %>
<%@ page import="com.example.OrderDetailsDAO" %>
<%@ page import="com.example.ProductDAO" %>
<%@ page import="com.example.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
    ProductDAO productDAO = new ProductDAO();

    if (request.getMethod().equalsIgnoreCase("POST")) {
        int orderDetailsID = Integer.parseInt(request.getParameter("orderDetailsID"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String orderDateString = request.getParameter("orderDate");
        String orderStatus = request.getParameter("orderStatus");

        Date orderDate = Date.valueOf(orderDateString); // Convert String to Date

        OrderDetails orderDetails = new OrderDetails();
        orderDetails.setOrderDetailsID(orderDetailsID);
        orderDetails.setProductID(productID);
        orderDetails.setQuantity(quantity);
        orderDetails.setOrderDate(orderDate);
        orderDetails.setOrderStatus(orderStatus);

        orderDetailsDAO.updateOrderDetails(orderDetails);
        response.sendRedirect("listOrderDetails.jsp"); // Redirect after update
    } else {
        // Retrieve orderDetails to display in the form
        int orderDetailsID = Integer.parseInt(request.getParameter("orderDetailsID"));
        OrderDetails orderDetails = orderDetailsDAO.getOrderDetails(orderDetailsID);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Order Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
            max-width: 600px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
            <div class="container">
                <h2>Update Order Details</h2>
                <form method="post">
                    <input type="hidden" name="orderDetailsID" value="<%= orderDetails.getOrderDetailsID() %>" />
                    <div class="form-group">
                        <label for="productID">Product:</label>
                        <select name="productID" class="form-control" required>
                            <% 
                                List<Product> products = productDAO.getAllProducts();
                                for (Product product : products) {
                            %>
                            <option value="<%= product.getProductId() %>" <%= product.getProductId() == orderDetails.getProductID() ? "selected" : "" %>><%= product.getName() %></option>
                            <% 
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" name="quantity" value="<%= orderDetails.getQuantity() %>" required />
                    </div>
                    <div class="form-group">
                        <label for="orderDate">Order Date:</label>
                        <input type="date" class="form-control" name="orderDate" value="<%= orderDetails.getOrderDate() %>" required />
                    </div>
                    <div class="form-group">
                        <label for="orderStatus">Order Status:</label>
                        <input type="text" class="form-control" name="orderStatus" value="<%= orderDetails.getOrderStatus() %>" required />
                    </div>
                    <input type="submit" class="btn btn-primary" value="Update Order Details" />
                </form>
                <a href="listOrderDetails.jsp" class="btn btn-secondary mt-2">Back to Order Details</a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
<%
    }
%>
