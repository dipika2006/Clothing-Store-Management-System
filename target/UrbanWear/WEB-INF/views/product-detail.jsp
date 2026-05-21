<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>${product.name}</title>
</head>

<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="product-detail-page">

    <div class="container">

        <div class="product-detail-wrapper">

            <div class="product-detail-image">

                <img src="${pageContext.request.contextPath}/${product.imageUrl}"
                     alt="${product.name}">

            </div>

            <div class="product-detail-content">

                <span class="product-category">
                    ${product.categoryName}
                </span>

                <h1>${product.name}</h1>

                <div class="detail-price">
                    Rs. ${product.price}
                </div>

                <p class="detail-description">
                    ${product.description}
                </p>

                <form action="${pageContext.request.contextPath}/cart"
                      method="post"
                      class="product-cart-form">

                    <input type="hidden"
                           name="productId"
                           value="${product.productId}">

                    <input type="hidden"
                           name="size"
                           id="selectedSize"
                           value="M">

                    <input type="hidden"
                           name="quantity"
                           value="1">

                    <div class="size-section">

                        <h4>Choose Size</h4>

                        <div class="size-options">

                            <c:forTokens items="${product.sizes}"
                                         delims=","
                                         var="size">

                                <button type="button"
                                        class="size-btn"
                                        onclick="selectSize(this, '${size.trim()}')">

                                        ${size.trim()}

                                </button>

                            </c:forTokens>

                        </div>

                    </div>

                    <button type="submit" class="add-cart-btn">
                        Add To Cart
                    </button>

                </form>

            </div>

        </div>

    </div>

</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>