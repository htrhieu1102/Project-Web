package vn.edu.hcmuaf.fit.Model;

public class ForgotPassword {
    String email;
    int code;

    public ForgotPassword(String email, int code) {
        this.email = email;
        this.code = code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
