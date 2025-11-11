<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ Độc Giả - Hệ Thống Quản Lý Thư Viện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reader-home.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo-section">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                </svg>
                <span class="logo-text">Hệ Thống Thư Viện</span>
            </div>
            <nav class="nav-menu">
                <a href="" class="nav-link active">Trang Chủ</a>
                <a href="/document" class="nav-link">Tìm Sách</a>
<%--                <a href="#" class="nav-link">Sách Của Tôi</a>--%>
<%--                <a href="#" class="nav-link">Lịch Sử</a>--%>
            </nav>
            <c:if test="${not empty sessionScope.member}">
                <div class="user-section">
                    <span class="user-name">Xin chào, ${sessionScope.member.fullname}</span>
                    <button class="logout-btn">Đăng Xuất</button>
                </div>
            </c:if>

        </div>
    </header>

    <div style="display: flex; justify-content: center;">
        <h1>Trang chủ bạn đọc</h1>
    </div>
    <!-- Main Content -->

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Hệ Thống Thư Viện Đại Học. Bản quyền đã được bảo hộ.</p>
            <p>Cần hỗ trợ? Liên hệ: <a href="mailto:library@university.edu">library@university.edu</a></p>
        </div>
    </footer>
</body>
</html>
