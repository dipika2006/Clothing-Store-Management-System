<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>UrbanWear | Login</title>
</head>

<body class="auth-page">

<section class="auth-section">

    <div class="container">

        <div class="auth-wrapper">

            <div class="auth-left">

                <span class="auth-tag">
                    Welcome Back
                </span>

                <h1>
                    Sign in to UrbanWear
                </h1>

                <p>
                    Access your account, manage your cart,
                    and continue shopping premium fashion.
                </p>

                <div class="auth-brand">
                    UrbanWear
                </div>

            </div>

            <div class="auth-card">

                <h2>Login</h2>

                <p class="auth-text">
                    Enter your details to continue.
                </p>

                <c:if test="${param.error eq 'invalid'}">
                    <div class="auth-error">
                        Invalid email or password.
                    </div>
                </c:if>

                <c:if test="${param.error eq 'empty'}">
                    <div class="auth-error">
                        Please fill all fields.
                    </div>
                </c:if>

                <c:if test="${param.success eq 'registered'}">
                    <div class="auth-success">
                        Registration successful. Please login.
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login"
                      method="post"
                      class="auth-form">

                    <div class="input-group">

                        <i class="fas fa-envelope"></i>

                        <input type="email"
                               name="email"
                               placeholder="Email address"
                               required>

                    </div>

                    <div class="input-group">

                        <i class="fas fa-lock"></i>

                        <input type="password"
                               name="password"
                               placeholder="Password"
                               required>

                    </div>

                    <button type="submit"
                            class="primary-btn auth-btn">

                        Login

                    </button>

                </form>

                <div class="social-login">

                    <p>Or continue with</p>

                    <div class="social-buttons">

                        <button type="button" class="social-btn google">
                            <i class="fab fa-google"></i>
                            Google
                        </button>

                        <button type="button" class="social-btn facebook">
                            <i class="fab fa-facebook-f"></i>
                            Facebook
                        </button>

                    </div>

                </div>

                <div class="auth-bottom">

                    Don’t have an account?

                    <a href="${pageContext.request.contextPath}/register">
                        Register
                    </a>

                </div>

            </div>

        </div>

    </div>

</section>

</body>
</html>