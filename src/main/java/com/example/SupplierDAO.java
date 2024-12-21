package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO {
    public String addSupplier(Supplier supplier) {
        String sql = "INSERT INTO Supplier (SupplierName, ContactNumber, ContactEmail) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, supplier.getSupplierName());
            stmt.setString(2, supplier.getContactNumber());
            stmt.setString(3, supplier.getContactEmail());
            stmt.executeUpdate();
            return "Supplier added successfully.";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error adding supplier: " + e.getMessage();
        }
    }

    public Supplier getSupplier(int supplierID) {
        String query = "SELECT * FROM Supplier WHERE SupplierID = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, supplierID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Supplier(
                    rs.getInt("SupplierID"),
                    rs.getString("SupplierName"),
                    rs.getString("ContactNumber"),
                    rs.getString("ContactEmail")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Supplier> getAllSuppliers() {
        List<Supplier> suppliers = new ArrayList<>();
        String query = "SELECT * FROM Supplier";
        try (Connection connection = DBUtil.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                suppliers.add(new Supplier(
                    rs.getInt("SupplierID"),
                    rs.getString("SupplierName"),
                    rs.getString("ContactNumber"),
                    rs.getString("ContactEmail")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return suppliers;
    }

    public void updateSupplier(Supplier supplier) {
        String query = "UPDATE Supplier SET SupplierName = ?, ContactNumber = ?, ContactEmail = ? WHERE SupplierID = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, supplier.getSupplierName());
            ps.setString(2, supplier.getContactNumber());
            ps.setString(3, supplier.getContactEmail());
            ps.setInt(4, supplier.getSupplierID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSupplier(int supplierID) {
        String query = "DELETE FROM Supplier WHERE SupplierID = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, supplierID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int getSupplierCount() {
        int count = 0;
        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM supplier");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Supplier> getRecentSuppliers() {
        List<Supplier> suppliers = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM supplier ORDER BY created_at DESC LIMIT 5");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Supplier supplier = new Supplier();
                supplier.setSupplierID(rs.getInt("SupplierID"));
                supplier.setSupplierName(rs.getString("SupplierName"));
                suppliers.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return suppliers;
    }
}
