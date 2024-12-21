<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.Supplier" %>
<%@ page import="com.example.SupplierDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Supplier supplier = null;

    if (request.getMethod().equalsIgnoreCase("POST")) {
        int supplierID = Integer.parseInt(request.getParameter("supplierID"));
        String supplierName = request.getParameter("supplierName");
        String contactNumber = request.getParameter("contactNumber");
        String contactEmail = request.getParameter("contactEmail");

        supplier = new Supplier();
        supplier.setSupplierID(supplierID);
        supplier.setSupplierName(supplierName);
        supplier.setContactNumber(contactNumber);
        supplier.setContactEmail(contactEmail);

        SupplierDAO supplierDAO = new SupplierDAO();
        supplierDAO.updateSupplier(supplier);
        response.sendRedirect("listSupplier.jsp");
    } else {
        int supplierID = Integer.parseInt(request.getParameter("supplierID"));
        SupplierDAO supplierDAO = new SupplierDAO();
        supplier = supplierDAO.getSupplier(supplierID);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Supplier</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
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
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group input[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="wrapper d-flex">
        <%@ include file="sidebar.jsp" %>

        <div id="content" class="p-4">
            <h2 class="text-center mb-4">Update Supplier</h2>
            <div class="form-container">
                <form method="post" class="mt-3">
                    <div class="form-group">
                        <label>Supplier ID:</label>
                        <input type="text" class="form-control" name="supplierID" value="<%= supplier.getSupplierID() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="supplierName">Supplier Name:</label>
                        <input type="text" class="form-control" name="supplierName" value="<%= supplier.getSupplierName() %>" required />
                    </div>
                    <div class="form-group">
                        <label for="contactNumber">Contact Number:</label>
                        <input type="text" class="form-control" name="contactNumber" value="<%= supplier.getContactNumber() %>" required />
                    </div>
                    <div class="form-group">
                        <label for="contactEmail">Contact Email:</label>
                        <input type="email" class="form-control" name="contactEmail" value="<%= supplier.getContactEmail() %>" required />
                    </div>
                    <input type="submit" class="btn btn-primary btn-lg" value="Update Supplier" />
                    <a class="btn btn-secondary btn-lg" href="listSupplier.jsp">Back to Suppliers</a>
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
