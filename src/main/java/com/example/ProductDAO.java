package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public String addProduct(Product product) {
        String sql = "INSERT INTO Product (name, description, price, stockQuantity, categoryId, supplierId) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setInt(4, product.getStockQuantity());
            stmt.setInt(5, product.getCategoryId());
            stmt.setInt(6, product.getSupplierId());
            stmt.executeUpdate();
            return "Product added successfully.";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error adding product: " + e.getMessage();
        }
    }

    public Product getProduct(int productId) {
        String query = "SELECT p.*, c.categoryName, s.supplierName " +
                       "FROM Product p " +
                       "JOIN Category c ON p.categoryId = c.categoryId " +
                       "JOIN Supplier s ON p.supplierId = s.supplierId " +
                       "WHERE p.productId = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                    rs.getInt("productId"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("stockQuantity"),
                    rs.getInt("categoryId"),
                    rs.getString("categoryName"),
                    rs.getInt("supplierId"),
                    rs.getString("supplierName")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT p.productId, p.name, p.description, p.price, p.stockQuantity, " +
                       "p.categoryId, c.categoryName, p.supplierId, s.supplierName " +
                       "FROM Product p " +
                       "JOIN Category c ON p.categoryId = c.categoryId " +
                       "JOIN Supplier s ON p.supplierId = s.supplierId";
        try (Connection connection = DBUtil.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Product product = new Product(
                    rs.getInt("productId"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("stockQuantity"),
                    rs.getInt("categoryId"),
                    rs.getString("categoryName"),
                    rs.getInt("supplierId"),
                    rs.getString("supplierName")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public void updateProduct(Product product) {
        String query = "UPDATE Product SET name = ?, description = ?, price = ?, stockQuantity = ?, categoryId = ?, supplierId = ? WHERE productId = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getStockQuantity());
            ps.setInt(5, product.getCategoryId());
            ps.setInt(6, product.getSupplierId());
            ps.setInt(7, product.getProductId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int productId) {
        String query = "DELETE FROM Product WHERE productId = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int getProductCount() {
        int count = 0;
        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM product");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Product> getRecentProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM product ORDER BY created_at DESC LIMIT 1");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductID"));
                product.setName(rs.getString("ProductName"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
