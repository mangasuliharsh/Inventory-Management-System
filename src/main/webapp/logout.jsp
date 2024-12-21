<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession s = request.getSession(false);
    if (s != null) {
        s.invalidate();
    }
    response.sendRedirect("index.jsp");
%>
