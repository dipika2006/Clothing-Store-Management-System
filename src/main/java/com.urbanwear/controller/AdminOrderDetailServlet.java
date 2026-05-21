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

@WebServlet({"/admin/order-detail", "/admin/order-details"})
public class AdminOrderDetailServlet extends HttpServlet {

    private final OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/admin/orders");
            return;
        }

        int orderId = Integer.parseInt(idParam);

        Order order = orderDao.getOrderById(orderId);
        List<OrderItem> orderItems = orderDao.getOrderItemsByOrderId(orderId);

        if (order == null) {
            response.sendRedirect(request.getContextPath() + "/admin/orders");
            return;
        }

        request.setAttribute("order", order);
        request.setAttribute("orderId", orderId);
        request.setAttribute("orderItems", orderItems);

        request.getRequestDispatcher("/WEB-INF/views/admin-order-details.jsp")
                .forward(request, response);
    }
}