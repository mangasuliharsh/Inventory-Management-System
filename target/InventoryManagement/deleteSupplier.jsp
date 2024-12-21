<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.SupplierDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Supplier</title>
</head>
<body>
    <h2>Delete Supplier</h2>
    <% 
        int supplierID = Integer.parseInt(request.getParameter("supplierID"));

        SupplierDAO supplierDAO = new SupplierDAO();
            supplierDAO.deleteSupplier(supplierID);
            response.sendRedirect("listSupplier.jsp"); // Redirect to listSupplier.jsp after deletion
            out.println("Supplier deleted successfully.");
    %>
</body>
</html>
