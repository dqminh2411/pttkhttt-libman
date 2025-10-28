package pttkhttt.libman.model;


import java.io.Serializable;

public class Document implements Serializable {
    private String documentId;
    private String title;
    private String author;
    private int publishYear;
    private String publisher;
    private String language;
    private String type;
    private String genre;
    private int pages;

    public Document() {}

    public Document(String documentId, String title, String author, int publishYear,
                    String publisher, String language, String type, String genre, int pages) {
        this.documentId = documentId;
        this.title = title;
        this.author = author;
        this.publishYear = publishYear;
        this.publisher = publisher;
        this.language = language;
        this.type = type;
        this.genre = genre;
        this.pages = pages;
    }

    public String getDocumentId() { return documentId; }
    public void setDocumentId(String documentId) { this.documentId = documentId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public int getPublishYear() { return publishYear; }
    public void setPublishYear(int publishYear) { this.publishYear = publishYear; }

    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }

    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public int getPages() { return pages; }
    public void setPages(int pages) { this.pages = pages; }
}
