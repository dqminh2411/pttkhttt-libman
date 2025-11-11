<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cho Mượn Sách - Hệ Thống Quản Lý Thư Viện</title>
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
                <a href="/librarian/LibrarianMain.jsp" class="nav-link">Trang Chủ</a>
                <a href="/librarian/borrow-doc" class="nav-link active">Cho Mượn Tài Liệu</a>
                <a href="/librarian/manage-borrow-transaction" class="nav-link">Quản Lý Mượn Trả</a>
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
            <div class="page-header">
                <h1>Lập Phiếu Mượn Tài liệu</h1>
                <p class="page-subtitle">Tạo phiếu mượn tài liệu mới cho độc giả</p>
            </div>

            <form id="lendForm" class="lend-form" action="/librarian/borrow-doc" method="POST">
                <!-- Hidden fields for form submission -->
                <input type="hidden" name="cardId" id="selectedCardId"/>
                <!-- Reader Information Section -->
                <section class="form-section">
                    <h2 class="section-title">Thông Tin Độc Giả</h2>
                    
                    <div class="search-trigger">
                        <button type="button" class="btn-search-trigger" id="openReaderSearchBtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="11" cy="11" r="8"></circle>
                                <path d="m21 21-4.35-4.35"></path>
                            </svg>
                            Tìm Kiếm Độc Giả (*)
                        </button>
                        <p class="search-hint">Nhấn để tìm kiếm và chọn độc giả</p>
                    </div>

                    <!-- Reader Info Display -->
                    <div class="reader-info-card" id="readerInfoCard" style="display: none;">
                        <div class="info-header">
                            <h3>Thông Tin Độc Giả Đã Chọn</h3>
                            <button type="button" class="btn-change" id="changeReaderBtn">Đổi Độc Giả</button>
                        </div>
                        <div class="info-row">
                            <div class="info-group">
                                <span class="info-label">Mã Thẻ:</span>
                                <span class="info-value" id="readerCardId"></span>
                            </div>
                            <div class="info-group">
                                <span class="info-label">Họ Tên:</span>
                                <span class="info-value" id="readerName"></span>
                            </div>
                            <div class="info-group">
                                <span class="info-label">Số tài liệu đang mượn:</span>
                                <span class="info-value" id="borrowingCount">0</span>
                            </div>
                            
                            <div class="info-group">
                                <span class="info-label">Trạng Thái:</span>
                                <span class="info-value status-active" id="cardStatus"></span>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Borrow Details Section -->
                <section class="form-section">
                    <h2 class="section-title">Thông Tin Mượn Tài liệu (*)</h2>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="borrowDate">Ngày Mượn <span class="required">*</span></label>
                            <input type="date" id="borrowDate" name="borrowDate" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label for="dueDate">Ngày Hạn Trả <span class="required">*</span></label>
                            <input type="date" id="dueDate" name="dueDate" class="form-input" required>
                        </div>
                    </div>
                </section>

                <!-- Book Items Section -->
                <section class="form-section">
                    <div class="section-header">
                        <h2 class="section-title">Danh Sách Sách Mượn (*)</h2>
                        <button type="button" class="btn-secondary" id="openDocSearchBtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                            Thêm Tài liệu
                        </button>
                    </div>

                    <!-- Borrowed Items Table -->
                    <div class="table-container">
                        <table class="borrowed-table">
                            <thead>
                                <tr>
                                    <th width="5%">STT</th>
                                    <th width="10%">Mã bản sao</th>
                                    <th width="40%">Tên tài liệu</th>
                                    <th width="25%">Tác Giả</th>
                                    <th width="5%">Năm XB</th>
                                    <th width="5%">Xóa</th>
                                </tr>
                            </thead>
                            <tbody id="borrowedItemsTable">
                                <tr class="empty-row">
                                    <td colspan="6" class="text-center">Chưa có sách nào được thêm vào phiếu mượn</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="table-summary">
                        <span class="summary-label">Tổng số sách:</span>
                        <span class="summary-value" id="totalBooks"></span>
                    </div>
                </section>

                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="button" class="btn-cancel">Hủy Bỏ</button>
                    <button type="submit" class="btn-primary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="20 6 9 17 4 12"></polyline>
                        </svg>
                        Lập Phiếu Mượn
                    </button>
                </div>
            </form>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Hệ Thống Thư Viện Đại Học.</p>
        </div>
    </footer>

    <!-- Reader Search Modal -->
    <div id="cardSearchModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Tìm Kiếm Độc Giả</h2>
                <button type="button" class="modal-close" id="closeCardModal">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>
            <div class="modal-body">
                <div class="modal-search">
                    <div class="search-input-wrapper">
                        <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.35-4.35"></path>
                        </svg>
                        <input type="text" id="cardSearchInput" placeholder="Nhập mã thẻ" class="form-input search-input">
                    </div>
                    <button type="button" class="btn-primary" id="searchCardInModalBtn">Tìm Kiếm</button>
                </div>

                <div class="modal-results" id="cardResults">
                    <div class="results-placeholder">
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.35-4.35"></path>
                        </svg>
                        <p>Nhập mã thẻ và nhấn "Tìm Kiếm" để bắt đầu</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Doc Search Modal -->
    <div id="docSearchModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Thêm tài liệu mượn</h2>
                <button type="button" class="modal-close" id="closeDocModal">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>
            <div class="modal-body">
                <div class="modal-search">
                    <div class="search-input-wrapper">
                        <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.35-4.35"></path>
                        </svg>
                        <input type="text" id="docSearchInput" placeholder="Nhập mã tài liệu hoặc mã bản sao" class="form-input search-input">
                    </div>
                    <button type="button" class="btn-primary" id="searchDocInModalBtn">Tìm Kiếm</button>
                </div>

                <div class="modal-results" id="docResults">
                    <div class="results-placeholder">
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        <p>Nhập từ khóa và nhấn "Tìm Kiếm" để bắt đầu</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const formatDate = (date) => date.toISOString().split('T')[0];
        // Set default dates
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date();
            const borrowDateInput = document.getElementById('borrowDate');
            const dueDateInput = document.getElementById('dueDate');
            //set min value borrowy date to today
            borrowDateInput.min = today.toISOString().split('T')[0];
            // set date to dd/mm/yyyy
            // Set borrow date to today
            borrowDateInput.valueAsDate = today;
            
            
            const dueDate = new Date(today);
            dueDate.setDate(dueDate.getDate() + 10);
            dueDateInput.valueAsDate = dueDate;
            console.log(dueDate);
            console.log(today);
            borrowDateInput.value = formatDate(today);
            dueDateInput.value = formatDate(dueDate);
        });

        // Modal Management
        const cardModal = document.getElementById('cardSearchModal');
        const docModal = document.getElementById('docSearchModal');
        // Store selected reader ID
        let selectedCardId = null;

        // Open Reader Search Modal
        document.getElementById('openReaderSearchBtn').addEventListener('click', function() {
            cardModal.style.display = 'flex';
            document.getElementById('cardSearchInput').focus();
        });

        // Change Reader Button
        document.getElementById('changeReaderBtn').addEventListener('click', function() {
            cardModal.style.display = 'flex';
            document.getElementById('cardSearchInput').focus();
        });

        // Close Reader Modal
        document.getElementById('closeCardModal').addEventListener('click', function() {
            cardModal.style.display = 'none';
        });

        // Open Doc Search Modal
        document.getElementById('openDocSearchBtn').addEventListener('click', function() {
            docModal.style.display = 'flex';
            document.getElementById('docSearchInput').focus();
        });

        // Close Doc Modal
        document.getElementById('closeDocModal').addEventListener('click', function() {
            docModal.style.display = 'none';
        });

        // Close modal when clicking outside
        window.addEventListener('click', function(event) {
            if (event.target === cardModal) {
                cardModal.style.display = 'none';
            }
            if (event.target === docModal) {
                docModal.style.display = 'none';
            }
        });

        // Search Reader in Modal
        document.getElementById('searchCardInModalBtn').addEventListener('click', function() {
            searchCards();
        });

        // Allow Enter key to search
        document.getElementById('cardSearchInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                searchCards();
            }
        });

        async function searchCards() {
            const searchValue = document.getElementById('cardSearchInput').value.trim();
            if (!searchValue) {
                alert('Vui lòng nhập từ khóa tìm kiếm!');
                return;
            }

            const response = await fetch('/card/search?cardId=' + encodeURIComponent(searchValue));
            const data = await response.json();
            displayCardResults(data);
        }

        function displayCardResults(cards) {
            const resultsContainer = document.getElementById('cardResults');
            
            if (cards.length === 0) {
                resultsContainer.innerHTML = `
                    <div class="no-results">
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="12" y1="8" x2="12" y2="12"></line>
                            <line x1="12" y1="16" x2="12.01" y2="16"></line>
                        </svg>
                        <p>Không tìm thấy độc giả nào!</p>
                    </div>
                `;
                return;
            }

            let html = `
                <div class="results-count-modal">Tìm thấy <strong>\${cards.length}</strong> kết quả</div>
                <div class="results-list-modal">
            `;

            cards.forEach(card => {
                //log all card info for debugging
                const statusClass = card.status === 'ACTIVE' ? 'status-active' : 'status-inactive';
                let statusText = card.status === 'ACTIVE' ? 'Hoạt Động' : 'Hết hạn';
                let disableSelect = true;
                if(card.status === 'ACTIVE' && card.borrowingCount < card.borrowQuota) {
                    disableSelect = false;
                } else {
                    statusText += card.status === 'INACTIVE' ? ' (Thẻ hết hạn)' : ' (Đã đạt hạn mức mượn)';
                }
                html += `
                    <div class="result-item-modal">
                        <div class="result-info-modal">
                            <div class="result-title-modal">\${card.reader.fullname}</div>
                            <div class="result-meta-modal">
                                <span><strong>Mã thẻ:</strong> \${card.libraryCardId}</span>
                                <span><strong>Đang mượn/hạn mức:</strong> \${card.borrowingCount}/\${card.borrowQuota}</span>
                                <span class="\${statusClass}"><strong>Trạng thái:</strong> \${statusText}</span>
                            </div>
                        </div>
                        <button id="select-card-\${card.libraryCardId}" type="button" class="btn-select" onclick='selectCard(\${JSON.stringify(card)})'>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="20 6 9 17 4 12"></polyline>
                            </svg>
                            Chọn
                        </button>
                    </div>
                `;
            });

            html += '</div>';
            resultsContainer.innerHTML = html;
        }
    
        function selectCard(card) {
            // Store reader ID for form submission
            selectedCardId = card.libraryCardId;
            document.getElementById('selectedCardId').value = card.libraryCardId;

            document.getElementById('readerCardId').textContent = card.libraryCardId;
            document.getElementById('readerName').textContent = card.reader.fullname;
            document.getElementById('borrowingCount').textContent = card.borrowingCount + "/" + card.borrowQuota;
            document.getElementById('cardStatus').textContent = card.status === 'ACTIVE' ? 'Hoạt Động' : 'Hết hạn';
            document.getElementById('cardStatus').className = card.status === 'ACTIVE' ? 'info-value status-active' : 'info-value status-inactive';

            // Show reader info card and hide search trigger
            document.getElementById('readerInfoCard').style.display = 'block';
            
            // Close modal
            cardModal.style.display = 'none';
            
            // Clear search input
            document.getElementById('cardSearchInput').value = '';
            document.getElementById('cardResults').innerHTML = `
                <div class="results-placeholder">
                    <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <path d="m21 21-4.35-4.35"></path>
                    </svg>
                    <p>Nhập từ khóa và nhấn "Tìm Kiếm" để bắt đầu</p>
                </div>
            `;
        }

        // Search Docs in Modal
        document.getElementById('searchDocInModalBtn').addEventListener('click', function() {
            searchDocs();
        });

        // Allow Enter key to search books
        document.getElementById('docSearchInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                searchDocs();
            }
        });

        async function searchDocs() {
            const searchValue = document.getElementById('docSearchInput').value.trim();
            if (!searchValue) {
                alert('Vui lòng nhập từ khóa tìm kiếm!');
                return;
            }
            const response = await fetch('/document/item/search?q=' + encodeURIComponent(searchValue));
            const data = await response.json();

            displayDocResults(data);
        }

        function displayDocResults(items) {
            const resultsContainer = document.getElementById('docResults');

            if (items.length === 0) {
                resultsContainer.innerHTML = `
                    <div class="no-results">
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="12" y1="8" x2="12" y2="12"></line>
                            <line x1="12" y1="16" x2="12.01" y2="16"></line>
                        </svg>
                        <p>Không tìm thấy sách nào!</p>
                    </div>
                `;
                return;
            }

            let html = `
                <div class="results-count-modal">Tìm thấy <strong>\${items.length}</strong> kết quả</div>
                <div class="results-list-modal">
            `;

            items.forEach(item => {
                const badgeClass = item.status === 'AVAILABLE' ? 'badge-available' : 'badge-borrowed';
                const disabled = item.status !== 'AVAILABLE' ? 'disabled' : '';
                const statusText = (item.status === 'AVAILABLE')? 'Có sẵn' : (item.status === 'UNAVAILABLE'? 'Không có sẵn':'Chỉ đọc tại chỗ');
                html += `
                    <div class="result-item-modal">
                        <div class="result-info-modal">
                            <div class="result-title-modal">\${item.document.title}</div>
                            <div class="result-meta-modal">
                                <span><strong>Mã:</strong> \${item.itemId}</span>
                                <span><strong>Tiêu đề:</strong> \${item.document.title}</span>
                                <span><strong>Tác giả:</strong> \${item.document.author}</span>
                                <span class="\${badgeClass}">\${statusText}</span>
                            </div>
                        </div>
                        <button type="button" class="btn-select" onclick='selectDoc(\${JSON.stringify(item)})' \${disabled}>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="20 6 9 17 4 12"></polyline>
                            </svg>
                            \${disabled ? 'Không Khả Dụng' : 'Chọn'}
                        </button>
                    </div>
                `;
            });

            html += '</div>';
            resultsContainer.innerHTML = html;
        }

        // Add doc to table
        let itemCounter = 0;
        const selectedItemIds = new Set();
    
        function selectDoc(item) {
            // Check if item already added
            if (selectedItemIds.has(item.itemId)) {
                alert('Mục này đã được thêm vào phiếu mượn!');
                return;
            }
            selectedItemIds.add(item.itemId);
            const tableBody = document.getElementById('borrowedItemsTable');
            
            // Remove empty row if exists
            const emptyRow = tableBody.querySelector('.empty-row');
            if (emptyRow) {
                emptyRow.remove();
            }
            
            // Add new row
            itemCounter++;
            const newRow = document.createElement('tr');
            newRow.dataset.itemId = item.itemId;
            newRow.innerHTML = `
                <td class="text-center">\${itemCounter}</td>
                <td>\${item.itemId}</td>
                <td>\${item.document.title}</td>
                <td>\${item.document.author}</td>
                <td>\${item.document.publishYear}</td>
                <input type="hidden" name="itemIds" value="\${item.itemId}">

                <td class="text-center">
                    <button type="button" class="btn-delete" onclick="removeDocFromTable(this)">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                        </svg>
                    </button>
                </td>
            `;
            tableBody.appendChild(newRow);
            
    
            // Update total
            updateDocCount();
            
            // Close modal
            docModal.style.display = 'none';
            
            // Clear search and results
            document.getElementById('docSearchInput').value = '';
            document.getElementById('docResults').innerHTML = `
                <div class="results-placeholder">
                    <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                    </svg>
                    <p>Nhập từ khóa và nhấn "Tìm Kiếm" để bắt đầu</p>
                </div>
            `;
        }

        // Remove doc from table
        function removeDocFromTable(button) {
            const row = button.closest('tr');
            const itemId = row.dataset.itemId;
            
            // Remove from set
            if (itemId) {
                selectedItemIds.delete(itemId);
            }

            
            row.remove();
            
            // Recalculate row numbers
            const rows = document.querySelectorAll('#borrowedItemsTable tr:not(.empty-row)');
            rows.forEach((row, index) => {
                row.querySelector('td:first-child').textContent = index + 1;
            });
            
            // If no rows left, show empty message
            if (rows.length === 0) {
                const tableBody = document.getElementById('borrowedItemsTable');
                const emptyRow = document.createElement('tr');
                emptyRow.className = 'empty-row';
                emptyRow.innerHTML = '<td colspan="6" class="text-center">Chưa có sách nào được thêm vào phiếu mượn</td>';
                tableBody.appendChild(emptyRow);
                itemCounter = 0;
            }
            
            updateDocCount();
        }

        // Update doc count
        function updateDocCount() {
            const rows = document.querySelectorAll('#borrowedItemsTable tr:not(.empty-row)');
            document.getElementById('totalBooks').textContent = rows.length;
        }

        

        // Form submission
        document.getElementById('lendForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const readerCard = document.getElementById('readerInfoCard').style.display !== 'none';
            const borrowDate = document.getElementById('borrowDate').value;
            const dueDate = document.getElementById('dueDate').value;
            
            if (!readerCard || !selectedCardId) {
                alert('Vui lòng chọn độc giả!');
                return;
            }
            
            if (!borrowDate || !dueDate) {
                alert('Vui lòng nhập ngày mượn và ngày hạn trả!');
                return;
            }
            
            if (selectedItemIds.size === 0) {
                alert('Vui lòng thêm ít nhất một tài liệu vào phiếu mượn!');
                return;
            }
            
            
            // Submit form
            this.submit();
        });
    </script>
</body>
</html>
