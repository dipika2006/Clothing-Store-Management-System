package com.urbanwear.controller;

import com.urbanwear.dao.FeedbackDao;
import com.urbanwear.dao.FeedbackDaoImpl;
import com.urbanwear.entity.Feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    private final FeedbackDao feedbackDao = new FeedbackDaoImpl();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);

        int userId = 0;

        if (session != null && session.getAttribute("userId") != null) {
            userId = (int) session.getAttribute("userId");
        }

        Feedback feedback = new Feedback();

        feedback.setUserId(userId);
        feedback.setName(request.getParameter("name"));
        feedback.setEmail(request.getParameter("email"));
        feedback.setRating(Integer.parseInt(request.getParameter("rating")));
        feedback.setMessage(request.getParameter("message"));

        feedbackDao.addFeedback(feedback);

        response.sendRedirect(request.getContextPath() + "/contact?success=feedback");
    }
}