<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.Category" %>
<%@ page import="com.example.CategoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        // Retrieve category details from form
        String categoryName = request.getParameter("categoryName");

        // Create a new Category object
        Category category = new Category();
        category.setCategoryName(categoryName);

        // Use CategoryDAO to add the category
        CategoryDAO categoryDAO = new CategoryDAO();
        try {
            categoryDAO.addCategory(category);
            out.println("<div class='alert alert-success'>Category added successfully.</div>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger'>Error adding category: " + e.getMessage() + "</div>");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
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
                <h2 class="text-center mb-4">Add Category</h2>
                <div class="form-container">
                    <form method="post" class="mt-3">
                        <div class="form-group">
                            <label for="categoryName">Category Name:</label>
                            <input type="text" class="form-control" name="categoryName" required />
                        </div>
                        <input type="submit" class="btn btn-primary btn-lg" value="Add Category" />
                        <a class="btn btn-secondary btn-lg" href="listCategory.jsp">Back to Categories</a>
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
