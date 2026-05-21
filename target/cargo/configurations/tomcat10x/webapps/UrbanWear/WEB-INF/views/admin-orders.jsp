<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/WEB-INF/templates/head.jsp" %>
  <title>Admin Orders | UrbanWear</title>
</head>
<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="admin-page">
  <div class="container">

    <div class="admin-page-head">
      <div>
        <span class="subtitle">Admin Panel</span>
        <h1>Customer Orders</h1>
      </div>

    </div>

    <div class="admin-table-box">

      <div class="admin-table-head">
        <h2>Order List</h2>
      </div>

      <div class="table-scroll">
        <table class="admin-table">

          <thead>
          <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Date</th>
            <th>Total</th>
            <th>Status</th>
            <th>Update Status</th>
            <th>Actions</th>
          </tr>
          </thead>

          <tbody>
          <c:choose>
            <c:when test="${not empty orders}">

              <c:forEach var="o" items="${orders}">
                <tr>
                  <td>#${o.orderId}</td>
                  <td>User-${o.userId}</td>
                  <td>${o.orderDate}</td>
                  <td class="price">Rs. ${o.totalAmount}</td>

                  <td>
                                        <span class="status-badge
                                            ${o.status eq 'Cancelled' ? 'status-cancelled' :
                                              o.status eq 'Delivered' ? 'status-completed' :
                                              o.status eq 'Returned' ? 'status-returned' :
                                              'status-pending'}">
                                            ${o.status}
                                        </span>
                  </td>

                  <td>
                    <form action="${pageContext.request.contextPath}/admin/orders"
                          method="post"
                          class="status-form">

                      <input type="hidden"
                             name="orderId"
                             value="${o.orderId}">

                      <select name="status">
                        <option value="Order Submitted" ${o.status eq 'Order Submitted' ? 'selected' : ''}>
                          Order Submitted
                        </option>

                        <option value="Pending" ${o.status eq 'Pending' ? 'selected' : ''}>
                          Pending
                        </option>

                        <option value="Delivered" ${o.status eq 'Delivered' ? 'selected' : ''}>
                          Delivered
                        </option>

                        <option value="Cancelled" ${o.status eq 'Cancelled' ? 'selected' : ''}>
                          Cancelled
                        </option>

                        <option value="Returned" ${o.status eq 'Returned' ? 'selected' : ''}>
                          Returned
                        </option>
                      </select>

                      <button type="submit" class="small-btn">
                        Update
                      </button>
                    </form>
                  </td>

                  <td>
                    <div class="action-buttons">
                      <a href="${pageContext.request.contextPath}/admin/order-details?id=${o.orderId}"
                         class="edit-btn">View</a>

                      <a href="${pageContext.request.contextPath}/admin/invoice?id=${o.orderId}"
                         class="edit-btn">Invoice</a>
                    </div>
                  </td>
                </tr>
              </c:forEach>

            </c:when>

            <c:otherwise>
              <tr>
                <td colspan="7" class="empty-admin-row">
                  No orders found.
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