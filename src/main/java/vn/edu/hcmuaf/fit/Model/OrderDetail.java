package vn.edu.hcmuaf.fit.Model;

public class OrderDetail {
    int oid;
    int pid;
    int price;
    int quantity;
    int total;

    public OrderDetail() {
    }

    public OrderDetail(int oid, int pid, int price, int quantity, int total) {
        this.oid = oid;
        this.pid = pid;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
