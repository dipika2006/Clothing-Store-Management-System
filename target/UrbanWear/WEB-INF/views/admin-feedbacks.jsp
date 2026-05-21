<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>Feedbacks | UrbanWear</title>
</head>

<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="admin-page">
    <div class="container">

        <div class="admin-hero">
            <p class="admin-subtitle">Customer Feedback</p>
            <h1>Feedback List</h1>
            <p>View messages and ratings submitted by UrbanWear customers.</p>
        </div>

        <div class="feedback-table-box">

            <div class="table-scroll">

                <table class="feedback-table">

                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer</th>
                        <th>Email</th>
                        <th>Rating</th>
                        <th>Message</th>
                        <th>Date</th>
                    </tr>
                    </thead>

                    <tbody>

                    <c:choose>

                        <c:when test="${not empty feedbacks}">

                            <c:forEach var="f" items="${feedbacks}">

                                <tr>
                                    <td>#${f.feedbackId}</td>
                                    <td>${f.name}</td>
                                    <td>${f.email}</td>

                                    <td>
                                <span class="rating-star">
                                    ${f.rating} ⭐
                                </span>
                                    </td>

                                    <td class="feedback-message">
                                            ${f.message}
                                    </td>

                                    <td>${f.createdAt}</td>
                                </tr>

                            </c:forEach>

                        </c:when>

                        <c:otherwise>

                            <tr>
                                <td colspan="6" class="empty-message">
                                    No feedbacks found.
                                </td>
                            </tr>

                        </c:otherwise>

                    </c:choose>

                    </tbody>

                </table>

            </div>

        </div>

    </div>
</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>