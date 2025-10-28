package pttkhttt.libman.model;

import java.io.Serializable;

public class Employee extends Member {
    private String position;
    public Employee() {}


    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }
}
