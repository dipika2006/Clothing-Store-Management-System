package com.urbanwear.controller;

import com.urbanwear.dao.UserDao;
import com.urbanwear.dao.UserDaoImpl;
import com.urbanwear.entity.User;
import com.urbanwear.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final UserDao userDao = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || name.isBlank()
                || email == null || email.isBlank()
                || password == null || password.isBlank()) {

            response.sendRedirect(request.getContextPath() + "/register?error=invalid");
            return;
        }

        if (userDao.emailExists(email)) {
            response.sendRedirect(request.getContextPath() + "/register?error=exists");
            return;
        }

        User user = new User();
        user.setName(name.trim());
        user.setEmail(email.trim());
        user.setPassword(PasswordUtil.hashPassword(password));
        user.setRole("user");

        boolean registered = userDao.registerUser(user);

        if (registered) {
            response.sendRedirect(request.getContextPath() + "/login?success=registered");
        } else {
            response.sendRedirect(request.getContextPath() + "/register?error=invalid");
        }
    }
}