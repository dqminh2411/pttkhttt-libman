package pttkhttt.libman.model;


import java.io.Serializable;
import java.time.LocalDate;

public class LibraryCard implements Serializable {
    private String libraryCardId;
    private LocalDate registerDate;
    private int borrowQuota;
    private int borrowingCount;
    private String status;
    private Reader reader;

    public LibraryCard() {}
    public LibraryCard(String libraryCardId, int borrowQuota, String status, LocalDate registerDate, Reader reader, int borrowingCount) {
        this.libraryCardId = libraryCardId;
        this.borrowQuota = borrowQuota;
        this.status = status;
        this.registerDate = registerDate;
        this.borrowingCount = borrowingCount;
        this.reader = reader;
    }

    public LibraryCard(String libraryCardId, Reader reader) {
        this.libraryCardId = libraryCardId;
        this.reader = reader;
    }
    public int getBorrowingCount() {
        return borrowingCount;
    }
    public void setBorrowingCount(int borrowingCount) {
        this.borrowingCount = borrowingCount;
    }
    public LocalDate getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(LocalDate registerDate) {
        this.registerDate = registerDate;
    }

    public int getBorrowQuota() {
        return borrowQuota;
    }

    public void setBorrowQuota(int borrowQuota) {
        this.borrowQuota = borrowQuota;
    }

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    public String getLibraryCardId() { return libraryCardId; }
    public void setLibraryCardId(String libraryCardId) { this.libraryCardId = libraryCardId; }



    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}

