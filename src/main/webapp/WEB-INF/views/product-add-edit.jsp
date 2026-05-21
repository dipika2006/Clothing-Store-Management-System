<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>Admin Products | UrbanWear</title>
</head>
<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="admin-page">
    <div class="container">

        <div class="admin-hero">
            <span class="admin-subtitle">Admin Panel</span>
            <h1>Product Management</h1>
            <a href="${pageContext.request.contextPath}/dashboard">← Dashboard</a>
        </div>

        <div class="product-management-grid">

            <div class="product-form-box">
                <div class="product-form-head">
                    <h2>
                        <c:choose>
                            <c:when test="${not empty product}">Edit Product</c:when>
                            <c:otherwise>Add Product</c:otherwise>
                        </c:choose>
                    </h2>
                </div>

                <form action="${pageContext.request.contextPath}/admin/products"
                      method="post"
                      enctype="multipart/form-data"
                      class="product-form">

                    <input type="hidden" name="productId" value="${product.productId}">

                    <div class="form-group">
                        <label>Product Name</label>
                        <input type="text" name="name" value="${product.name}" placeholder="Enter product name" required>
                    </div>

                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="description" placeholder="Enter product description" required>${product.description}</textarea>
                    </div>

                    <div class="form-grid">
                        <div class="form-group">
                            <label>Price</label>
                            <input type="number" step="0.01" name="price" value="${product.price}" placeholder="Product price" required>
                        </div>

                        <div class="form-group">
                            <label>Discount %</label>
                            <input type="number" step="0.01" name="discount" value="${product.discount}" placeholder="Discount percentage">
                        </div>
                    </div>

                    <div class="form-grid">
                        <div class="form-group">
                            <label>Stock</label>
                            <input type="number" name="stock" value="${product.stock}" placeholder="Available stock" required>
                        </div>

                        <div class="form-group">
                            <label>Category</label>
                            <select name="categoryId" required>

                                <option value="">Select Category</option>

                                <c:forEach var="cat" items="${categories}">

                                    <option value="${cat.categoryId}"

                                            <c:if test="${product.categoryId == cat.categoryId}">
                                                selected
                                            </c:if>

                                    >
                                            ${cat.name}
                                    </option>

                                </c:forEach>

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Sizes</label>
                        <input type="text" name="sizes" value="${product.sizes}" placeholder="Example: S,M,L,XL">
                    </div>

                    <div class="form-group">
                        <label>Product Image</label>
                        <input type="file" name="image">
                    </div>

                    <button type="submit" class="admin-btn">
                        <c:choose>
                            <c:when test="${not empty product}">Update Product</c:when>
                            <c:otherwise>Add Product</c:otherwise>
                        </c:choose>
                    </button>
                </form>
            </div>

            <div class="admin-table-box">
                <h2>Product List</h2>
                <p>Total Products: ${products.size()}</p>

                <div class="table-scroll">
                    <table class="admin-table">
                        <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Discount</th>
                            <th>Stock</th>
                            <th>Category</th>
                            <th>Actions</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="p" items="${products}">
                            <tr>
                                <td>
                                    <img src="${pageContext.request.contextPath}/${p.imageUrl}"
                                         class="admin-product-img"
                                         alt="${p.name}">
                                </td>
                                <td>${p.name}</td>
                                <td>Rs. ${p.price}</td>
                                <td>${p.discount}%</td>
                                <td>${p.stock}</td>
                                <td>${p.categoryName}</td>
                                <td>
                                    <div class="action-buttons">

                                        <a class="edit-btn"
                                           href="${pageContext.request.contextPath}/admin/products?action=edit&id=${p.productId}">
                                            Edit
                                        </a>

                                        <a class="delete-btn"
                                           href="${pageContext.request.contextPath}/admin/products?action=delete&id=${p.productId}"
                                           onclick="return confirm('Delete this product?')">
                                            Delete
                                        </a>

                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </div>
</section>

</body>
</html>