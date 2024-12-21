<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.OrderDetailsDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete OrderDetails</title>
</head>
<body>
    <h2>Delete OrderDetails</h2>
    <% 
        int orderDetailsID = Integer.parseInt(request.getParameter("orderDetailsID"));

        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
            orderDetailsDAO.deleteOrderDetails(orderDetailsID);
            response.sendRedirect("listOrderDetails.jsp"); // Redirect to listOrderDetails.jsp after deletion
            out.println("OrderDetails deleted successfully.");
    %>
</body>
</html>
