package vn.edu.hcmuaf.fit.Model;

import java.util.Date;

public class User {
    private int id;
    private String email;
    private String pass;
    private int phone;
    private Date createdAt;

    public User(int id, String email, String pass, int phone, Date createdAt) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.phone = phone;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
