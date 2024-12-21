<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.DBUtil" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.ProductDAO" %>
<%@ page import="com.example.CategoryDAO" %>
<%@ page import="com.example.SupplierDAO" %>
<%@ page import="com.example.Category" %>
<%@ page import="com.example.Supplier" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<% 
    if (request.getMethod().equalsIgnoreCase("POST")) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String productDesc = request.getParameter("desc");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        int catId = Integer.parseInt(request.getParameter("catId"));
        int supId = Integer.parseInt(request.getParameter("supId"));

        Product product = new Product();
        product.setProductId(productId);
        product.setName(productName);
        product.setDescription(productDesc);
        product.setPrice(productPrice);
        product.setStockQuantity(stock);
        product.setCategoryId(catId);
        product.setSupplierId(supId);

        ProductDAO productDAO = new ProductDAO();
        productDAO.updateProduct(product);
        response.sendRedirect("listProduct.jsp"); // Redirect to listProduct.jsp after update
    } else {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProduct(productId);
        CategoryDAO categoryDAO = new CategoryDAO();
        SupplierDAO supplierDAO = new SupplierDAO();
        List<Category> categories = categoryDAO.getAllCategories();
        List<Supplier> suppliers = supplierDAO.getAllSuppliers();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 600px;
            margin: 30px auto;
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
                <h2>Update Product</h2>
                <form method="post">
                    <div class="form-group">
                        <label>Product ID:</label>
                        <input type="text" class="form-control" name="productId" value="<%= product.getProductId() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label>Product Name:</label>
                        <input type="text" class="form-control" name="productName" value="<%= product.getName() %>" required />
                    </div>
                    <div class="form-group">
                        <label>Product Description:</label>
                        <input type="text" class="form-control" name="desc" value="<%= product.getDescription() %>" required />
                    </div>
                    <div class="form-group">
                        <label>Product Price:</label>
                        <input type="text" class="form-control" name="productPrice" value="<%= product.getPrice() %>" required />
                    </div>
                    <div class="form-group">
                        <label>Product Stock:</label>
                        <input type="text" class="form-control" name="stock" value="<%= product.getStockQuantity() %>" required />
                    </div>
                    <div class="form-group">
                        <label>Category:</label>
                        <select class="form-control" name="catId" required>
                            <% for (Category category : categories) { %>
                                <option value="<%= category.getCategoryID() %>" <%= product.getCategoryId() == category.getCategoryID() ? "selected" : "" %>><%= category.getCategoryName() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Supplier:</label>
                        <select class="form-control" name="supId" required>
                            <% for (Supplier supplier : suppliers) { %>
                                <option value="<%= supplier.getSupplierID() %>" <%= product.getSupplierId() == supplier.getSupplierID() ? "selected" : "" %>><%= supplier.getSupplierName() %></option>
                            <% } %>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg">Update Product</button>
                    <a class="btn btn-secondary btn-lg" href="listProduct.jsp">Back to Products</a>
                </form>
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
