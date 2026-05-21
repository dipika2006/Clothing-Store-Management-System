<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>My Orders | UrbanWear</title>
</head>

<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="orders-page">
    <div class="container">

        <div class="page-heading">
            <span class="subtitle">Order History</span>
            <h1>My Orders</h1>
        </div>

        <c:if test="${param.returnSuccess eq 'true'}">
            <div class="auth-success">
                Return request submitted successfully.
            </div>
        </c:if>

        <c:if test="${param.returnError eq 'true'}">
            <div class="auth-error">
                Failed to submit return request.
            </div>
        </c:if>

        <c:choose>

            <c:when test="${empty orders}">
                <div class="empty-cart">
                    <i class="fas fa-box-open"></i>
                    <h2>No Orders Yet</h2>
                    <p>You have not placed any orders yet.</p>

                    <a href="${pageContext.request.contextPath}/products"
                       class="primary-btn">
                        Shop Now
                    </a>
                </div>
            </c:when>

            <c:otherwise>

                <div class="orders-wrapper">

                    <c:forEach var="o" items="${orders}">

                        <div class="order-card">

                            <div class="order-top">
                                <div>
                                    <h3>Order #${o.orderId}</h3>
                                    <p>${o.orderDate}</p>
                                </div>

                                <span class="status
                                    ${o.status eq 'Delivered' ? 'success' :
                                      o.status eq 'Cancelled' ? 'danger' :
                                      o.status eq 'Returned' ? 'returned' :
                                      'pending'}">
                                        ${o.status}
                                </span>
                            </div>

                            <div class="order-body">

                                <div>
                                    <span>Total Amount</span>
                                    <h2>Rs. ${o.totalAmount}</h2>
                                </div>

                                <div>
                                    <span>Payment Method</span>
                                    <h2>${empty o.paymentMethod ? 'Cash On Delivery' : o.paymentMethod}</h2>
                                </div>

                            </div>

                            <div class="order-actions">

                                <c:if test="${o.status eq 'Pending'
                                             || o.status eq 'Pending Payment'
                                             || o.status eq 'Order Submitted'}">

                                    <a href="${pageContext.request.contextPath}/orders?action=cancel&id=${o.orderId}"
                                       class="delete-btn"
                                       onclick="return confirm('Cancel this order?')">
                                        Cancel Order
                                    </a>

                                </c:if>

                            </div>

                            <c:if test="${o.status eq 'Delivered'}">

                                <form action="${pageContext.request.contextPath}/orders"
                                      method="post"
                                      class="return-form">

                                    <input type="hidden" name="action" value="return">

                                    <input type="hidden"
                                           name="orderId"
                                           value="${o.orderId}">

                                    <textarea name="reason"
                                              placeholder="Write your reason for return..."
                                              required></textarea>

                                    <button type="submit"
                                            class="primary-btn">
                                        Request Return
                                    </button>

                                </form>

                            </c:if>

                            <c:if test="${o.status eq 'Returned'}">
                                <div class="return-message">
                                    Return request submitted successfully.
                                </div>
                            </c:if>

                        </div>

                    </c:forEach>

                </div>

            </c:otherwise>

        </c:choose>

    </div>
</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>