package com.example;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addSupplier")
public class SupplierServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String supplierName = request.getParameter("supplierName");
        String contactNumber = request.getParameter("contactNumber");
        String contactEmail = request.getParameter("contactEmail");

        Supplier supplier = new Supplier();
        supplier.setSupplierName(supplierName);
        supplier.setContactNumber(contactNumber);
        supplier.setContactEmail(contactEmail);

        SupplierDAO supplierDAO = new SupplierDAO();
        try {
            supplierDAO.addSupplier(supplier);
            response.getWriter().println("Supplier added successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding supplier: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addSupplier.jsp").forward(request, response);
    }
}
