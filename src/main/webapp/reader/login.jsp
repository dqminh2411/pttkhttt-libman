 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Quản Lý Thư Viện - Đăng Nhập</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <div class="header">
                <div class="logo">
                    <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                    </svg>
                </div>
                <h1>Hệ Thống Quản Lý Thư Viện</h1>
                <p class="subtitle">Cổng Thư Viện Đại Học</p>
            </div>


            <c:if test="${not empty requestScope.error}">
                <p class="error-message">${requestScope.error}</p>
            </c:if>



            <form action="${pageContext.request.contextPath}/auth/login" method="post" class="login-form">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input 
                        type="text" 
                        id="username" 
                        name="username" 
                        placeholder="Nhập tên đăng nhập"
                        required 
                        autofocus
                    >
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input 
                        type="password" 
                        id="password" 
                        name="password" 
                        placeholder="Nhập mật khẩu"
                        required
                    >
                </div>

<%--                <div class="form-options">--%>
<%--                    <label class="remember-me">--%>
<%--                        <input type="checkbox" name="remember" value="true">--%>
<%--                        <span>Ghi nhớ đăng nhập</span>--%>
<%--                    </label>--%>
<%--                    <a href="#" class="forgot-password">Quên mật khẩu?</a>--%>
<%--                </div>--%>

                <button type="submit" class="login-button">Đăng Nhập</button>
            </form>

            <div class="footer">
                <p>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký tại đây</a></p>
            </div>
        </div>

        <div class="info-section">
            <p>&copy; 2025 Hệ Thống Thư Viện Đại Học</p>
            <p>Cần hỗ trợ? Liên hệ: library@university.edu</p>
        </div>
    </div>
</body>
</html>
