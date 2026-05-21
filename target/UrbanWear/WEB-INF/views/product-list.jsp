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

        <!-- FILTER BAR -->
        <form action="${pageContext.request.contextPath}/products"
              method="get"
              class="filter-bar">

            <div class="filter-group">
                <label>Search Product</label>
                <input type="text"
                       name="search"
                       value="${param.search}"
                       placeholder="Search fashion products...">
            </div>

            <div class="filter-group">
                <label>Category</label>
                <select name="category">
                    <option value="">All Categories</option>

                    <option value="Men" ${param.category eq 'Men' ? 'selected' : ''}>
                        Men
                    </option>

                    <option value="Women" ${param.category eq 'Women' ? 'selected' : ''}>
                        Women
                    </option>

                    <option value="Kids" ${param.category eq 'Kids' ? 'selected' : ''}>
                        Kids
                    </option>

                    <option value="Unisex" ${param.category eq 'Unisex' ? 'selected' : ''}>
                        Unisex
                    </option>
                </select>
            </div>

            <div class="filter-group">
                <label>Sort By</label>
                <select name="sort">
                    <option value="">Latest</option>

                    <option value="low-high" ${param.sort eq 'low-high' ? 'selected' : ''}>
                        Price: Low to High
                    </option>

                    <option value="high-low" ${param.sort eq 'high-low' ? 'selected' : ''}>
                        Price: High to Low
                    </option>
                </select>
            </div>

            <button type="submit" class="filter-btn">
                <i class="fas fa-filter"></i>
                Filter
            </button>

        </form>

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