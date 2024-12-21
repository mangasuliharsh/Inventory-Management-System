<%@ page import="java.util.List" %>
<%@ page import="com.example.Category" %>
<%@ page import="com.example.CategoryDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Categories</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="wrapper d-flex">
        <!-- Include Sidebar -->
        <%@ include file="sidebar.jsp" %>

        <div id="content" class="p-4">
            <header>
                <h1>List Categories</h1>
            </header>
            <main>
                <table class="table table-bordered table-hover table-responsive-lg w-100">
                    <thead class="thead-light">
                        <tr>
                            <th>Category ID</th>
                            <th>Category Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            CategoryDAO categoryDAO = new CategoryDAO();
                            try {
                                List<Category> categories = categoryDAO.getAllCategories();
                                for (Category category : categories) {
                        %>
                        <tr>
                            <td><%= category.getCategoryID() %></td>
                            <td><%= category.getCategoryName() %></td>
                            <td>
                                <a class="btn btn-primary btn-sm" href="updateCategory.jsp?categoryID=<%= category.getCategoryID() %>">Update</a>
                                 <a class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this category?');" href="deleteCategory.jsp?categoryID=<%= category.getCategoryID() %>">Delete</a>
                            </td>
                        </tr>
                        <% 
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                        %>
                        <tr>
                            <td colspan="3" class="text-danger">Error retrieving categories: <%= e.getMessage() %></td>
                        </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
                <br>
                <a class="btn btn-success" href="addCategory.jsp">Insert</a>
            </main>
        </div>
    </div>

    <!-- jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Custom JS for Sidebar Toggle -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });

        function confirmDelete(categoryID) {
            if (confirm("Are you sure you want to delete this category?")) {
                window.location.href = "deleteCategory.jsp?categoryID=" + categoryID;
            }
        }
    </script>
</body>
</html>
