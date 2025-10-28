package pttkhttt.libman.dao;

import pttkhttt.libman.model.LibraryCard;
import pttkhttt.libman.model.Reader;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
