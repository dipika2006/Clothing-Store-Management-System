<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>UrbanWear | Products</title>
</head>

<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="products-page">

    <div class="container">

        <div class="page-heading">

            <span class="section-subtitle">
                UrbanWear Collection
            </span>

            <h1>All Products</h1>

        </div>

        <div class="product-grid">

            <c:forEach var="product" items="${products}">

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

                        <h3>${product.name}</h3>

                        <p class="product-description">
                                ${product.description}
                        </p>

                        <div class="final-price">
                            Rs. ${product.price}
                        </div>

                    </div>

                </div>

            </c:forEach>

        </div>

    </div>

</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>