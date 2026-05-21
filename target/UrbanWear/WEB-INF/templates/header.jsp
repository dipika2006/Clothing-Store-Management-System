<header class="header">
    <div class="container header-inner">

        <a href="${pageContext.request.contextPath}/home" class="logo">

            <img src="${pageContext.request.contextPath}/static/images/UrbanWear.png"
                 alt="UrbanWear Logo"
                 class="logo-img">

            <div class="logo-text">
                <h2>UrbanWear</h2>
                <p>Wear Your Style</p>
            </div>

        </a>

        <button class="menu-btn" type="button" onclick="toggleMenu()">
            <span></span>
            <span></span>
            <span></span>
        </button>

        <%@ include file="/WEB-INF/templates/nav.jsp" %>

    </div>
</header>