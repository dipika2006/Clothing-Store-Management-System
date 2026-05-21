package com.urbanwear.controller;

import com.urbanwear.dao.UserDao;
import com.urbanwear.dao.UserDaoImpl;
import com.urbanwear.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet("/profile")
@MultipartConfig
public class ProfileServlet extends HttpServlet {

    private final UserDao userDao = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        User user = userDao.getUserById(userId);

        request.setAttribute("user", user);

        request.getRequestDispatcher("/WEB-INF/views/profile.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        User oldUser = userDao.getUserById(userId);

        User user = new User();

        user.setUserId(userId);
        user.setName(request.getParameter("name"));
        user.setPhone(request.getParameter("phone"));
        user.setAddress(request.getParameter("address"));

        Part imagePart = request.getPart("profileImage");
        String fileName = imagePart != null ? imagePart.getSubmittedFileName() : null;

        if (fileName != null && !fileName.isBlank()) {

            String extension = "";

            int dotIndex = fileName.lastIndexOf(".");

            if (dotIndex >= 0) {
                extension = fileName.substring(dotIndex);
            }

            String newFileName =
                    "user_" + userId + "_" + System.currentTimeMillis() + extension;

            String imagePath =
                    "static/images/users/" + newFileName;

            String uploadPath =
                    getServletContext().getRealPath("")
                            + File.separator
                            + imagePath;

            File uploadDir =
                    new File(uploadPath).getParentFile();

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            imagePart.write(uploadPath);

            user.setProfileImage(imagePath);

        } else {

            if (oldUser != null) {
                user.setProfileImage(oldUser.getProfileImage());
            } else {
                user.setProfileImage("static/images/users/default-user.png");
            }
        }

        boolean success = userDao.updateProfile(user);

        if (success) {

            session.setAttribute("userName", user.getName());
            session.setAttribute("profileImage", user.getProfileImage());

            response.sendRedirect(
                    request.getContextPath() + "/profile?success=true"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath() + "/profile?error=true"
            );
        }
    }
}