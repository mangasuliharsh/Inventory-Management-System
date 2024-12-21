<%@ page import="java.util.List" %>
<%@ page import="com.example.Supplier" %>
<%@ page import="com.example.SupplierDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Suppliers</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="wrapper d-flex">
        <%@ include file="sidebar.jsp" %>

        <div id="content" class="p-4">
            <h2 class="text-center mb-4">List of Suppliers</h2>
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>Supplier ID</th>
                        <th>Name</th>
                        <th>Contact Number</th>
                        <th>Contact Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        SupplierDAO supplierDAO = new SupplierDAO();
                        List<Supplier> suppliers = supplierDAO.getAllSuppliers();
                        for (Supplier supplier : suppliers) {
                    %>
                    <tr>
                        <td><%= supplier.getSupplierID() %></td>
                        <td><%= supplier.getSupplierName() %></td>
                        <td><%= supplier.getContactNumber() %></td>
                        <td><%= supplier.getContactEmail() %></td>
                        <td>
                            <a class="btn btn-primary btn-sm" href="updateSupplier.jsp?supplierID=<%= supplier.getSupplierID() %>">Update</a>
                            <a class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this supplier?');" href="deleteSupplier.jsp?supplierID=<%= supplier.getSupplierID() %> ">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <a class="btn btn-success" href="addSupplier.jsp">Add Supplier</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
