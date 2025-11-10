package pttkhttt.libman.model;

import java.io.Serializable;

public class BorrowedItem implements Serializable {
    private int borrowedItemId;
    private BorrowSlip borrowSlip;
    private Item item;

    public BorrowedItem() {}

    public BorrowedItem(int borrowedItemId, Item item, BorrowSlip borrowSlip) {
        this.borrowedItemId = borrowedItemId;
        this.item = item;
        this.borrowSlip = borrowSlip;
    }
    

    public BorrowedItem(BorrowSlip borrowSlip, Item item) {
        this.borrowSlip = borrowSlip;
        this.item = item;
    }

    public int getBorrowedItemId() { return borrowedItemId; }
    public void setBorrowedItemId(int borrowedItemId) { this.borrowedItemId = borrowedItemId; }

    public BorrowSlip getBorrowSlip() {
        return borrowSlip;
    }

    public void setBorrowSlip(BorrowSlip borrowSlip) {
        this.borrowSlip = borrowSlip;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}

