package com.urbanwear.controller;

import com.urbanwear.dao.OrderDao;
import com.urbanwear.dao.OrderDaoImpl;
import com.urbanwear.entity.Order;
import com.urbanwear.entity.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/invoice", "/admin/report", "/admin/report-invoice"})
public class InvoiceServlet extends HttpServlet {

    private final OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isBlank()) {

            int orderId = Integer.parseInt(idParam);

            Order order = orderDao.getOrderById(orderId);
            List<OrderItem> orderItems = orderDao.getOrderItemsByOrderId(orderId);

            request.setAttribute("order", order);
            request.setAttribute("orderItems", orderItems);
            request.setAttribute("reportMode", false);

        } else {

            List<Order> orders = orderDao.getAllOrders();

            int totalOrders = orders.size();
            double totalRevenue = 0;

            for (Order order : orders) {
                if (!"Cancelled".equalsIgnoreCase(order.getStatus())) {
                    totalRevenue += order.getTotalAmount();
                }
            }

            request.setAttribute("orders", orders);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("totalRevenue", totalRevenue);
            request.setAttribute("reportMode", true);
        }

        request.getRequestDispatcher("/WEB-INF/views/invoice.jsp")
                .forward(request, response);
    }
}