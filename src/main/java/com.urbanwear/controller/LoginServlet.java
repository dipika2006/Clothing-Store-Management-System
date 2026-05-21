package com.urbanwear.controller;

import com.urbanwear.dao.UserDao;
import com.urbanwear.dao.UserDaoImpl;
import com.urbanwear.entity.User;
import com.urbanwear.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserDao userDao = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.isBlank()
                || password == null || password.isBlank()) {

            response.sendRedirect(request.getContextPath() + "/login?error=empty");
            return;
        }

        User user = userDao.getUserByEmail(email);

        if (user == null || !PasswordUtil.checkPassword(password, user.getPassword())) {
            response.sendRedirect(request.getContextPath() + "/login?error=invalid");
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("userName", user.getName());
        session.setAttribute("role", user.getRole());

        if ("admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else {
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}