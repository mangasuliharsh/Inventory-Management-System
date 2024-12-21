<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.CategoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Category</title>
</head>
<body>
    <h2>Delete Category</h2>
    <% 
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        
        CategoryDAO categoryDAO = new CategoryDAO();
        try {
            categoryDAO.deleteCategory(categoryID);
            response.sendRedirect("listCategory.jsp"); 
            out.println("Category deleted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error deleting category: " + e.getMessage());
        }
    %>
</body>
</html>
