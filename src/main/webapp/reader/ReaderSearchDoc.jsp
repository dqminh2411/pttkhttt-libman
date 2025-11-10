<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Kiếm Tài Liệu - Hệ Thống Quản Lý Thư Viện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reader-search-doc.css">
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
                <a href="" class="nav-link">Trang Chủ</a>
                <a href="/document" class="nav-link active">Tìm Sách</a>
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
            <!-- Search Section -->
            <section class="search-section">
                <div class="search-header">
                    <h1>Tìm Kiếm Tài Liệu</h1>
                </div>

                <form action="/document/search" method="get">
                <div class="search-bar-container">

                    <div class="search-input-wrapper">
                        <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.35-4.35"></path>
                        </svg>
                        <input 
                            type="text"
                            name="key"
                            class="search-input" 
                            placeholder="Tìm theo tên tài liệu"
                            value="${requestScope.key}"
                        >
                    </div>
                    <button type="submit" class="search-btn">Tìm kiếm</button>

                </div>
                </form>
                <!-- Filter and Sort Bar -->
<%--                <div class="controls-bar">--%>
<%--                    <div class="filters">--%>
<%--&lt;%&ndash;                        <select class="filter-select">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="">Tất Cả Danh Mục</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="computer-science">Khoa Học Máy Tính</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="mathematics">Toán Học</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="physics">Vật Lý</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="engineering">Kỹ Thuật</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="literature">Văn Học</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="history">Lịch Sử</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </select>&ndash;%&gt;--%>

<%--                        <select class="filter-select">--%>
<%--                            <option value="">Tình Trạng</option>--%>
<%--                            <option value="available">Có Sẵn</option>--%>
<%--                            <option value="borrowed">Đã Mượn</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>

<%--                    <div class="sort-section">--%>
<%--                        <label for="sort">Sắp xếp:</label>--%>
<%--                        <select id="sort" class="sort-select">--%>
<%--                            <option value="relevance">Liên Quan</option>--%>
<%--                            <option value="title-asc">Tên (A-Z)</option>--%>
<%--                            <option value="title-desc">Tên (Z-A)</option>--%>
<%--                            <option value="author-asc">Tác Giả (A-Z)</option>--%>
<%--                            <option value="author-desc">Tác Giả (Z-A)</option>--%>
<%--                            <option value="year-desc">Năm (Mới Nhất)</option>--%>
<%--                            <option value="year-asc">Năm (Cũ Nhất)</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
                </div>
            </section>

            <!-- Results Section -->
            <section class="results-section">
                <div class="results-header">
                    <c:if test="${not empty requestScope.key}">
                        <c:if test="${requestScope.totalResults > 0}">
                            <p class="results-count">Tìm thấy ${requestScope.totalResults} tài liệu với từ khoá "${requestScope.key}"</p>
                        </c:if>
                        <c:if test="${requestScope.totalResults == 0}">
                            <p class="results-count">Không tìm thấy tài liệu nào với từ khoá "${requestScope.key}"</p>
                        </c:if>

                    </c:if>

                </div>

                <!-- Results Grid -->
                <div class="results-grid">
                        <c:forEach var="d" items="${documents}">
                            <a href="/document/detail?id=${d.documentId}" class="doc-card">
                                <div class="doc-cover">
                                    <div class="cover-placeholder">
<%--                                        <svg xmlns="" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">--%>
<%--                                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>--%>
<%--                                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>--%>
<%--                                        </svg>--%>
                                        <img src="${d.imgPath}"  width="100%" alt="book-cover"/>
                                    </div>
                                    <span class="availability-badge available">${d.status}</span>
                                </div>
                                <div class="doc-info">
                                    <h3 class="doc-title">${d.title}</h3>
                                    <p class="doc-author">${d.author}</p>
                                    <p class="doc-year">${d.publishYear}</p>
                                </div>
                            </a>
                        </c:forEach>
                </div>

                <!-- Pagination -->
                <c:if test="${requestScope.totalResults > 0}">
                    <p id="info" curPage="${requestScope.curPage}" totalPages="${requestScope.totalPages}" key="${requestScope.key}"></p>
                    <div class="pagination">
                        <button id="prevBtn" class="page-btn" ${requestScope.curPage == 1? 'disabled':''} >
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="15 18 9 12 15 6"></polyline>
                            </svg>
                            Trước
                        </button>

                        <div class="page-numbers">
                            <c:forEach var="i" begin="1" end="${requestScope.totalPages}">
                                <a class="page-number" href="/document/search?key=${requestScope.key}&page=${i}">${i}</a>
                            </c:forEach>
                        </div>

                        <button id="nextBtn" class="page-btn" ${requestScope.curPage == requestScope.totalPages? 'disabled-a':''} >
                            Sau
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </button>
                    </div>
                </c:if>
            </section>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Hệ Thống Thư Viện Đại Học.</p>
<%--            <p>Cần hỗ trợ? Liên hệ: <a href="mailto:library@university.edu">library@university.edu</a></p>--%>
        </div>
    </footer>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const prevBtn=document.getElementById("prevBtn");
            const nextBtn=document.getElementById("nextBtn");
            const info=document.getElementById("info");
            const curPage = parseInt(info.getAttribute("curPage")) || 1;
            const totalPages = parseInt(info.getAttribute("totalPages")) || 1;
            const key = info.getAttribute("key") || "";
            console.log(" 1 vs 2: ", "1" < "2");
            prevBtn.addEventListener("click", function() {
                if (curPage > 1) {
                    window.location.href = `/document/search?key=${key}&page=${curPage - 1}`;
                }
            });

            nextBtn.addEventListener("click", function() {
                if (curPage < totalPages) {
                    window.location.href = `/document/search?key=${key}&page=${curPage + 1}`;
                }
            });

        });
    </script>
</body>
</html>