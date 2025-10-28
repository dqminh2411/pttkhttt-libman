package pttkhttt.libman.model;


import java.io.Serializable;
import java.time.LocalDate;

public class BorrowSlip implements Serializable {
    private String borrowSlipId;
    private LocalDate borrowDate;
    private LocalDate dueDate;
    private Reader reader;
    private Librarian librarian;

    public BorrowSlip() {}

    public BorrowSlip(String borrowSlipId, LocalDate borrowDate, LocalDate dueDate, Reader reader, Librarian librarian) {
        this.borrowSlipId = borrowSlipId;
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.reader = reader;
        this.librarian = librarian;
    }

    public String getBorrowSlipId() { return borrowSlipId; }
    public void setBorrowSlipId(String borrowSlipId) { this.borrowSlipId = borrowSlipId; }

    public LocalDate getBorrowDate() { return borrowDate; }
    public void setBorrowDate(LocalDate borrowDate) { this.borrowDate = borrowDate; }

    public LocalDate getDueDate() { return dueDate; }
    public void setDueDate(LocalDate dueDate) { this.dueDate = dueDate; }

    public Reader getReader() { return reader; }
    public void setReader(Reader reader) { this.reader = reader; }

    public Librarian getLibrarian() { return librarian; }
    public void setLibrarian(Librarian librarian) { this.librarian = librarian; }

}

