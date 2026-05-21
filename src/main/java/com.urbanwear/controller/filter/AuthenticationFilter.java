package com.urbanwear.controller.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter({
        "/cart",
        "/checkout",
        "/orders",
        "/dashboard",
        "/admin/*"
})
public class AuthenticationFilter implements Filter {

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

        String role = null;

        if (session != null) {
            role = (String) session.getAttribute("role");
        }

        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();

        boolean loggedIn = role != null;

        if (!loggedIn) {
            response.sendRedirect(contextPath + "/login");
            return;
        }

        boolean adminUrl =
                uri.contains(contextPath + "/admin")
                        || uri.endsWith(contextPath + "/dashboard");

        if (adminUrl && !"admin".equalsIgnoreCase(role)) {
            response.sendRedirect(contextPath + "/home");
            return;
        }

        chain.doFilter(request, response);
    }
}