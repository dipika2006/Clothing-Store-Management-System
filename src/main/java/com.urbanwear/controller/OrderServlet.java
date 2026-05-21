package com.urbanwear.controller;

import com.urbanwear.dao.OrderDao;
import com.urbanwear.dao.OrderDaoImpl;
import com.urbanwear.entity.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

    private final OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("cancel".equals(action)) {
            String idParam = request.getParameter("id");

            if (idParam != null && !idParam.isBlank()) {
                int orderId = Integer.parseInt(idParam);
                orderDao.updateOrderStatus(orderId, "Cancelled");
            }

            response.sendRedirect(request.getContextPath() + "/orders");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        List<Order> orders = orderDao.getOrdersByUserId(userId);

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/WEB-INF/views/order-list.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("return".equals(action)) {

            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String reason = request.getParameter("reason");

            boolean success = orderDao.returnOrder(orderId, reason);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/orders?returnSuccess=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/orders?returnError=true");
            }

            return;
        }

        response.sendRedirect(request.getContextPath() + "/orders");
    }
}