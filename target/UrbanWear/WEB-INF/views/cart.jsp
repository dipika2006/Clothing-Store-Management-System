<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>Cart | UrbanWear</title>
</head>
<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="cart-page">
    <div class="container">

        <div class="page-heading">
            <span class="subtitle">Shopping Cart</span>
            <h1>Your Cart</h1>
        </div>

        <c:choose>
            <c:when test="${empty cartItems}">
                <div class="empty-cart">
                    <i class="fas fa-cart-shopping"></i>
                    <h2>Your cart is empty</h2>
                    <p>Add some stylish products to your cart.</p>

                    <a href="${pageContext.request.contextPath}/products"
                       class="primary-btn">
                        Shop Now
                    </a>
                </div>
            </c:when>

            <c:otherwise>
                <div class="cart-layout">

                    <div class="cart-items">

                        <c:forEach var="item" items="${cartItems}">

                            <div class="cart-card">

                                <div class="cart-image">
                                    <img src="${pageContext.request.contextPath}/${item.product.imageUrl}"
                                         alt="${item.product.name}">
                                </div>

                                <div class="cart-info">
                                    <h3>${item.product.name}</h3>

                                    <p>
                                        Size: <strong>${item.size}</strong>
                                    </p>

                                    <p>
                                        Color: <strong>${item.color}</strong>
                                    </p>

                                    <span class="cart-price">
                                        Rs. ${item.product.finalPrice}
                                    </span>
                                </div>

                                <div class="cart-actions">

                                    <div class="cart-quantity">

                                        <a class="qty-btn"
                                           href="${pageContext.request.contextPath}/cart?action=decrease&id=${item.product.productId}&size=${item.size}&color=${item.color}">
                                            -
                                        </a>

                                        <span>${item.quantity}</span>

                                        <a class="qty-btn"
                                           href="${pageContext.request.contextPath}/cart?action=increase&id=${item.product.productId}&size=${item.size}&color=${item.color}">
                                            +
                                        </a>

                                    </div>

                                    <strong>
                                        Rs. ${item.subtotal}
                                    </strong>

                                    <a class="cart-remove"
                                       href="${pageContext.request.contextPath}/cart?action=remove&id=${item.product.productId}&size=${item.size}&color=${item.color}"
                                       onclick="return confirm('Remove this item?')">
                                        <i class="fas fa-trash"></i>
                                    </a>

                                </div>

                            </div>

                        </c:forEach>

                    </div>

                    <div class="cart-summary">
                        <h2>Order Summary</h2>

                        <div class="summary-row">
                            <span>Total Items</span>
                            <strong>${cartItems.size()}</strong>
                        </div>

                        <div class="summary-total">
                            <span>Total</span>
                            <strong>Rs. ${cartTotal}</strong>
                        </div>

                        <a href="${pageContext.request.contextPath}/checkout"
                           class="checkout-btn">
                            Proceed To Checkout
                        </a>
                    </div>

                </div>
            </c:otherwise>
        </c:choose>

    </div>
</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>