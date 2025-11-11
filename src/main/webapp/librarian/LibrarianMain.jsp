<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ Nhân viên - Hệ Thống Quản Lý Thư Viện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lend-book.css">
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
                <a href="/librarian/LibrarianMain.jsp" class="nav-link active">Trang Chủ</a>
                <a href="/librarian/borrow-doc" class="nav-link">Cho Mượn Tài Liệu</a>
                <a href="/librarian/manage-borrow-transaction" class="nav-link">Quản Lý Mượn Trả</a>
                <!-- <a href="#" class="nav-link">Quản Lý Tài Liệu</a> -->
            </nav>
            <div class="user-section">
                <span class="user-name">Xin chào nhân viên, ${sessionScope.librarian.fullname}</span>
                <button class="logout-btn">Đăng Xuất</button>
            </div>
        </div>
    </header>
    <div style="display: flex; justify-content: center;">
        <h1>Trang chủ nhân viên</h1>
    </div>
</body>
</html>