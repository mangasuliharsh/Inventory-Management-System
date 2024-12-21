package com.example;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.Category;
import com.example.CategoryDAO;

@WebServlet("/addCategory")
public class CategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String categoryName = request.getParameter("categoryName");
        Category category = new Category();
        category.setCategoryID(categoryID);
        category.setCategoryName(categoryName);

        CategoryDAO categoryDAO = new CategoryDAO();
        try {
            categoryDAO.addCategory(category);
            response.getWriter().println("Category added successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error adding category: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addCategory.jsp").forward(request, response);
    }
}

