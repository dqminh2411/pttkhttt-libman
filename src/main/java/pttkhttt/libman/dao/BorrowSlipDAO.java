package pttkhttt.libman.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import pttkhttt.libman.model.BorrowSlip;
import pttkhttt.libman.model.BorrowedItem;

public class BorrowSlipDAO extends DAO {
     private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    public BorrowSlipDAO() {
        try{
            this.con = getConnection();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public BorrowSlip saveBorrowSlip(BorrowSlip slip, List<BorrowedItem> borrowItems){
        String query1 = "INSERT INTO tblborrowslip (borrowSlipId,borrowDate, dueDate, employeeId, readerId) VALUES (?, ?, ?, ?,?)";
        String query2 = "INSERT INTO tblborroweditem (borrowSlipId, itemId) VALUES (?, ?)";
        String query3 = "UPDATE tblitem SET status = ? WHERE itemId = ?";
        try{
            con.setAutoCommit(false);
            String getIdQuery = "SELECT borrowSlipId FROM tblborrowslip ORDER BY borrowSlipId DESC LIMIT 1";
            ps = con.prepareStatement(getIdQuery);
            rs = ps.executeQuery();
            int nextId = 1;
            if(rs.next()){
                nextId = Integer.parseInt(rs.getString("borrowSlipId").substring(2)) + 1;
            }


            String borrowSlipId = String.format("BS%04d", nextId);
            ps = con.prepareStatement(query1);
            ps.setString(1, borrowSlipId);
            ps.setDate(2, java.sql.Date.valueOf(slip.getBorrowDate()));
            ps.setDate(3, java.sql.Date.valueOf(slip.getDueDate()));
            ps.setInt(4, slip.getLibrarian().getMemberId());
            ps.setInt(5, slip.getLibraryCard().getReader().getMemberId());
            int rowsAffected = ps.executeUpdate();

            // Get the generated borrowSlipId
            if (rowsAffected > 0) {
                slip.setBorrowSlipId(borrowSlipId);
                for (BorrowedItem item : borrowItems) {
                    ps = con.prepareStatement(query2);
                    ps.setString(1, borrowSlipId);
                    ps.setString(2, item.getItem().getItemId());
                    ps.executeUpdate();

                    ps = con.prepareStatement(query3);
                    ps.setString(1, "UNAVAILABLE");
                    ps.setString(2, item.getItem().getItemId());
                    ps.executeUpdate();
                }
            }
            con.commit();

        }catch(Exception e){
            e.printStackTrace();
            try{
                con.rollback();
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }finally{
            try{
                con.setAutoCommit(true);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return slip;
    }
}
