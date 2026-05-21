<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/WEB-INF/templates/head.jsp" %>
  <title>My Profile | UrbanWear</title>
</head>

<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="profile-page">
  <div class="container">

    <div class="profile-wrapper">

      <div class="profile-card">

        <div class="profile-image-box">

          <c:choose>

            <c:when test="${user.role eq 'admin'}">

              <img src="${pageContext.request.contextPath}/static/images/users/admin.png"
                   alt="Admin Profile">

            </c:when>

            <c:otherwise>

              <img src="${pageContext.request.contextPath}/static/images/users/user.png"
                   alt="User Profile">

            </c:otherwise>

          </c:choose>

        </div>

        <h2>${user.name}</h2>
        <p>${user.email}</p>
        <span>${user.role}</span>

        <c:choose>
          <c:when test="${user.role eq 'admin'}">
            <a href="${pageContext.request.contextPath}/dashboard"
               class="secondary-btn">
              Back To Dashboard
            </a>
          </c:when>

          <c:otherwise>
            <a href="${pageContext.request.contextPath}/home"
               class="secondary-btn">
              Back To Home
            </a>
          </c:otherwise>
        </c:choose>

      </div>

      <div class="profile-form-box">

        <h1>Edit Profile</h1>

        <c:if test="${param.success eq 'true'}">
          <div class="auth-success">
            Profile updated successfully.
          </div>
        </c:if>

        <c:if test="${param.error eq 'true'}">
          <div class="auth-error">
            Failed to update profile.
          </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/profile"
              method="post"
              enctype="multipart/form-data"
              class="profile-form">

          <div class="form-group">
            <label>Full Name</label>
            <input type="text"
                   name="name"
                   value="${user.name}"
                   required>
          </div>

          <div class="form-group">
            <label>Email Address</label>
            <input type="email"
                   value="${user.email}"
                   readonly>
          </div>

          <div class="form-group">
            <label>Phone Number</label>
            <input type="text"
                   name="phone"
                   value="${user.phone}"
                   placeholder="Enter phone number">
          </div>

          <div class="form-group">
            <label>Address</label>
            <textarea name="address"
                      rows="5"
                      placeholder="Enter your full address">${user.address}</textarea>
          </div>

          <div class="form-group">
            <label>Profile Picture</label>
            <input type="file"
                   name="profileImage"
                   accept="image/*">
          </div>

          <button type="submit"
                  class="primary-btn">
            Save Changes
          </button>

        </form>

      </div>

    </div>

  </div>
</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

</body>
</html>