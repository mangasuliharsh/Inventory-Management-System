<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.OrderDetails" %>
<%@ page import="com.example.OrderDetailsDAO" %>
<%@ page import="com.example.ProductDAO" %>
<%@ page import="com.example.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    
    ProductDAO productDAO = new ProductDAO();

    if (request.getMethod().equalsIgnoreCase("POST")) {
        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        java.sql.Date orderDate = java.sql.Date.valueOf(request.getParameter("orderDate"));
        String orderStatus = request.getParameter("orderStatus");

        OrderDetails orderDetails = new OrderDetails();
        orderDetails.setProductID(productID);
        orderDetails.setQuantity(quantity);
        orderDetails.setOrderDate(orderDate);
        orderDetails.setOrderStatus(orderStatus);

        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
        orderDetailsDAO.addOrderDetails(orderDetails);
        response.sendRedirect("listOrderDetails.jsp"); // Redirect after adding
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Order Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
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
            <div class="form-container">
                <h2>Add Order Details</h2>
                <form method="post">
                    <div class="form-group">
                        <label for="productID">Product:</label>
                        <select name="productID" class="form-control" required>
                            <%
                                List<Product> products = productDAO.getAllProducts();
                                for (Product product : products) {
                            %>
                            <option value="<%= product.getProductId() %>"><%= product.getName() %></option>
                            <% 
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" name="quantity" required />
                    </div>
                    <div class="form-group">
                        <label for="orderDate">Order Date:</label>
                        <input type="date" class="form-control" name="orderDate" required />
                    </div>
                    <div class="form-group">
                        <label for="orderStatus">Order Status:</label>
                        <input type="text" class="form-control" name="orderStatus" required />
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg">Add Order Details</button>
                    <a class="btn btn-secondary btn-lg" href="listOrderDetails.jsp">Back to Order Details</a>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
