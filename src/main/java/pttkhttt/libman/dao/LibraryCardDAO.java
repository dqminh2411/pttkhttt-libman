package pttkhttt.libman.dao;

import pttkhttt.libman.model.LibraryCard;
import pttkhttt.libman.model.Reader;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LibraryCardDAO extends DAO{
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    public LibraryCardDAO() {
        try{
            this.con = getConnection();
        }catch(Exception e){
            e.printStackTrace();
        }

    }
    public boolean addReader(LibraryCard card){
        String q1 = "INSERT INTO tblmember(fullname, email, address, birthDate, username, password) VALUES (?, ?, ?, ?, ?, ?)";
        String q2 = "INSERT INTO tblreaderlibrarycard(readerId,libraryCardId, registerDate, borrowQuota, status) VALUES ((SELECT memberId FROM tblmember WHERE username = ?), ?, ?, ?, ?)";

        boolean success = false;
        try{
            con.setAutoCommit(false);
            ps = con.prepareStatement(q1);
            ps.setString(1, card.getReader().getFullname());
            ps.setString(2, card.getReader().getEmail());
            ps.setString(3, card.getReader().getAddress());
            ps.setDate(4, java.sql.Date.valueOf(card.getReader().getBirthDate()));
            ps.setString(5, card.getReader().getUsername());
            ps.setString(6, card.getReader().getPassword());
            ps.executeUpdate();

            ps = con.prepareStatement(q2);
            ps.setString(1, card.getReader().getUsername());
            ps.setString(2, card.getLibraryCardId());
            ps.setDate(3, java.sql.Date.valueOf(card.getRegisterDate()));
            ps.setInt(4, card.getBorrowQuota());
            ps.setString(5, card.getStatus());
            ps.executeUpdate();

            con.commit();
            success = true;
        }catch (Exception e){
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        }finally{
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                }
            } catch (SQLException autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
        }
        return success;
    }
   public List<LibraryCard> searchCards(String libraryCardId){
         String query1 = "SELECT mc.libraryCardId, mc.registerDate, mc.borrowQuota, mc.status, " +
                "m.memberId, m.fullname " +
                "FROM tblreaderlibrarycard mc " +
                "JOIN tblmember m ON mc.readerId = m.memberId " +
                "WHERE mc.libraryCardId LIKE ?";
        String query2 = """
                SELECT COUNT(*) AS borrowingCount
                FROM tblborroweditem bi
                JOIN tblborrowslip bs 
                    ON bi.borrowSlipId = bs.borrowSlipId
                WHERE bs.readerId = ?
                AND NOT EXISTS (
                    SELECT 1
                    FROM tblreturneditem ri
                    WHERE ri.borrowedItemId = bi.borrowedItemId
                );
                """;
        
         List<LibraryCard> cards = new ArrayList<>();
         
         try{
              ps = con.prepareStatement(query1);
              ps.setString(1, "%" + libraryCardId + "%");
              rs = ps.executeQuery();
              while(rs.next()){
                Reader reader = new Reader();
                reader.setMemberId(rs.getInt("memberId"));
                reader.setFullname(rs.getString("fullname"));

                LibraryCard card = new LibraryCard();
                card.setLibraryCardId(rs.getString("libraryCardId"));
                card.setRegisterDate(rs.getDate("registerDate").toLocalDate());
                card.setBorrowQuota(rs.getInt("borrowQuota"));
                card.setStatus(rs.getString("status"));
                card.setReader(reader);
                ps = con.prepareStatement(query2);
                ps.setInt(1, reader.getMemberId());
                rs = ps.executeQuery();
                if(rs.next()){
                    card.setBorrowingCount(rs.getInt("borrowingCount"));
                }
                cards.add(card);
              }
         }catch(Exception e){
              e.printStackTrace();
         }
         return cards;
    }
    public LibraryCard getLibraryCardById(String libraryCardId){
        String query = "SELECT * FROM tblreaderlibrarycard WHERE librararyCardId = ?";
        LibraryCard card = null;
        try{
            ps = con.prepareStatement(query);
            ps.setString(1, libraryCardId);
            rs = ps.executeQuery();
            if(rs.next()){
                Reader reader = new Reader();
                reader.setMemberId(rs.getInt("readerId"));

                card = new LibraryCard(
                    rs.getString("libraryCardId"),
                    rs.getInt("borrowQuota"),
                    rs.getString("status"),
                    rs.getDate("registerDate").toLocalDate(),
                    reader,
                        rs.getInt("borrowingCount")
                );
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return card;
    }
}
