<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/templates/head.jsp" %>
    <title>Admin Dashboard | UrbanWear</title>
</head>
<body>

<%@ include file="/WEB-INF/templates/header.jsp" %>

<section class="dashboard-page">
    <div class="container">

        <div class="dashboard-top">
            <div>
                <span class="subtitle">Admin Panel</span>
                <h1>Dashboard Overview</h1>
            </div>

            <a href="${pageContext.request.contextPath}/home"
               class="view-store-btn">
                Open Store
            </a>
        </div>

        <div class="dashboard-stats">

            <div class="dashboard-stat-card stat-orders">
                <div class="dashboard-stat-top">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="dashboard-stat-growth">+12%</span>
                </div>

                <h3>Total Orders</h3>
                <h2>${totalOrders}</h2>

                <div class="dashboard-stat-bottom">
                    <i class="fas fa-arrow-up"></i>
                    Increased this month
                </div>
            </div>

            <div class="dashboard-stat-card stat-products">
                <div class="dashboard-stat-top">
                    <i class="fas fa-box"></i>
                    <span class="dashboard-stat-growth">+8%</span>
                </div>

                <h3>Total Products</h3>
                <h2>${totalProducts}</h2>

                <div class="dashboard-stat-bottom">
                    <i class="fas fa-arrow-up"></i>
                    New products added
                </div>
            </div>

            <div class="dashboard-stat-card stat-users">
                <div class="dashboard-stat-top">
                    <i class="fas fa-users"></i>
                    <span class="dashboard-stat-growth">+20%</span>
                </div>

                <h3>Total Customers</h3>
                <h2>${totalUsers}</h2>

                <div class="dashboard-stat-bottom">
                    <i class="fas fa-arrow-up"></i>
                    Active customers
                </div>
            </div>

            <div class="dashboard-stat-card stat-revenue">
                <div class="dashboard-stat-top">
                    <i class="fas fa-wallet"></i>
                    <span class="dashboard-stat-growth">+18%</span>
                </div>

                <h3>Total Revenue</h3>
                <h2>Rs. ${totalRevenue}</h2>

                <div class="dashboard-stat-bottom">
                    <i class="fas fa-arrow-up"></i>
                    Revenue growth
                </div>
            </div>

        </div>

        <div class="dashboard-grid">

            <div class="dashboard-card">
                <div class="card-head">
                    <h2>Quick Actions</h2>
                </div>

                <div class="quick-actions">

                    <a href="${pageContext.request.contextPath}/admin/products">
                        <i class="fas fa-plus"></i>
                        Manage Products
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/orders">
                        <i class="fas fa-list"></i>
                        Manage Orders
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/report-invoice">
                        <i class="fas fa-file-invoice"></i>
                        Generate Report
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/feedbacks">
                        <i class="fas fa-comments"></i>
                        View Feedbacks
                    </a>

                </div>
            </div>

            <div class="dashboard-card">
                <div class="card-head">
                    <h2>Store Analytics</h2>
                </div>

                <div class="chart-box">
                    <canvas id="dashboardChart"></canvas>
                </div>
            </div>

        </div>

    </div>
</section>

<%@ include file="/WEB-INF/templates/footer.jsp" %>

<script>
    const totalOrders = Number("${totalOrders != null ? totalOrders : 0}");
    const totalProducts = Number("${totalProducts != null ? totalProducts : 0}");
    const totalUsers = Number("${totalUsers != null ? totalUsers : 0}");
    const totalRevenue = Number("${totalRevenue != null ? totalRevenue : 0}");
</script>

</body>
</html>