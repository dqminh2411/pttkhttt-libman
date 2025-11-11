<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phiếu Mượn Sách - Hệ Thống Quản Lý Thư Viện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/borrow-slip-info.css">
</head>
<body>
    <!-- Header -->
    <header class="header no-print">
        <div class="header-container">
            <div class="logo-section">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                </svg>
                <span class="logo-text">Hệ Thống Thư Viện</span>
            </div>
            <nav class="nav-menu">
                <a href="/librarian/LibrarianMain.jsp" class="nav-link">Trang Chủ</a>
                <a href="/librarian/borrow-doc" class="nav-link active">Cho Mượn Tài Liệu</a>
<%--                <a href="/librarian/manage-borrow-transaction" class="nav-link">Quản Lý Mượn Trả</a>--%>
            </nav>
            <div class="user-section">
                <span class="user-name">Xin chào nhân viên, ${sessionScope.librarian.fullname}</span>
                <button class="logout-btn">Đăng Xuất</button>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <!-- Action Buttons -->
            <div class="action-bar no-print">
                <button class="btn-back" onclick="window.history.back()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="19" y1="12" x2="5" y2="12"></line>
                        <polyline points="12 19 5 12 12 5"></polyline>
                    </svg>
                    Quay Lại
                </button>
            </div>

            <!-- Borrow Slip -->
            <div class="slip-container">
                <!-- Slip Header -->
                <div class="slip-header">
                    <div class="university-info">
                        <h1>TRƯỜNG ĐẠI HỌC PTIT</h1>
                        <h2>THƯ VIỆN PTIT</h2>
                        <p class="address">Địa chỉ: 123 Đường ptit, Quận ptit, TP. Hà Nội</p>
                        <p class="contact">ĐT: 0123456789</p>
                    </div>
                    <div class="slip-logo">
                        <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                    </div>
                </div>

                <div class="slip-title">
                    <h3>PHIẾU MƯỢN TÀI LIỆU</h3>
                    <p class="slip-number">Số: <span id="slipNumber">${sessionScope.borrowSlip.borrowSlipId}</span></p>
                </div>

                <!-- Reader Information -->
                <div class="info-section">
                    <h4 class="section-title">Thông Tin Độc Giả</h4>
                    <div class="info-grid">
                        <div class="info-item">
                            <span class="label">Mã thẻ độc giả:</span>
                            <span class="value" id="readerCardId">${sessionScope.borrowSlip.libraryCard.libraryCardId}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">Họ và tên:</span>
                            <span class="value" id="readerName">${sessionScope.borrowSlip.libraryCard.reader.fullname}</span>
                        </div>
                        
                        <div class="info-item">
                            <span class="label">Email:</span>
                            <span class="value" id="readerEmail">${sessionScope.borrowSlip.libraryCard.reader.email}</span>
                        </div>
                    </div>
                </div>

                <!-- Borrow Information -->
                <div class="info-section">
                    <h4 class="section-title">Thông Tin Mượn Tài liệu</h4>
                    <div class="info-grid">
                        <div class="info-item">
                            <span class="label">Ngày mượn:</span>
                            <span class="value" id="borrowDate">${sessionScope.borrowDate}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">Ngày hạn trả:</span>
                            <span class="value" id="dueDate">${sessionScope.dueDate}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">Thủ thư:</span>
                            <span class="value" id="librarianName">${sessionScope.borrowSlip.librarian.fullname}</span>
                        </div>
                    </div>
                </div>

                <!-- Books List -->
                <div class="books-section">
                    <h4 class="section-title">Danh Sách Sách Mượn</h4>
                    <table class="books-table">
                        <thead>
                            <tr>
                                <th width="5%">STT</th>
                                <th width="12%">Mã bản sao</th>
                                <th width="45%">Nhan đề</th>
                                <th width="25%">Tác Giả</th>
                                <th width="13%">Năm XB</th>
                            </tr>
                        </thead>
                        <tbody id="booksTableBody">
                            <c:forEach var="i" items="${sessionScope.borrowedItems}" varStatus="s">
                                <tr>
                                    <td class="text-center">${s.count}</td>
                                    <td>${i.item.itemId}</td>
                                    <td>${i.item.document.title}</td>
                                    <td>${i.item.document.author}</td>
                                    <td class="text-center">${i.item.document.publishYear}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="books-summary">
                        <strong>Tổng số tài liệu mượn:</strong> <span id="totalBooks">${sessionScope.borrowedItems.size()}</span> cuốn
                    </div>
                </div>

                <!-- Terms and Conditions -->
                <div class="terms-section">
                    <h4 class="section-title">Điều Khoản & Lưu Ý</h4>
                    <ul class="terms-list">
                        <li>Độc giả có trách nhiệm bảo quản sách và trả đúng hạn.</li>
                        <li>Trường hợp trả trễ, độc giả sẽ bị phạt 2.000đ/ngày/cuốn.</li>
                        <li>Nếu làm mất hoặc hư hỏng sách, độc giả phải bồi thường theo quy định.</li>
                        <li>Liên hệ thư viện qua hotline: (024) 1234 5678 để được hỗ trợ.</li>
                    </ul>
                </div>

                <!-- Signatures -->
                <div class="signatures">
                    <div class="signature-box">
                        <p class="signature-title">Nhân viên</p>
                        <p class="signature-note">(Ký và ghi rõ họ tên)</p>
                        <div class="signature-space"></div>
                        <p class="signature-name" id="librarianSignature">${sessionScope.borrowSlip.librarian.fullname}</p>
                    </div>
                    <div class="signature-box">
                        <p class="signature-title">Độc Giả</p>
                        <p class="signature-note">(Ký và ghi rõ họ tên)</p>
                        <div class="signature-space"></div>
                        <p class="signature-name" id="readerSignature">${sessionScope.borrowSlip.libraryCard.reader.fullname}</p>
                    </div>
                </div>

                <!-- Footer -->
                <div class="slip-footer">
                    <p class="footer-note">* Phiếu mượn được lập ngày <span id="createDate">${sessionScope.borrowDate}</span></p>
                    <p class="footer-warning">Vui lòng giữ phiếu này để làm căn cứ khi trả sách</p>
                </div>
            </div>

            <!-- Print Button Below Slip -->
            <div class="print-button-container no-print">
                <button class="btn-print" onclick="printSlip()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="6 9 6 2 18 2 18 9"></polyline>
                        <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
                        <rect x="6" y="14" width="12" height="8"></rect>
                    </svg>
                    In Phiếu
                </button>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer no-print">
        <div class="container">
            <p>&copy; 2025 Hệ Thống Thư Viện Đại Học.</p>
        </div>
    </footer>

    <script>
        function printSlip() {
            alert("In phiếu mượn thành công!");
            window.location.href = '/librarian/LibrarianMain.jsp';
        }
    </script>
</body>
</html>
