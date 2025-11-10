<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Tài Liệu - Hệ Thống Quản Lý Thư Viện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reader-detailed-doc.css">
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
                <a href="" class="nav-link ">Trang Chủ</a>
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
            <!-- Breadcrumb -->
            <nav class="breadcrumb">
                <a href="">Trang Chủ</a>
                <span class="separator">/</span>
                <a href="/document">Tìm Kiếm</a>
                <span class="separator">/</span>
                <span class="current">${requestScope.doc.title}</span>
            </nav>

            <!-- Document Details -->
            <div class="document-layout">
                <!-- Left Column: Cover and Actions -->
                <aside class="document-sidebar">
                    <div class="cover-section">
                        <div class="cover-image">
                            <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                        </div>
                        <div class="availability-status available">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="20 6 9 17 4 12"></polyline>
                            </svg>
                            <span>${requestScope.doc.status}</span>
                        </div>
                    </div>

<%--                    <div class="action-buttons">--%>
<%--                        <button class="btn-primary">--%>
<%--                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">--%>
<%--                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>--%>
<%--                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>--%>
<%--                            </svg>--%>
<%--                            Mượn Sách--%>
<%--                        </button>--%>
<%--                        <button class="btn-secondary">--%>
<%--                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">--%>
<%--                                <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path>--%>
<%--                            </svg>--%>
<%--                            Thêm Vào Yêu Thích--%>
<%--                        </button>--%>
<%--                    </div>--%>

<%--                    <div class="quick-info">--%>
<%--                        <h3>Thông Tin Nhanh</h3>--%>
<%--                        <div class="info-item">--%>
<%--                            <span class="label">Số Bản Khả Dụng:</span>--%>
<%--                            <span class="value">3 / 5</span>--%>
<%--                        </div>--%>
<%--                        <div class="info-item">--%>
<%--                            <span class="label">Vị Trí:</span>--%>
<%--                            <span class="value">Khu A, Giá 12</span>--%>
<%--                        </div>--%>
<%--                        <div class="info-item">--%>
<%--                            <span class="label">Ký Hiệu:</span>--%>
<%--                            <span class="value">QA76.9.A43 C67</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </aside>

                <!-- Right Column: Details -->
                <div class="document-content">
                    <h1 class="document-title">${requestScope.doc.title}</h1>
                    
                    <div class="metadata">
                        <div class="meta-item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                            <span>${requestScope.doc.author}</span>
                        </div>
                        <div class="meta-item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                            <span>${requestScope.doc.publishYear}</span>
                        </div>
                        <div class="meta-item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            <span>${requestScope.doc.pages} trang</span>
                        </div>
                    </div>

                    <!-- Description -->
                    <section class="section">
                        <h2>Mô Tả</h2>
                        <p>
                            ${requestScope.doc.description}
                        </p>

                    </section>

                    <!-- Details Table -->
                    <section class="section">
                        <h2>Thông Tin Xuất Bản</h2>
                        <table class="details-table">
                            <tbody>
<%--                                <tr>--%>
<%--                                    <td class="label-col">ISBN-13</td>--%>
<%--                                    <td>978-0262046305</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td class="label-col">ISBN-10</td>--%>
<%--                                    <td>0262046305</td>--%>
<%--                                </tr>--%>
                                <tr>
                                    <td class="label-col">Nhà Xuất Bản</td>
                                    <td>${requestScope.doc.publisher}</td>
                                </tr>
<%--                                <tr>--%>
<%--                                    <td class="label-col">Phiên Bản</td>--%>
<%--                                    <td>Ấn Bản 4</td>--%>
<%--                                </tr>--%>
                                <tr>
                                    <td class="label-col">Ngôn Ngữ</td>
                                    <td>${requestScope.doc.language}</td>
                                </tr>
<%--                                <tr>--%>
<%--                                    <td class="label-col">Danh mục</td>--%>
<%--                                    <td>${requestScope.doc.genre}</td>--%>
<%--                                </tr>--%>
                            </tbody>
                        </table>
                    </section>

                    <!-- Topics -->
                    <section class="section">
                        <h2>Chủ Đề</h2>
                        <div class="topics-grid">
                            <span class="topic-tag">${requestScope.doc.genre}</span>
                        </div>
                    </section>

                    <!-- Table of Contents -->
<%--                    <section class="section">--%>
<%--                        <h2>Mục Lục</h2>--%>
<%--                        <ul class="toc-list">--%>
<%--                            <li>I. Nền Tảng</li>--%>
<%--                            <li>II. Sắp Xếp và Thống Kê Thứ Tự</li>--%>
<%--                            <li>III. Cấu Trúc Dữ Liệu</li>--%>
<%--                            <li>IV. Kỹ Thuật Thiết Kế và Phân Tích Nâng Cao</li>--%>
<%--                            <li>V. Cấu Trúc Dữ Liệu Nâng Cao</li>--%>
<%--                            <li>VI. Thuật Toán Đồ Thị</li>--%>
<%--                            <li>VII. Chủ Đề Được Chọn</li>--%>
<%--                            <li>VIII. Phụ Lục: Nền Tảng Toán Học</li>--%>
<%--                        </ul>--%>
<%--                    </section>--%>

                    <!-- Reviews Section -->
<%--                    <section class="section">--%>
<%--                        <h2>Đánh Giá Của Độc Giả</h2>--%>
<%--                        <div class="review-card">--%>
<%--                            <div class="review-header">--%>
<%--                                <div class="reviewer-info">--%>
<%--                                    <span class="reviewer-name">Nguyễn Thị Lan</span>--%>
<%--                                    <span class="review-date">15/10/2025</span>--%>
<%--                                </div>--%>
<%--                                <div class="rating">--%>
<%--                                    ★★★★★--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <p class="review-text">--%>
<%--                                Tài liệu tham khảo xuất sắc cho thiết kế và phân tích thuật toán. Các giải thích rõ ràng và --%>
<%--                                ví dụ được lựa chọn tốt. Là cuốn sách bắt buộc cho bất kỳ sinh viên khoa học máy tính nào.--%>
<%--                            </p>--%>
<%--                        </div>--%>

<%--                        <div class="review-card">--%>
<%--                            <div class="review-header">--%>
<%--                                <div class="reviewer-info">--%>
<%--                                    <span class="reviewer-name">Trần Minh Hoàng</span>--%>
<%--                                    <span class="review-date">28/9/2025</span>--%>
<%--                                </div>--%>
<%--                                <div class="rating">--%>
<%--                                    ★★★★☆--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <p class="review-text">--%>
<%--                                Phạm vi bao quát toàn diện về thuật toán. Có thể khó khăn đối với người mới bắt đầu, nhưng --%>
<%--                                độ sâu của tài liệu làm cho nó vô cùng quý giá cho nghiên cứu nâng cao.--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </section>--%>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Hệ Thống Thư Viện Đại Học.</p>
<%--            <p>Cần hỗ trợ? Liên hệ: <a href="mailto:library@university.edu">library@university.edu</a></p>--%>
        </div>
    </footer>
</body>
</html>
