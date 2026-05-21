package com.urbanwear.controller;

import com.urbanwear.entity.CartItem;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession oldSession = request.getSession(false);

        List<CartItem> cart = null;

        if (oldSession != null) {
            cart = (List<CartItem>) oldSession.getAttribute("cart");
            oldSession.invalidate();
        }

        HttpSession newSession = request.getSession(true);

        if (cart != null && !cart.isEmpty()) {
            newSession.setAttribute("cart", cart);
        }

        response.sendRedirect(request.getContextPath() + "/login");
    }
}