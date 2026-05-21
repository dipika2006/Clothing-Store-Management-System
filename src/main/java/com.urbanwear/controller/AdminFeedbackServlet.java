package com.urbanwear.controller;

import com.urbanwear.dao.FeedbackDao;
import com.urbanwear.dao.FeedbackDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/feedbacks")
public class AdminFeedbackServlet extends HttpServlet {

    private final FeedbackDao feedbackDao = new FeedbackDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute(
                "feedbacks",
                feedbackDao.getAllFeedbacks()
        );

        request.getRequestDispatcher(
                "/WEB-INF/views/admin-feedbacks.jsp"
        ).forward(request, response);
    }
}