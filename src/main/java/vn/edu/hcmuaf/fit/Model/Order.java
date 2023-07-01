package vn.edu.hcmuaf.fit.Model;

public class Order {
    int oid;
    int userid;
    String odate;
    String ostatus;
    String card;
    String bank;

    public Order() {
    }

    public Order(int oid, int userid, String odate, String ostatus, String card, String bank) {
        this.oid = oid;
        this.userid = userid;
        this.odate = odate;
        this.ostatus = ostatus;
        this.card = card;
        this.bank = bank;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getOdate() {
        return odate;
    }

    public void setOdate(String odate) {
        this.odate = odate;
    }

    public String getOstatus() {
        return ostatus;
    }

    public void setOstatus(String ostatus) {
        this.ostatus = ostatus;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }
}
