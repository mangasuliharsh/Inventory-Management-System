<%@ page import="java.util.List" %>
<%@ page import="com.example.ProductDAO" %>
<%@ page import="com.example.SupplierDAO" %>
<%@ page import="com.example.CategoryDAO" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.Supplier" %>
<%@ page import="com.example.Category" %>
<%@ page import="com.example.OrderDetailsDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    HttpSession sessionn = request.getSession(false);
    String username = (sessionn != null) ? (String) sessionn.getAttribute("username") : null;

    if (username == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-bottom: 20px;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1, h2 {
            color: #343a40;
        }
        .quick-actions a {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="wrapper d-flex">
        <%@ include file="sidebar.jsp" %>

        <div id="content" class="p-4">
            <h1 class="text-center">Welcome to the Inventory Management System</h1>
            <div class="dashboard mt-4">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card text-white bg-primary text-center">
                            <div class="card-body">
                                <h5>Total Products</h5>
                                <h3>
                                    <%
                                        ProductDAO productDAO = new ProductDAO();
                                        out.println(productDAO.getProductCount());
                                    %>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-success text-center">
                            <div class="card-body">
                                <h5>Total Orders</h5>
                                <h3>
                                    <%
                                        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
                                        out.println(orderDetailsDAO.distinctCount());
                                    %>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-danger text-center">
                            <div class="card-body">
                                <h5>Total Suppliers</h5>
                                <h3>
                                    <%
                                        SupplierDAO supplierDAO = new SupplierDAO();
                                        out.println(supplierDAO.getSupplierCount());
                                    %>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-warning text-center">
                            <div class="card-body">
                                <h5>Total Categories</h5>
                                <h3>
                                    <%
                                        CategoryDAO categoryDAO = new CategoryDAO();
                                        out.println(categoryDAO.getCategoryCount());
                                    %>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <h2 class="mt-4">Stock Levels</h2>
            <div class="stock-levels">
                <table class="table table-bordered table-striped">
                    <thead class="thead-light">
                        <tr>
                            <th>Product Name</th>
                            <th>Stock Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Product> products = productDAO.getAllProducts();
                            for (Product product : products) {
                        %>
                        <tr>
                            <td><%= product.getName() %></td>
                            <td><%= product.getStockQuantity() %></td>
                        </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <div class="quick-actions mt-4">
                <h2>Quick Actions</h2>
                <div>
                    <a href="addProduct.jsp" class="btn btn-primary btn-lg">Add New Product</a>
                    <a href="addOrderDetails.jsp" class="btn btn-primary btn-lg">Add New Order</a>
                    <a href="listProduct.jsp" class="btn btn-secondary btn-lg">View Products</a>
                    <a href="listOrderDetails.jsp" class="btn btn-secondary btn-lg">View Orders</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
