<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <title>About Us | UrbanWear</title>

    <%@ include file="/WEB-INF/templates/head.jsp" %>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/css/about.css">

</head>

<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<!-- ================= HERO ================= -->

<section class="about-hero">

    <div class="container">

        <div class="about-hero-content">

            <p class="about-hero-tag">
                About UrbanWear
            </p>

            <h1>
                Where Fashion Meets Confidence
            </h1>

            <p>
                UrbanWear is a modern fashion clothing store created to make
                shopping simple, stylish, and enjoyable for everyone.
                Discover premium collections, smooth shopping experience,
                and modern fashion trends in one place.
            </p>

        </div>

    </div>

</section>

<!-- ================= MAIN ABOUT ================= -->

<section class="about-modern-section">

    <div class="container">

        <div class="about-modern-grid">

            <!-- IMAGE -->

            <div class="about-modern-image">

                <img src="${pageContext.request.contextPath}/static/images/women/women8.png"
                     alt="UrbanWear Fashion">

                <div class="about-floating-card">

                    <h3>40+</h3>

                    <p>
                        Premium Fashion Products
                    </p>

                </div>

            </div>

            <!-- CONTENT -->

            <div class="about-modern-content">

                <p class="about-tag">
                    Our Story
                </p>

                <h2>
                    Simple shopping for modern clothing.
                </h2>

                <p class="about-description">
                    UrbanWear is a clothing store management system designed
                    to make fashion shopping easier. Customers can browse
                    products, add items to cart, checkout, and manage their
                    orders with a modern shopping experience.
                </p>

                <p class="about-description">
                    Admins can manage products, categories, stock,
                    discounts, customer records, and orders from the
                    powerful admin dashboard efficiently.
                </p>

                <!-- FEATURES -->

                <div class="about-features">

                    <div class="about-feature">

                        <i class='bx bxs-t-shirt'></i>

                        <div>

                            <h4>
                                Premium Fashion
                            </h4>

                            <p>
                                Modern and stylish collections for every season.
                            </p>

                        </div>

                    </div>

                    <div class="about-feature">

                        <i class='bx bxs-truck'></i>

                        <div>

                            <h4>
                                Fast Delivery
                            </h4>

                            <p>
                                Quick and safe delivery service across Nepal.
                            </p>

                        </div>

                    </div>

                    <div class="about-feature">

                        <i class='bx bxs-user-detail'></i>

                        <div>

                            <h4>
                                Customer Support
                            </h4>

                            <p>
                                Friendly support team available anytime for help.
                            </p>

                        </div>

                    </div>

                </div>

                <a href="${pageContext.request.contextPath}/products"
                   class="about-btn">

                    Explore Products

                </a>

            </div>

        </div>

    </div>

</section>

<!-- ================= STATS ================= -->

<section class="about-stats">

    <div class="container">

        <div class="about-stats-grid">

            <div class="about-stat-card">

                <h2>40+</h2>

                <p>Fashion Products</p>

            </div>

            <div class="about-stat-card">

                <h2>4</h2>

                <p>Main Categories</p>

            </div>

            <div class="about-stat-card">

                <h2>24/7</h2>

                <p>Customer Support</p>

            </div>

            <div class="about-stat-card">

                <h2>100%</h2>

                <p>Secure Shopping</p>

            </div>

        </div>

    </div>

</section>

<!-- ================= TEAM ================= -->
<section class="about-team">

    <div class="container">

        <div class="team-heading">

            <span class="section-subtitle">
                UrbanWear Team
            </span>

            <h2>
                Meet Our Team
            </h2>

            <p>
                Passionate people behind UrbanWear fashion experience.
            </p>

        </div>

        <div class="team-grid">

            <div class="team-card">

                <div class="team-avatar">
                    <i class="fas fa-user"></i>
                </div>

                <h3>Dipika Thapa</h3>
                <p>Frontend Designer</p>

            </div>

            <div class="team-card">

                <div class="team-avatar">
                    <i class="fas fa-user"></i>
                </div>

                <h3>Punam Shrestha</h3>
                <p>Backend Developer</p>

            </div>

            <div class="team-card">

                <div class="team-avatar">
                    <i class="fas fa-user"></i>
                </div>

                <h3>Asmi Ale Magar</h3>
                <p>Database Manager</p>

            </div>

            <div class="team-card">

                <div class="team-avatar">
                    <i class="fas fa-user"></i>
                </div>

                <h3>Eshu Thapa</h3>
                <p>Service Layer Developer</p>

            </div>

            <div class="team-card">

                <div class="team-avatar">
                    <i class="fas fa-user"></i>
                </div>

                <h3>Grishma Tamang</h3>
                <p>Authentication & Testing</p>

            </div>

        </div>

    </div>

</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>