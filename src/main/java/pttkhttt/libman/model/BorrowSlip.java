package pttkhttt.libman.model;


import java.io.Serializable;
import java.time.LocalDate;

public class BorrowSlip implements Serializable {
    private String borrowSlipId;
    private LocalDate borrowDate;
    private LocalDate dueDate;
    private LibraryCard libraryCard;
    private Librarian librarian;

    public BorrowSlip() {}

    public BorrowSlip(String borrowSlipId, LocalDate borrowDate, LocalDate dueDate, LibraryCard libraryCard, Librarian librarian) {
        this.borrowSlipId = borrowSlipId;
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.libraryCard = libraryCard;
        this.librarian = librarian;
    }

    public BorrowSlip(LocalDate borrowDate, LocalDate dueDate, LibraryCard libraryCard, Librarian librarian) {
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.libraryCard = libraryCard;
        this.librarian = librarian;
    }

    public String getBorrowSlipId() { return borrowSlipId; }
    public void setBorrowSlipId(String borrowSlipId) { this.borrowSlipId = borrowSlipId; }

    public LocalDate getBorrowDate() { return borrowDate; }
    public void setBorrowDate(LocalDate borrowDate) { this.borrowDate = borrowDate; }

    public LocalDate getDueDate() { return dueDate; }
    public void setDueDate(LocalDate dueDate) { this.dueDate = dueDate; }

    public LibraryCard getLibraryCard() {
        return libraryCard;
    }

    public void setLibraryCard(LibraryCard libraryCard) {
        this.libraryCard = libraryCard;
    }

    public Librarian getLibrarian() { return librarian; }
    public void setLibrarian(Librarian librarian) { this.librarian = librarian; }

}

