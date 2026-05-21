package com.urbanwear.dao;

import com.urbanwear.entity.CartItem;
import com.urbanwear.entity.Order;
import com.urbanwear.entity.OrderItem;
import com.urbanwear.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {

    @Override
    public boolean placeOrder(Order order,
                              List<CartItem> cartItems) {

        String orderSql =
                "INSERT INTO orders(user_id, total_amount, status) " +
                        "VALUES (?, ?, ?)";

        String itemSql =
                "INSERT INTO orderitems(order_id, product_id, quantity, price, size, color) " +
                        "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection()) {

            conn.setAutoCommit(false);

            try (PreparedStatement orderPs =
                         conn.prepareStatement(
                                 orderSql,
                                 Statement.RETURN_GENERATED_KEYS
                         )) {

                orderPs.setInt(1, order.getUserId());
                orderPs.setDouble(2, order.getTotalAmount());

                orderPs.setString(
                        3,
                        order.getStatus() == null
                                ? "Pending"
                                : order.getStatus()
                );

                int affectedRows = orderPs.executeUpdate();

                if (affectedRows == 0) {
                    conn.rollback();
                    return false;
                }

                try (ResultSet keys =
                             orderPs.getGeneratedKeys()) {

                    if (keys.next()) {

                        int orderId = keys.getInt(1);

                        try (PreparedStatement itemPs =
                                     conn.prepareStatement(itemSql)) {

                            for (CartItem item : cartItems) {

                                itemPs.setInt(1, orderId);

                                itemPs.setInt(
                                        2,
                                        item.getProduct().getProductId()
                                );

                                itemPs.setInt(
                                        3,
                                        item.getQuantity()
                                );

                                itemPs.setDouble(
                                        4,
                                        item.getProduct().getFinalPrice()
                                );

                                itemPs.setString(
                                        5,
                                        item.getSize()
                                );

                                itemPs.setString(
                                        6,
                                        "Default"
                                );

                                itemPs.addBatch();
                            }

                            itemPs.executeBatch();
                        }

                    } else {
                        conn.rollback();
                        return false;
                    }
                }

                conn.commit();
                return true;

            } catch (Exception e) {

                conn.rollback();
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean createOrder(Order order,
                               List<OrderItem> orderItems) {

        String orderSql =
                "INSERT INTO orders(user_id, total_amount, status) " +
                        "VALUES (?, ?, ?)";

        String itemSql =
                "INSERT INTO orderitems(order_id, product_id, quantity, price, size, color) " +
                        "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection()) {

            conn.setAutoCommit(false);

            try (PreparedStatement orderPs =
                         conn.prepareStatement(
                                 orderSql,
                                 Statement.RETURN_GENERATED_KEYS
                         )) {

                orderPs.setInt(1, order.getUserId());
                orderPs.setDouble(2, order.getTotalAmount());

                orderPs.setString(
                        3,
                        order.getStatus() == null
                                ? "Pending"
                                : order.getStatus()
                );

                int affectedRows = orderPs.executeUpdate();

                if (affectedRows == 0) {
                    conn.rollback();
                    return false;
                }

                try (ResultSet keys =
                             orderPs.getGeneratedKeys()) {

                    if (keys.next()) {

                        int orderId = keys.getInt(1);

                        try (PreparedStatement itemPs =
                                     conn.prepareStatement(itemSql)) {

                            for (OrderItem item : orderItems) {

                                itemPs.setInt(1, orderId);
                                itemPs.setInt(2, item.getProductId());
                                itemPs.setInt(3, item.getQuantity());
                                itemPs.setDouble(4, item.getPrice());
                                itemPs.setString(5, item.getSize());
                                itemPs.setString(6, item.getColor());

                                itemPs.addBatch();
                            }

                            itemPs.executeBatch();
                        }

                    } else {
                        conn.rollback();
                        return false;
                    }
                }

                conn.commit();
                return true;

            } catch (Exception e) {

                conn.rollback();
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        String sql =
                "SELECT * FROM orders " +
                        "WHERE user_id = ? " +
                        "ORDER BY order_id DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    orders.add(mapOrder(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        String sql =
                "SELECT * FROM orders ORDER BY order_id DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                orders.add(mapOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public Order getOrderById(int orderId) {

        String sql =
                "SELECT * FROM orders WHERE order_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return mapOrder(rs);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        String sql =
                "SELECT * FROM orderitems WHERE order_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    OrderItem item = new OrderItem();

                    item.setOrderItemId(
                            rs.getInt("order_item_id")
                    );

                    item.setOrderId(
                            rs.getInt("order_id")
                    );

                    item.setProductId(
                            rs.getInt("product_id")
                    );

                    item.setQuantity(
                            rs.getInt("quantity")
                    );

                    item.setPrice(
                            rs.getDouble("price")
                    );

                    item.setSize(
                            rs.getString("size")
                    );

                    item.setColor(
                            rs.getString("color")
                    );

                    items.add(item);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }

    @Override
    public boolean updateOrderStatus(int orderId,
                                     String status) {

        String sql =
                "UPDATE orders SET status = ? " +
                        "WHERE order_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, orderId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean returnOrder(int orderId,
                               String reason) {

        String sql =
                "UPDATE orders " +
                        "SET status = 'Returned', " +
                        "return_reason = ?, " +
                        "returned_at = NOW() " +
                        "WHERE order_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, reason);
            ps.setInt(2, orderId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public int countOrders() {

        String sql =
                "SELECT COUNT(*) FROM orders";

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

    private Order mapOrder(ResultSet rs)
            throws SQLException {

        Order order = new Order();

        order.setOrderId(
                rs.getInt("order_id")
        );

        order.setUserId(
                rs.getInt("user_id")
        );

        order.setOrderDate(
                rs.getString("order_date")
        );

        order.setTotalAmount(
                rs.getDouble("total_amount")
        );

        order.setStatus(
                rs.getString("status")
        );

        try {

            order.setReturnReason(
                    rs.getString("return_reason")
            );

        } catch (Exception ignored) {}

        try {

            order.setReturnedAt(
                    rs.getString("returned_at")
            );

        } catch (Exception ignored) {}

        return order;
    }
}