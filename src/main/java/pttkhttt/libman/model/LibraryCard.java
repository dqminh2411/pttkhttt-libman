package pttkhttt.libman.model;


import java.io.Serializable;
import java.time.LocalDate;

public class LibraryCard implements Serializable {
    private String libraryCardId;
    private LocalDate registerDate;
    private int borrowQuota;
    private String status;
    private Reader reader;

    public LibraryCard() {}
    public LibraryCard(String libraryCardId, int borrowQuota, String status, LocalDate registerDate, Reader reader) {
        this.libraryCardId = libraryCardId;
        this.borrowQuota = borrowQuota;
        this.status = status;
        this.reader = reader;
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

