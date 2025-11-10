package pttkhttt.libman.model;

import java.io.Serializable;

public class Item implements Serializable {
    private String itemId;
    private String position;
    private String status;
    private Document document;

    public Item() {}

    public Item(String itemId, String position, String status, Document document) {
        this.itemId = itemId;
        this.position = position;
        this.status = status;
        this.document = document;
    }

    public Item(String itemId, Document document) {
        this.itemId = itemId;
        this.document = document;
    }

    public String getItemId() { return itemId; }
    public void setItemId(String itemId) { this.itemId = itemId; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }
}
