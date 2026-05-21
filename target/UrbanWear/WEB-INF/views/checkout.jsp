<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>Checkout | UrbanWear</title>
</head>
<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="checkout-page">
    <div class="container">

        <div class="page-heading">
            <span class="subtitle">Secure Checkout</span>
            <h1>Complete Your Order</h1>
        </div>

        <div class="checkout-layout">

            <div class="checkout-form-box">
                <h2>Delivery Details</h2>

                <c:if test="${not empty error}">
                    <div class="auth-error">
                            ${error}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/checkout"
                      method="post"
                      class="checkout-form">

                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="name" required>
                    </div>

                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" name="phone" required>
                    </div>

                    <div class="form-group">
                        <label>Delivery Address</label>
                        <textarea name="address" required></textarea>
                    </div>

                    <div class="form-group">
                        <label>Payment Method</label>
                        <select name="payment" required>
                            <option value="Cash On Delivery">Cash On Delivery</option>
                            <option value="Online Payment">Online Payment</option>
                        </select>
                    </div>

                    <button type="submit" class="place-order-btn">
                        Place Order
                    </button>

                </form>
            </div>

            <div class="checkout-summary">
                <h2>Order Summary</h2>

                <c:forEach var="item" items="${cartItems}">
                    <div class="summary-row">
                        <span>${item.product.name} × ${item.quantity}</span>
                        <strong>Rs. ${item.subtotal}</strong>
                    </div>
                </c:forEach>

                <div class="summary-total">
                    <span>Grand Total</span>
                    <strong>Rs. ${cartTotal}</strong>
                </div>
            </div>

        </div>

    </div>
</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>