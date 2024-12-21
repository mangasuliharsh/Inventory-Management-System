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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        .form-container {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: auto;
            width: 100%;
            max-width: 600px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="wrapper d-flex">
        <%@ include file="sidebar.jsp" %>

        <div id="content" class="p-4">
            <div class="container">
                <h2 class="text-center mb-4">Add Product</h2>
                <div class="form-container">
                    <form method="post" class="mt-3">
                        <div class="form-group">
                            <label for="productName">Product Name:</label>
                            <input type="text" class="form-control" name="productName" required />
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" class="form-control" name="description" required />
                        </div>
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="text" class="form-control" name="price" required />
                        </div>
                        <div class="form-group">
                            <label for="stockQuantity">Stock Quantity:</label>
                            <input type="text" class="form-control" name="stockQuantity" required />
                        </div>
                        <div class="form-group">
                            <label for="categoryId">Category:</label>
                            <select class="form-control" name="categoryId" required>
                                <%
                                    CategoryDAO categoryDAO = new CategoryDAO();
                                    List<Category> categories = categoryDAO.getAllCategories();
                                    for (Category category : categories) {
                                %>
                                <option value="<%= category.getCategoryID() %>"><%= category.getCategoryName() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="supplierId">Supplier:</label>
                            <select class="form-control" name="supplierId" required>
                                <%
                                    SupplierDAO supplierDAO = new SupplierDAO();
                                    List<Supplier> suppliers = supplierDAO.getAllSuppliers();
                                    for (Supplier supplier : suppliers) {
                                %>
                                <option value="<%= supplier.getSupplierID() %>"><%= supplier.getSupplierName() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <input type="submit" class="btn btn-primary btn-lg" value="Add Product" />
                        <a class="btn btn-secondary btn-lg" href="listProduct.jsp">Back to Products</a>
                    </form>
                </div>

                <% 
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    String productName = request.getParameter("productName");
                    String description = request.getParameter("description");
                    double price = Double.parseDouble(request.getParameter("price"));
                    int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
                    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                    int supplierId = Integer.parseInt(request.getParameter("supplierId"));

                    Product product = new Product();
                    product.setName(productName);
                    product.setDescription(description);
                    product.setPrice(price);
                    product.setStockQuantity(stockQuantity);
                    product.setCategoryId(categoryId);
                    product.setSupplierId(supplierId);

                    ProductDAO productDAO = new ProductDAO();
                    String resultMessage = productDAO.addProduct(product);
                    out.println("<div class='alert alert-success'>" + resultMessage + "</div>");
                } 
                %>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
