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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || name.isBlank()
                || email == null || email.isBlank()
                || password == null || password.isBlank()) {

            request.setAttribute("error", "Please fill all fields.");

            request.getRequestDispatcher("/WEB-INF/views/register.jsp")
                    .forward(request, response);
            return;
        }

        if (userDao.emailExists(email)) {
            request.setAttribute("error", "Email already exists.");

            request.getRequestDispatcher("/WEB-INF/views/register.jsp")
                    .forward(request, response);
            return;
        }

        User user = new User();

        user.setName(name.trim());
        user.setEmail(email.trim());
        user.setPassword(PasswordUtil.hashPassword(password));
        user.setRole("customer");

        boolean success = userDao.registerUser(user);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/login?registered=success");
        } else {
            request.setAttribute("error", "Registration failed.");

            request.getRequestDispatcher("/WEB-INF/views/register.jsp")
                    .forward(request, response);
        }
    }
}