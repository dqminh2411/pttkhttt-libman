package pttkhttt.libman.dao;

import pttkhttt.libman.model.Document;
import pttkhttt.libman.model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DocumentDAO extends DAO{
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    public DocumentDAO() {
        try{
            this.con = getConnection();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public int getTotalSearchResult(String key){
        String q1 = "SELECT COUNT(*) FROM tbldocument WHERE title LIKE ?";
//        String q2 = "SELECT COUNT(*) FROM tblitem WHERE documentId = ? and status LIKE ?";
        try{
            ps = con.prepareStatement(q1);
            ps.setString(1, "%"+key+"%");
            rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    public List<Document> searchDocuments(String key, int page, int pageSize)  {
        String q1 = "SELECT * FROM tbldocument WHERE title LIKE ?  LIMIT ? OFFSET ?";
//        String q2 = "SELECT 1 FROM tblitem WHERE documentId = ? and status = ?";
        List<Document> documents = new ArrayList<>();
        try{
            ps = con.prepareStatement(q1);
            ps.setString(1, "%"+key+"%");
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize * (page - 1));
            rs = ps.executeQuery();
            while(rs.next()){
                documents.add(new Document(
                        rs.getString("documentId"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getInt("publishYear"),
                        rs.getString("publisher"),
                        rs.getString("language"),
                        rs.getString("type"),
                        rs.getString("genre"),
                        rs.getInt("pages"),
                        rs.getString("description"),
                        rs.getString("imgPath")
                ));

//                String[] statusArr = {"AVAILABLE",  "ON_SITE_READ_ONLY","UNAVAILABLE"};
//                for (Document document : documents) {
//                    for (String s : statusArr) {
//                        ps = con.prepareStatement(q2);
//                        ps.setString(1, document.getDocumentId());
//                        ps.setString(2, s);
//                        rs = ps.executeQuery();
//                        if (rs.next()) {
//                            document.setStatus(s);
//                            break;
//                        }
//                    }
//                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return documents;
    }
    public Document getDocumentById(String id){
        String q1 = "SELECT * FROM tbldocument where documentId = ?";
        String q2 = "SELECT 1 FROM tblitem WHERE documentId = ? and status = ?";
        Document document = null;
        try{
            ps = con.prepareStatement(q1);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                document = new Document(
                        rs.getString("documentId"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getInt("publishYear"),
                        rs.getString("publisher"),
                        rs.getString("language"),
                        rs.getString("type"),
                        rs.getString("genre"),
                        rs.getInt("pages"),
                        rs.getString("description"),
                        rs.getString("imgPath")
                );
            }
            String[] statusArr = {"AVAILABLE",  "ON_SITE_READ_ONLY","UNAVAILABLE"};
            for (String s : statusArr) {
                ps = con.prepareStatement(q2);
                ps.setString(1, document.getDocumentId());
                ps.setString(2, s);
                rs = ps.executeQuery();
                if (rs.next()) {
                    document.setStatus(s);
                    break;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return document;
    }
    public List<Item> getDocumentItemsByDocId(String id){
        String query = """
        SELECT i.itemId, i.status, i.position,d.documentId, d.title, d.author, d.publishYear 
        FROM tblitem i 
        JOIN tbldocument d 
        ON i.documentId = d.documentId 
        WHERE i.documentId LIKE ?  
        """;
        List<Item> items = new ArrayList<>();
        try{
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + id + "%");
            rs = ps.executeQuery();
            while(rs.next()){
                Document document = new Document();
                document.setDocumentId(rs.getString("documentId"));
                document.setTitle(rs.getString("title"));
                document.setAuthor(rs.getString("author"));
                document.setPublishYear(rs.getInt("publishYear"));
                Item item = new Item(
                        rs.getString("itemId"),
                        rs.getString("position"),
                        rs.getString("status"),
                        document
                );
                items.add(item);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return items;
    }
    public Item getItemById(String id){
        String q = "SELECT i.itemId, i.status, i.position,d.documentId, d.title, d.author, d.publishYear " +
                "FROM tblitem i " +
                "JOIN tbldocument d " +
                "ON i.documentId = d.documentId " +
                "WHERE i.itemId = ? ";
        Item item = null;
        try{
            ps = con.prepareStatement(q);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                Document document = new Document();
                document.setDocumentId(rs.getString("documentId"));
                document.setTitle(rs.getString("title"));
                document.setAuthor(rs.getString("author"));
                document.setPublishYear(rs.getInt("publishYear"));
                item = new Item(
                        rs.getString("itemId"),
                        rs.getString("position"),
                        rs.getString("status"),
                        document
                );
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return item;
    }
}
