package com.urbanwear.controller;

import com.urbanwear.dao.OrderDao;
import com.urbanwear.dao.OrderDaoImpl;
import com.urbanwear.dao.ProductDao;
import com.urbanwear.dao.ProductDaoImpl;
import com.urbanwear.dao.UserDao;
import com.urbanwear.dao.UserDaoImpl;
import com.urbanwear.entity.Order;
import com.urbanwear.entity.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private final ProductDao productDao = new ProductDaoImpl();
    private final OrderDao orderDao = new OrderDaoImpl();
    private final UserDao userDao = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = productDao.getAllProducts();
        List<Order> orders = orderDao.getAllOrders();

        double totalRevenue = 0;

        for (Order order : orders) {
            if (!"Cancelled".equalsIgnoreCase(order.getStatus())) {

                totalRevenue += order.getTotalAmount();
            }
        }

        request.setAttribute("totalProducts", products.size());
        request.setAttribute("totalOrders", orders.size());
        request.setAttribute("totalRevenue", totalRevenue);

        /*
           If your UserDao does not have countUsers(),
           replace this with a static value:
           request.setAttribute("totalUsers", 2);
        */
        request.setAttribute("totalUsers", userDao.countUsers());

        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp")
                .forward(request, response);
    }
}