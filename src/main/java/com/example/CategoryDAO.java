package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
	public void addCategory(Category category) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DBUtil.getConnection();
            String query = "INSERT INTO category (categoryName) VALUES (?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, category.getCategoryName());
            stmt.executeUpdate();
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Category";
        try (Connection con = DBUtil.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setCategoryName(rs.getString("CategoryName"));
                categories.add(category);
            }
        }
        return categories;
    }

    public Category getCategory(int categoryID) throws SQLException {
        Category category = null;
        String query = "SELECT * FROM Category WHERE CategoryID = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, categoryID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    category = new Category();
                    category.setCategoryID(rs.getInt("CategoryID"));
                    category.setCategoryName(rs.getString("CategoryName"));
                }
            }
        }
        return category;
    }

    public void updateCategory(Category category) throws SQLException {
        String query = "UPDATE Category SET CategoryName = ? WHERE CategoryID = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, category.getCategoryName());
            pst.setInt(2, category.getCategoryID());
            pst.executeUpdate();
        }
    }

    public void deleteCategory(int categoryID) throws SQLException {
        String query = "DELETE FROM Category WHERE CategoryID = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, categoryID);
            pst.executeUpdate();
        }
    }
    
    public Category getCategoryById(int categoryID) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Category category = null;
        
        try {
            conn = DBUtil.getConnection();
            String query = "SELECT categoryID, categoryName FROM category WHERE categoryID = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, categoryID);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                category = new Category();
                category.setCategoryID(rs.getInt("categoryID"));
                category.setCategoryName(rs.getString("categoryName"));
            }
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
        
        return category;
    }
    public int getCategoryCount() {
        int count = 0;
        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM category");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
