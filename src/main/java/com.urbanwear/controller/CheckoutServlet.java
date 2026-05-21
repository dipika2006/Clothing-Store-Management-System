package com.urbanwear.controller;

import com.urbanwear.dao.OrderDao;
import com.urbanwear.dao.OrderDaoImpl;
import com.urbanwear.entity.CartItem;
import com.urbanwear.entity.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private final OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        double cartTotal = calculateTotal(cart);

        request.setAttribute("cartItems", cart);
        request.setAttribute("cartTotal", cartTotal);

        request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");

        double total = calculateTotal(cart);

        if (name == null || name.isBlank()
                || phone == null || phone.isBlank()
                || address == null || address.isBlank()) {

            request.setAttribute("error", "Please fill all checkout fields.");
            request.setAttribute("cartItems", cart);
            request.setAttribute("cartTotal", total);

            request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
                    .forward(request, response);
            return;
        }

        Order order = new Order();

        order.setUserId(userId);
        order.setTotalAmount(total);

        if ("Online Payment".equalsIgnoreCase(payment)) {
            order.setStatus("Pending Payment");
        } else {
            order.setStatus("Order Submitted");
        }

        boolean success = orderDao.placeOrder(order, cart);

        if (success) {
            session.removeAttribute("cart");
            response.sendRedirect(request.getContextPath() + "/orders");
        } else {
            request.setAttribute("error", "Order could not be placed.");
            request.setAttribute("cartItems", cart);
            request.setAttribute("cartTotal", total);

            request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
                    .forward(request, response);
        }
    }

    private double calculateTotal(List<CartItem> cart) {
        double total = 0;

        for (CartItem item : cart) {
            total += item.getSubtotal();
        }

        return total;
    }
}