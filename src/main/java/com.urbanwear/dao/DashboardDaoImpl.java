package com.urbanwear.dao;

import com.urbanwear.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DashboardDaoImpl implements DashboardDao {

    @Override
    public int getTotalProducts() {
        return getCount("SELECT COUNT(*) FROM Products");
    }

    @Override
    public int getTotalOrders() {
        return getCount("SELECT COUNT(*) FROM Orders");
    }

    @Override
    public int getTotalUsers() {
        return getCount("SELECT COUNT(*) FROM Users WHERE role = 'customer'");
    }

    @Override
    public double getTotalRevenue() {
        String sql = "SELECT COALESCE(SUM(total_amount), 0) FROM Orders";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getDouble(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<Map<String, Object>> getMonthlyRevenue() {
        List<Map<String, Object>> list = new ArrayList<>();

        String sql = "SELECT DATE_FORMAT(order_date, '%b') AS month_name, " +
                "SUM(total_amount) AS total " +
                "FROM Orders " +
                "GROUP BY MONTH(order_date), DATE_FORMAT(order_date, '%b') " +
                "ORDER BY MONTH(order_date)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("key", rs.getString("month_name"));
                row.put("value", rs.getDouble("total"));
                list.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Map<String, Object>> getTopSellingProducts() {
        List<Map<String, Object>> list = new ArrayList<>();

        String sql = "SELECT p.name, SUM(oi.quantity) AS total_sold " +
                "FROM OrderItems oi " +
                "JOIN Products p ON oi.product_id = p.product_id " +
                "GROUP BY p.product_id, p.name " +
                "ORDER BY total_sold DESC " +
                "LIMIT 5";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("name", rs.getString("name"));
                row.put("total", rs.getInt("total_sold"));
                list.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Map<String, Object>> getOrderStatusStats() {
        List<Map<String, Object>> list = new ArrayList<>();

        String sql = "SELECT status, COUNT(*) AS total FROM Orders GROUP BY status";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("status", rs.getString("status"));
                row.put("total", rs.getInt("total"));
                list.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Map<String, Object>> getLowStockProducts() {
        List<Map<String, Object>> list = new ArrayList<>();

        String sql = "SELECT name, stock FROM Products WHERE stock <= 5 ORDER BY stock ASC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("name", rs.getString("name"));
                row.put("stock", rs.getInt("stock"));
                list.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    private int getCount(String sql) {
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}