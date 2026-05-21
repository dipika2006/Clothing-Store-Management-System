package com.urbanwear.dao;

import java.util.List;
import java.util.Map;

public interface DashboardDao {

    int getTotalProducts();

    int getTotalOrders();

    int getTotalUsers();

    double getTotalRevenue();

    List<Map<String, Object>> getMonthlyRevenue();

    List<Map<String, Object>> getTopSellingProducts();

    List<Map<String, Object>> getOrderStatusStats();

    List<Map<String, Object>> getLowStockProducts();
}