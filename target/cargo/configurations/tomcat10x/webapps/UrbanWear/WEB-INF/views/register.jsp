<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>UrbanWear | Register</title>
</head>

<body class="auth-page">

<section class="auth-section">

    <div class="container">

        <div class="auth-wrapper">

            <div class="auth-left">

                <span class="auth-tag">
                    Join UrbanWear
                </span>

                <h1>
                    Create Your Account
                </h1>

                <p>
                    Start shopping premium fashion
                    with exclusive collections and offers.
                </p>

                <div class="auth-brand">
                    UrbanWear
                </div>

            </div>

            <div class="auth-card">

                <h2>Register</h2>

                <p class="auth-text">
                    Fill all details to continue.
                </p>

                <form action="${pageContext.request.contextPath}/register"
                      method="post"
                      class="auth-form">

                    <div class="input-group">

                        <i class="fas fa-user"></i>

                        <input type="text"
                               name="name"
                               placeholder="Full name"
                               required>

                    </div>

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

                        Create Account

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

                    Already have an account?

                    <a href="${pageContext.request.contextPath}/login">
                        Login
                    </a>

                </div>

            </div>

        </div>

    </div>

</section>

</body>
</html>