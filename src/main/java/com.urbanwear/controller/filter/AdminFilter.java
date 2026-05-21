package com.urbanwear.controller.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter({
        "/dashboard",
        "/admin/*"
})
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request =
                (HttpServletRequest) servletRequest;

        HttpServletResponse response =
                (HttpServletResponse) servletResponse;

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return;
        }

        String role =
                (String) session.getAttribute("role");

        if (role == null ||
                !role.equalsIgnoreCase("admin")) {

            response.sendRedirect(
                    request.getContextPath() + "/home"
            );

            return;
        }

        chain.doFilter(servletRequest, servletResponse);
    }
}