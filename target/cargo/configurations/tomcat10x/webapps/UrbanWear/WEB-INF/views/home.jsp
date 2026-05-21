<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>UrbanWear | Home</title>
</head>

<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<!-- HERO SECTION -->

<section class="hero-section">

    <div class="container hero-wrapper">

        <div class="hero-content">

            <span class="hero-badge">
                Urban Fashion 2026
            </span>

            <h1>
                Elevate Your Style With UrbanWear
            </h1>

            <p>
                Discover premium fashion collections crafted for confidence,
                comfort, and modern lifestyle.
            </p>

            <div class="hero-actions">

                <a href="${pageContext.request.contextPath}/products"
                   class="primary-btn">
                    Shop Collection
                </a>

                <a href="${pageContext.request.contextPath}/about"
                   class="secondary-btn">
                    Learn More
                </a>

            </div>

        </div>

        <div class="hero-image">

            <img src="${pageContext.request.contextPath}/static/images/unisex/unisex1.png"
                 alt="UrbanWear Fashion">

        </div>

    </div>

</section>

<!-- FEATURES -->

<section class="features-section">

    <div class="container features-grid">

        <div class="feature-card">
            <i class="fas fa-truck-fast"></i>
            <h3>Fast Delivery</h3>
            <p>Quick and secure delivery service across Nepal.</p>
        </div>

        <div class="feature-card">
            <i class="fas fa-rotate-left"></i>
            <h3>Easy Returns</h3>
            <p>Hassle-free return and exchange support.</p>
        </div>

        <div class="feature-card">
            <i class="fas fa-shield-heart"></i>
            <h3>Secure Payment</h3>
            <p>Your payment information is fully protected.</p>
        </div>

        <div class="feature-card">
            <i class="fas fa-headset"></i>
            <h3>24/7 Support</h3>
            <p>Dedicated support team always ready to help.</p>
        </div>

    </div>

</section>

<!-- PRODUCTS -->

<section class="products-section">

    <div class="container">

        <div class="section-heading">

            <div>

                <span class="section-subtitle">
                    New Collection
                </span>

                <h2>Trending Products</h2>

            </div>

            <a href="${pageContext.request.contextPath}/products"
               class="secondary-btn">

                View All

            </a>

        </div>

        <div class="product-grid">

            <c:forEach var="product"
                       items="${products}"
                       begin="0"
                       end="3">

                <div class="product-card">

                    <a href="${pageContext.request.contextPath}/product-detail?id=${product.productId}">

                        <div class="product-image">

                            <img src="${pageContext.request.contextPath}/${product.imageUrl}"
                                 alt="${product.name}">

                        </div>

                    </a>

                    <div class="product-content">

                        <span class="product-category">
                                ${product.categoryName}
                        </span>

                        <h3>
                                ${product.name}
                        </h3>

                        <p class="product-description">
                                ${product.description}
                        </p>

                        <div class="product-price-box">

                            <div class="final-price">
                                Rs. ${product.price}
                            </div>

                        </div>

                    </div>

                </div>

            </c:forEach>

        </div>

    </div>

</section>

<!-- CATEGORY -->

<section class="category-section">

    <div class="container">

        <div class="section-heading center">

            <span class="section-subtitle">
                Categories
            </span>

            <h2>
                Shop By Category
            </h2>

        </div>

        <div class="category-grid">

            <a href="${pageContext.request.contextPath}/products?category=Men"
               class="category-card">

                <div class="category-overlay"></div>

                <div class="category-content">
                    <h3>Men</h3>
                    <p>Premium Men's Fashion</p>
                </div>

            </a>

            <a href="${pageContext.request.contextPath}/products?category=Women"
               class="category-card">

                <div class="category-overlay"></div>

                <div class="category-content">
                    <h3>Women</h3>
                    <p>Elegant Women's Collection</p>
                </div>

            </a>

            <a href="${pageContext.request.contextPath}/products?category=Kids"
               class="category-card">

                <div class="category-overlay"></div>

                <div class="category-content">
                    <h3>Kids</h3>
                    <p>Stylish Kids Wear</p>
                </div>

            </a>

            <a href="${pageContext.request.contextPath}/products?category=Unisex"
               class="category-card">

                <div class="category-overlay"></div>

                <div class="category-content">
                    <h3>Unisex</h3>
                    <p>Modern Everyday Style</p>
                </div>

            </a>

        </div>

    </div>

</section>

<!-- NEWSLETTER -->

<section class="newsletter-section">

    <div class="container newsletter-box">

        <div>

            <span class="section-subtitle">
                Join UrbanWear
            </span>

            <h2>
                Stay Updated With Fashion Trends
            </h2>

            <p>
                Subscribe to receive updates about new arrivals,
                special offers, and fashion inspiration.
            </p>

        </div>

        <form class="newsletter-large">

            <input type="email"
                   placeholder="Enter your email address">

            <button type="button">
                Subscribe
            </button>

        </form>

    </div>

</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>