package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        
        // Perform authentication (this is just a simplified example)
        if ("user".equals(username) && "user@example.com".equals(email)) {
            User user = new User(username, email);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("listCategories.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
