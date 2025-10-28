package pttkhttt.libman.dao;
import pttkhttt.libman.model.Member;

import java.sql.*;
public class MemberDAO extends DAO{
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    public MemberDAO() {
        try{
            this.con = getConnection();
        }catch(Exception e){
            e.printStackTrace();
        }

    }
    public Member checkMember(Member member)  {
        String q = "SELECT * FROM tblmember WHERE username = ? AND password = ?";
        try{
            ps = con.prepareStatement(q);
            ps.setString(1, member.getUsername());
            ps.setString(2, member.getPassword());
            rs = ps.executeQuery();
            if(rs.next()) {
                return new Member(rs.getInt("memberId"), rs.getString("fullname"), rs.getString("email"), rs.getString("address"),
                        null, rs.getString("username"), null);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
