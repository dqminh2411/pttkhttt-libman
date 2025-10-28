package pttkhttt.libman.model;


import java.io.Serializable;
import java.time.LocalDate;

public class Member implements Serializable {
    private int memberId;
    private String fullname;
    private String email;
    private String address;
    private LocalDate birthDate;
    private String username;
    private String password;

    public Member() {}

    public Member(int memberId, String fullname, String email, String address,
                  LocalDate birthDate, String username, String password) {
        this.memberId = memberId;
        this.fullname = fullname;
        this.email = email;
        this.address = address;
        this.birthDate = birthDate;
        this.username = username;
        this.password = password;
    }

    public Member(String fullname, String email, String address, LocalDate birthDate, String username, String password) {
        this.fullname = fullname;
        this.email = email;
        this.address = address;
        this.birthDate = birthDate;
        this.username = username;
        this.password = password;
    }

    public int getMemberId() { return memberId; }
    public void setMemberId(int memberId) { this.memberId = memberId; }

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public LocalDate getBirthDate() { return birthDate; }
    public void setBirthDate(LocalDate birthDate) { this.birthDate = birthDate; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}

