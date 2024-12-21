<%@ page import="java.util.List" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Products</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            margin: 20px auto;
            max-width: 90%;
        }
        .table {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            text-align: center;
            padding: 50px; /* Increased padding for more space */
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        .table th {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="wrapper d-flex">
        <%@ include file="sidebar.jsp" %>

        <div id="content" class="p-4">
            <h2>List of Products</h2>
            <div class="table-container">
                <table class="table table-bordered table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th>Product ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Stock Quantity</th>
                            <th>Category</th>
                            <th>Supplier</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            ProductDAO productDAO = new ProductDAO();
                            List<Product> products = productDAO.getAllProducts();
                            for (Product product : products) {
                        %>
                        <tr>
                            <td><%= product.getProductId() %></td>
                            <td><%= product.getName() %></td>
                            <td><%= product.getDescription() %></td>
                            <td><%= product.getPrice() %></td>
                            <td><%= product.getStockQuantity() %></td>
                            <td><%= product.getCategoryName() %></td>
                            <td><%= product.getSupplierName() %></td>
                            <td>
                                <a class="btn btn-primary btn-sm" href="updateProduct.jsp?productId=<%= product.getProductId() %>">Update</a>
                                <a class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');" href="deleteProduct.jsp?productId=<%= product.getProductId() %>">Delete</a>
                            </td>
                        </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <a class="btn btn-success" href="addProduct.jsp">Add New Product</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
