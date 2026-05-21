package com.urbanwear.controller;

import com.urbanwear.dao.ProductDao;
import com.urbanwear.dao.ProductDaoImpl;
import com.urbanwear.entity.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private final ProductDao productDao = new ProductDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = productDao.getAllProducts();

        if (products.size() > 5) {
            products = products.subList(0, 5);
        }

        request.setAttribute("products", products);

        request.getRequestDispatcher(
                "/WEB-INF/views/home.jsp"
        ).forward(request, response);
    }
}