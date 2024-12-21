<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.Category" %>
<%@ page import="com.example.CategoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String categoryName = request.getParameter("categoryName");
        
        Category category = new Category();
        category.setCategoryID(categoryID);
        category.setCategoryName(categoryName);
        
        CategoryDAO categoryDAO = new CategoryDAO();
        try {
            categoryDAO.updateCategory(category);
            response.sendRedirect("listCategory.jsp"); // Redirect to listCategories.jsp after update
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger'>Error updating category: " + e.getMessage() + "</div>");
        }
    } else {
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        
        CategoryDAO categoryDAO = new CategoryDAO();
        try {
            Category category = categoryDAO.getCategoryById(categoryID);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Category</title>
    <!-- Bootstrap CSS -->
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
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="wrapper d-flex">
        <!-- Include Sidebar -->
        <%@ include file="sidebar.jsp" %>

        <div id="content" class="p-4">
            <div class="container mt-4">
                <h2 class="text-center mb-4">Update Category</h2>
                <div class="form-container">
                    <form method="post" class="mt-3">
                        <div class="form-group">
                            <label for="categoryID">Category ID:</label>
                            <input type="text" class="form-control" name="categoryID" value="<%= category.getCategoryID() %>" readonly />
                        </div>
                        <div class="form-group">
                            <label for="categoryName">Category Name:</label>
                            <input type="text" class="form-control" name="categoryName" value="<%= category.getCategoryName() %>" required />
                        </div>
                        <input type="submit" class="btn btn-primary btn-lg" value="Update Category" />
                        <a class="btn btn-secondary btn-lg" href="listCategories.jsp">Back to Categories</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
<%
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger'>Error retrieving category: " + e.getMessage() + "</div>");
        }
    }
%>
