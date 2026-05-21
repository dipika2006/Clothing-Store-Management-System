package com.urbanwear.dao;

import com.urbanwear.entity.CartItem;
import com.urbanwear.entity.Order;
import com.urbanwear.entity.OrderItem;

import java.util.List;

public interface OrderDao {

    boolean placeOrder(Order order,
                       List<CartItem> cartItems);

    boolean createOrder(Order order,
                        List<OrderItem> orderItems);

    List<Order> getOrdersByUserId(int userId);

    List<Order> getAllOrders();

    Order getOrderById(int orderId);

    List<OrderItem> getOrderItemsByOrderId(int orderId);

    boolean updateOrderStatus(int orderId,
                              String status);

    boolean returnOrder(int orderId,
                        String reason);

    int countOrders();
}