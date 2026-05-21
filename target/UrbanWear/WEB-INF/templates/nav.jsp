<%
    String role = session != null ? (String) session.getAttribute("role") : null;
    String userName = session != null ? (String) session.getAttribute("userName") : null;
%>

<nav class="nav-menu" id="navMenu">

    <% if ("admin".equalsIgnoreCase(role)) { %>

    <a href="<%= request.getContextPath() %>/dashboard">Dashboard</a>
    <a href="<%= request.getContextPath() %>/admin/products">Products</a>
    <a href="<%= request.getContextPath() %>/admin/orders">Orders</a>
    <a href="<%= request.getContextPath() %>/admin/feedbacks">Feedbacks</a>
    <a href="<%= request.getContextPath() %>/admin/report">Report</a>

    <a href="<%= request.getContextPath() %>/profile"
       class="nav-user profile-link">

        <i class="fas fa-user-circle"></i>
        <span>Hi, <%= userName != null ? userName : "User" %></span>

    </a>

    <a href="<%= request.getContextPath() %>/logout" class="nav-login">
        Logout
    </a>

    <% } else if ("customer".equalsIgnoreCase(role)) { %>

    <a href="<%= request.getContextPath() %>/home">Home</a>
    <a href="<%= request.getContextPath() %>/products">Products</a>
    <a href="<%= request.getContextPath() %>/about">About</a>
    <a href="<%= request.getContextPath() %>/contact">Contact</a>
    <a href="<%= request.getContextPath() %>/cart">Cart</a>
    <a href="<%= request.getContextPath() %>/orders">Orders</a>

    <a href="<%= request.getContextPath() %>/profile"
       class="nav-user profile-link">

        <i class="fas fa-user-circle"></i>
        <span>Hi, <%= userName != null ? userName : "User" %></span>

    </a>

    <a href="<%= request.getContextPath() %>/logout" class="nav-login">
        Logout
    </a>

    <% } else { %>

    <a href="<%= request.getContextPath() %>/home">Home</a>
    <a href="<%= request.getContextPath() %>/products">Products</a>
    <a href="<%= request.getContextPath() %>/about">About</a>
    <a href="<%= request.getContextPath() %>/contact">Contact</a>

    <a href="<%= request.getContextPath() %>/login" class="nav-login">
        Login
    </a>

    <% } %>

</nav>