package vn.edu.hcmuaf.fit.Model;

public class CategoryController {
    private int cid;
    private String cname;
public CategoryController() {}
    public CategoryController(int cid, String cname) {
        this.cid = cid;
        this.cname = cname;
    }
     public int getCid() {
        return cid;
        }
     public void setId(int cid) {
        this.cid = cid;
    }
    public String getCname() {
        return cname;
    }
    public void setName(String cname) {
        this.cname = cname;
    }
    
}