package pttkhttt.libman.model;

import java.io.Serializable;

public class Employee extends Member {
    private String position;
    public Employee() {}
    public Employee(Member member, String position) {
        super(member.getMemberId(), member.getFullname(), member.getEmail(), member.getAddress(), member.getBirthDate(), member.getUsername(), member.getPassword());
        this.position = position;
    }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }
}
