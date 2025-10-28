<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Kiếm Tài Liệu - Hệ Thống Quản Lý Thư Viện</title>
    <link rel="stylesheet" href="../css/reader-search-doc.css">
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
                <a href="reader-home.jsp" class="nav-link">Trang Chủ</a>
                <a href="reader-search-doc.html" class="nav-link active">Tìm Sách</a>
                <a href="#" class="nav-link">Sách Của Tôi</a>
                <a href="#" class="nav-link">Lịch Sử</a>
            </nav>
            <div class="user-section">
                <span class="user-name">John Doe</span>
                <button class="logout-btn">Đăng Xuất</button>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <!-- Search Section -->
            <section class="search-section">
                <h1>Tìm Kiếm Tài Liệu</h1>
                <p class="search-subtitle">Khám phá sách từ bộ sưu tập phong phú</p>

                <div class="search-bar-container">
                    <div class="search-input-wrapper">
                        <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.35-4.35"></path>
                        </svg>
                        <input 
                            type="text" 
                            class="search-input" 
                            placeholder="Tìm theo tên, tác giả, ISBN hoặc từ khóa..."
                            value="thuật toán"
                        >
                    </div>
                    <button class="search-btn">Tìm Kiếm</button>
                </div>

                <!-- Filter and Sort Bar -->
                <div class="controls-bar">
                    <div class="filters">
                        <select class="filter-select">
                            <option value="">Tất Cả Danh Mục</option>
                            <option value="computer-science">Khoa Học Máy Tính</option>
                            <option value="mathematics">Toán Học</option>
                            <option value="physics">Vật Lý</option>
                            <option value="engineering">Kỹ Thuật</option>
                            <option value="literature">Văn Học</option>
                            <option value="history">Lịch Sử</option>
                        </select>

                        <select class="filter-select">
                            <option value="">Tình Trạng</option>
                            <option value="available">Có Sẵn</option>
                            <option value="borrowed">Đã Mượn</option>
                        </select>
                    </div>

                    <div class="sort-section">
                        <label for="sort">Sắp xếp:</label>
                        <select id="sort" class="sort-select">
                            <option value="relevance">Liên Quan</option>
                            <option value="title-asc">Tên (A-Z)</option>
                            <option value="title-desc">Tên (Z-A)</option>
                            <option value="author-asc">Tác Giả (A-Z)</option>
                            <option value="author-desc">Tác Giả (Z-A)</option>
                            <option value="year-desc">Năm (Mới Nhất)</option>
                            <option value="year-asc">Năm (Cũ Nhất)</option>
                        </select>
                    </div>
                </div>
            </section>

            <!-- Results Section -->
            <section class="results-section">
                <div class="results-header">
                    <p class="results-count">Tìm thấy <strong>24 tài liệu</strong> với từ khóa "thuật toán"</p>
                </div>

                <!-- Results Grid -->
                <div class="results-grid">
                    <!-- Document Card 1 -->
                    <a href="reader-detailed-doc.jsp?id=1" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge available">C� S?n</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">Introduction to Algorithms</h3>
                            <p class="doc-author">Thomas H. Cormen, Charles E. Leiserson</p>
                            <p class="doc-year">2022</p>
                        </div>
                    </a>

                    <!-- Document Card 2 -->
                    <a href="reader-detailed-doc.jsp?id=2" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge borrowed">Đã Mượn</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">Algorithm Design Manual</h3>
                            <p class="doc-author">Steven S. Skiena</p>
                            <p class="doc-year">2020</p>
                        </div>
                    </a>

                    <!-- Document Card 3 -->
                    <a href="reader-detailed-doc.jsp?id=3" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge available">Có Sẵn</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">Data Structures and Algorithms in Java</h3>
                            <p class="doc-author">Michael T. Goodrich, Roberto Tamassia</p>
                            <p class="doc-year">2021</p>
                        </div>
                    </a>

                    <!-- Document Card 4 -->
                    <a href="reader-detailed-doc.jsp?id=4" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge available">C� S?n</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">Algorithms Unlocked</h3>
                            <p class="doc-author">Thomas H. Cormen</p>
                            <p class="doc-year">2019</p>
                        </div>
                    </a>

                    <!-- Document Card 5 -->
                    <a href="reader-detailed-doc.jsp?id=5" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge available">C� S?n</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">Grokking Algorithms</h3>
                            <p class="doc-author">Aditya Bhargava</p>
                            <p class="doc-year">2018</p>
                        </div>
                    </a>

                    <!-- Document Card 6 -->
                    <a href="reader-detailed-doc.jsp?id=6" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge borrowed">�� Mu?n</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">The Art of Computer Programming</h3>
                            <p class="doc-author">Donald E. Knuth</p>
                            <p class="doc-year">2023</p>
                        </div>
                    </a>

                    <!-- Document Card 7 -->
                    <a href="reader-detailed-doc.jsp?id=7" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge available">C� S?n</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">Algorithms in C++</h3>
                            <p class="doc-author">Robert Sedgewick</p>
                            <p class="doc-year">2017</p>
                        </div>
                    </a>

                    <!-- Document Card 8 -->
                    <a href="reader-detailed-doc.jsp?id=8" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge available">C� S?n</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">Competitive Programming Algorithms</h3>
                            <p class="doc-author">Steven Halim, Felix Halim</p>
                            <p class="doc-year">2020</p>
                        </div>
                    </a>

                    <!-- Document Card 9 -->
                    <a href="reader-detailed-doc.jsp?id=9" class="doc-card">
                        <div class="doc-cover">
                            <div class="cover-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <span class="availability-badge available">C� S?n</span>
                        </div>
                        <div class="doc-info">
                            <h3 class="doc-title">Machine Learning Algorithms</h3>
                            <p class="doc-author">Giuseppe Bonaccorso</p>
                            <p class="doc-year">2021</p>
                        </div>
                    </a>
                </div>

                <!-- Pagination -->
                <div class="pagination">
                    <button class="page-btn" disabled>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="15 18 9 12 15 6"></polyline>
                        </svg>
                        Trước
                    </button>

                    <div class="page-numbers">
                        <button class="page-number active">1</button>
                        <button class="page-number">2</button>
                        <button class="page-number">3</button>
                        <span class="page-ellipsis">...</span>
                        <button class="page-number">8</button>
                    </div>

                    <button class="page-btn">
                        Sau
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </button>
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
