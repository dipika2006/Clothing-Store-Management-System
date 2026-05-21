<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/WEB-INF/templates/head.jsp" %>
  <title>Order Details | UrbanWear</title>
</head>
<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="admin-page">
  <div class="container">

    <div class="admin-page-head">
      <div>
        <h1>Order Details</h1>
      </div>
    </div>

    <div class="invoice-info-grid">

      <div class="info-card">
        <span>Order ID</span>
        <h3>#${order.orderId}</h3>
      </div>

      <div class="info-card">
        <span>User ID</span>
        <h3>User-${order.userId}</h3>
      </div>

      <div class="info-card">
        <span>Status</span>

        <h3>
                    <span class="status-badge
                        ${order.status eq 'Cancelled' ? 'status-cancelled' :
                          order.status eq 'Delivered' ? 'status-completed' :
                          order.status eq 'Returned' ? 'status-returned' :
                          'status-pending'}">
                      ${order.status}
                    </span>
        </h3>
      </div>

      <div class="info-card">
        <span>Total Amount</span>
        <h3>Rs. ${order.totalAmount}</h3>
      </div>

    </div>

    <div class="admin-table-box">

      <div class="admin-table-head">
        <h2>Purchased Items</h2>
      </div>

      <div class="table-scroll">
        <table class="admin-table">

          <thead>
          <tr>
            <th>Product ID</th>
            <th>Size</th>
            <th>Color</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Subtotal</th>
          </tr>
          </thead>

          <tbody>
          <c:choose>
            <c:when test="${not empty orderItems}">

              <c:forEach var="item" items="${orderItems}">
                <tr>
                  <td>#${item.productId}</td>
                  <td>${item.size}</td>
                  <td>${item.color}</td>
                  <td>${item.quantity}</td>
                  <td class="price">Rs. ${item.price}</td>
                  <td class="price">Rs. ${item.price * item.quantity}</td>
                </tr>
              </c:forEach>

              <tr class="grand-total-row">
                <td colspan="5">
                  <strong>Grand Total</strong>
                </td>

                <td class="price">
                  <strong>Rs. ${order.totalAmount}</strong>
                </td>
              </tr>

            </c:when>

            <c:otherwise>
              <tr>
                <td colspan="6" class="empty-admin-row">
                  No order items found.
                </td>
              </tr>
            </c:otherwise>
          </c:choose>
          </tbody>

        </table>
      </div>

    </div>

  </div>
</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>