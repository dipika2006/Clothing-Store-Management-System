package com.urbanwear.controller;

import com.urbanwear.dao.ProductDao;
import com.urbanwear.dao.ProductDaoImpl;
import com.urbanwear.entity.CartItem;
import com.urbanwear.entity.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private final ProductDao productDao = new ProductDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");
        String size = request.getParameter("size");
        String color = request.getParameter("color");

        if (action != null && idParam != null) {

            int productId = Integer.parseInt(idParam);

            if (size == null || size.isBlank()) {
                size = "Default";
            }

            if (color == null || color.isBlank()) {
                color = "Default";
            }

            handleCartAction(cart, action, productId, size, color);

            session.setAttribute("cart", cart);

            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        double total = 0;

        for (CartItem item : cart) {
            total += item.getSubtotal();
        }

        request.setAttribute("cartItems", cart);
        request.setAttribute("cartTotal", total);

        request.getRequestDispatcher("/WEB-INF/views/cart.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");

        String productIdParam = request.getParameter("productId");
        String quantityParam = request.getParameter("quantity");
        String size = request.getParameter("size");
        String color = request.getParameter("color");

        if (productIdParam == null || productIdParam.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        int productId = Integer.parseInt(productIdParam);

        int quantity = 1;

        if (quantityParam != null && !quantityParam.isBlank()) {
            quantity = Integer.parseInt(quantityParam);
        }

        if (size == null || size.isBlank()) {
            size = "Default";
        }

        if (color == null || color.isBlank()) {
            color = "Default";
        }

        Product product = productDao.getProductById(productId);

        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        HttpSession session = request.getSession();

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;

        for (CartItem item : cart) {

            if (item.getProduct().getProductId() == productId
                    && item.getSize().equalsIgnoreCase(size)
                    && item.getColor().equalsIgnoreCase(color)) {

                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }

        if (!found) {

            CartItem item = new CartItem();

            item.setProduct(product);
            item.setQuantity(quantity);
            item.setSize(size);
            item.setColor(color);

            cart.add(item);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    private void handleCartAction(List<CartItem> cart,
                                  String action,
                                  int productId,
                                  String size,
                                  String color) {

        Iterator<CartItem> iterator = cart.iterator();

        while (iterator.hasNext()) {

            CartItem item = iterator.next();

            boolean sameProduct =
                    item.getProduct().getProductId() == productId
                            && item.getSize().equalsIgnoreCase(size)
                            && item.getColor().equalsIgnoreCase(color);

            if (sameProduct) {

                switch (action) {

                    case "increase":
                        item.setQuantity(item.getQuantity() + 1);
                        break;

                    case "decrease":
                        if (item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1);
                        } else {
                            iterator.remove();
                        }
                        break;

                    case "remove":
                        iterator.remove();
                        break;
                }

                break;
            }
        }
    }
}