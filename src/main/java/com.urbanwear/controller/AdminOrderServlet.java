package com.urbanwear.controller;

import com.urbanwear.dao.OrderDao;
import com.urbanwear.dao.OrderDaoImpl;
import com.urbanwear.entity.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    private final OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");
        String status = request.getParameter("status");

        if ("update".equals(action) && idParam != null && status != null) {

            int orderId = Integer.parseInt(idParam);

            orderDao.updateOrderStatus(orderId, status);

            response.sendRedirect(request.getContextPath() + "/admin/orders");
            return;
        }

        List<Order> orders = orderDao.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/WEB-INF/views/admin-orders.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String orderIdParam = request.getParameter("orderId");
        String status = request.getParameter("status");

        if (orderIdParam != null && status != null) {

            int orderId = Integer.parseInt(orderIdParam);

            orderDao.updateOrderStatus(orderId, status);
        }

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}