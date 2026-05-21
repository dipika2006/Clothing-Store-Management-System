<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contact Us | UrbanWear</title>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
</head>

<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="page-hero">
    <div class="container">
        <span class="subtitle">UrbanWear Support</span>
        <h1>Contact Us</h1>
        <p class="page-hero-text">
            Have questions, feedback, or need support?
            Our team is always ready to help you.
        </p>
    </div>
</section>

<section class="contact-page">
    <div class="container">

        <div class="contact-modern-grid">

            <div class="contact-info-box">

                <span class="section-subtitle">Get In Touch</span>

                <h2>We’d Love To Hear From You</h2>

                <p>
                    Reach out to UrbanWear for support, product inquiries,
                    order help, or any feedback regarding our service.
                </p>

                <div class="contact-card">
                    <i class="fas fa-location-dot"></i>
                    <div>
                        <h4>Location</h4>
                        <p>Pokhara, Nepal</p>
                    </div>
                </div>

                <div class="contact-card">
                    <i class="fas fa-phone"></i>
                    <div>
                        <h4>Phone Number</h4>
                        <p>+977 9800000000</p>
                    </div>
                </div>

                <div class="contact-card">
                    <i class="fas fa-envelope"></i>
                    <div>
                        <h4>Email Address</h4>
                        <p>support@urbanwear.com</p>
                    </div>
                </div>

                <div class="contact-card">
                    <i class="fas fa-clock"></i>
                    <div>
                        <h4>Working Hours</h4>
                        <p>Sunday - Friday : 9 AM - 6 PM</p>
                    </div>
                </div>

            </div>

            <div class="contact-form-box">

                <span class="section-subtitle">Customer Feedback</span>

                <h2>Send Your Feedback</h2>

                <c:if test="${param.success eq 'feedback'}">
                    <div class="auth-success">
                        Thank you! Your feedback has been submitted successfully.
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/feedback"
                      method="post"
                      class="contact-form">

                    <div class="form-grid">

                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text"
                                   name="name"
                                   placeholder="Enter your full name"
                                   required>
                        </div>

                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email"
                                   name="email"
                                   placeholder="Enter your email"
                                   required>
                        </div>

                    </div>

                    <div class="form-group">
                        <label>Rating</label>

                        <select name="rating" required>
                            <option value="5">★★★★★ Excellent</option>
                            <option value="4">★★★★ Good</option>
                            <option value="3">★★★ Average</option>
                            <option value="2">★★ Poor</option>
                            <option value="1">★ Very Poor</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Feedback Message</label>

                        <textarea name="message"
                                  rows="6"
                                  placeholder="Write your feedback here..."
                                  required></textarea>
                    </div>

                    <button type="submit" class="primary-btn">
                        Submit Feedback
                    </button>

                </form>

            </div>

        </div>

    </div>
</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>