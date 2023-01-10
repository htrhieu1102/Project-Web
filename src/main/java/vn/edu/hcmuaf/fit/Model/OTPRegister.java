package vn.edu.hcmuaf.fit.Model;

public class OTPRegister {
    User user;
    int code;

    public OTPRegister(User user, int code) {
        this.user = user;
        this.code = code;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
