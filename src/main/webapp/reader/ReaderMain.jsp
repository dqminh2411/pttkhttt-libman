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
                    <span class="user-name">${sessionScope.member.fullname}</span>
                    <button class="logout-btn">Đăng Xuất</button>
                </div>
            </c:if>

        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <!-- Welcome Section -->
            <section class="welcome-section">
                <h1>Chào mừng trở lại, ${sessionScope.member.fullname}</h1>
                <p class="welcome-subtitle">Quản lý sách đã mượn và khám phá đầu sách mới</p>
            </section>

            <!-- Stats Cards -->
            <section class="stats-section">
                <div class="stat-card">
                    <div class="stat-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                    </div>
                    <div class="stat-info">
                        <h3>3</h3>
                        <p>Sách Đã Mượn</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <polyline points="12 6 12 12 16 14"></polyline>
                        </svg>
                    </div>
                    <div class="stat-info">
                        <h3>2</h3>
                        <p>Sắp Hết Hạn</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                        </svg>
                    </div>
                    <div class="stat-info">
                        <h3>12</h3>
                        <p>Sách Đã Đọc</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"></path>
                            <line x1="7" y1="7" x2="7.01" y2="7"></line>
                        </svg>
                    </div>
                    <div class="stat-info">
                        <h3>5</h3>
                        <p>Yêu Thích</p>
                    </div>
                </div>
            </section>

            <!-- Currently Borrowed Books -->
            <section class="borrowed-section">
                <div class="section-header">
                    <h2>Đang Mượn</h2>
                    <a href="#" class="view-all">Xem Tất Cả</a>
                </div>

                <div class="books-grid">
                    <div class="book-card">
                        <div class="book-cover">
                            <div class="book-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                        </div>
                        <div class="book-info">
                            <h3 class="book-title">Introduction to Algorithms</h3>
                            <p class="book-author">Thomas H. Cormen</p>
                            <div class="book-meta">
                                <span class="due-date warning">Hạn trả: 5/11/2025</span>
                            </div>
                            <button class="btn-secondary">Gia Hạn</button>
                        </div>
                    </div>

                    <div class="book-card">
                        <div class="book-cover">
                            <div class="book-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                        </div>
                        <div class="book-info">
                            <h3 class="book-title">Clean Code</h3>
                            <p class="book-author">Robert C. Martin</p>
                            <div class="book-meta">
                                <span class="due-date">Hạn trả: 15/11/2025</span>
                            </div>
                            <button class="btn-secondary">Gia Hạn</button>
                        </div>
                    </div>

                    <div class="book-card">
                        <div class="book-cover">
                            <div class="book-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                        </div>
                        <div class="book-info">
                            <h3 class="book-title">Database Systems</h3>
                            <p class="book-author">Ramez Elmasri</p>
                            <div class="book-meta">
                                <span class="due-date">Hạn trả: 20/11/2025</span>
                            </div>
                            <button class="btn-secondary">Gia Hạn</button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Quick Actions -->
            <section class="actions-section">
                <div class="section-header">
                    <h2>Thao Tác Nhanh</h2>
                </div>

                <div class="actions-grid">
                    <div class="action-card">
                        <div class="action-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="11" cy="11" r="8"></circle>
                                <path d="m21 21-4.35-4.35"></path>
                            </svg>
                        </div>
                        <h3>Tìm Kiếm Sách</h3>
                        <p>Tìm kiếm đầu sách tiếp theo từ bộ sưu tập</p>
                        <button class="btn-primary">Duyệt</button>
                    </div>

                    <div class="action-card">
                        <div class="action-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"></path>
                                <polyline points="14 2 14 8 20 8"></polyline>
                            </svg>
                        </div>
                        <h3>Lịch Sử Mượn</h3>
                        <p>Xem lịch sử mượn sách đầy đủ</p>
                        <button class="btn-primary">Xem</button>
                    </div>

                    <div class="action-card">
                        <div class="action-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path>
                            </svg>
                        </div>
                        <h3>Sách Yêu Thích</h3>
                        <p>Truy cập danh sách sách yêu thích</p>
                        <button class="btn-primary">Mở</button>
                    </div>

                    <div class="action-card">
                        <div class="action-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                            </svg>
                        </div>
                        <h3>Cài Đặt Tài Khoản</h3>
                        <p>Quản lý hồ sơ và tùy chỉnh</p>
                        <button class="btn-primary">Cài Đặt</button>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Hệ Thống Thư Viện Đại Học. Bản quyền đã được bảo hộ.</p>
            <p>Cần hỗ trợ? Liên hệ: <a href="mailto:library@university.edu">library@university.edu</a></p>
        </div>
    </footer>
</body>
</html>
