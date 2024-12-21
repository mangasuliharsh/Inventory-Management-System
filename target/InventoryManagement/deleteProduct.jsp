<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
    <h2>Delete Product</h2>
    <% 
        int productId = Integer.parseInt(request.getParameter("productId"));
        
        ProductDAO productDAO = new ProductDAO();
            productDAO.deleteProduct(productId);
            response.sendRedirect("listProduct.jsp"); 
            out.println("Product deleted successfully.");
    %>
</body>
</html>
