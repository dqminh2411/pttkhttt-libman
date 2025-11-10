package pttkhttt.libman.model;

import java.time.LocalDate;

public class Reader extends Member{
    public Reader() {}
    public Reader(int memberId, String fullname, String email, String address, LocalDate birthDate, String username, String password) {
        super(memberId, fullname, email, address, birthDate, username, password);
    }
    public Reader(int memberId, String fullname, String email){
        this.setMemberId(memberId);
        this.setFullname(fullname);
        this.setEmail(email);
    }
    public Reader(String fullname, String email, String address, LocalDate birthDate, String username, String password) {
        super(fullname, email, address, birthDate, username, password);
    }
}
