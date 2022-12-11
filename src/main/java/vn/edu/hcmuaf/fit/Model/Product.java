package vn.edu.hcmuaf.fit.Model;

public class Product {
    private int id;
    private int cate_id;
    private String img;
    private String name;
    private int oldPrice;
    private int price;
    private int amount;
    private String branch;
    private int deviceNumber;
    private String description;

    public Product(){

    }

    public Product(int id, int cate_id, String img, String name, int oldPrice, int price, int amount, String branch, int deviceNumber, String description) {
        this.id = id;
        this.cate_id = cate_id;
        this.img = img;
        this.name = name;
        this.oldPrice = oldPrice;
        this.price = price;
        this.amount = amount;
        this.branch = branch;
        this.deviceNumber = deviceNumber;
        this.description = description;

    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(int oldPrice) {
        this.oldPrice = oldPrice;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public int getDeviceNumber() {
        return deviceNumber;
    }

    public void setDeviceNumber(int deviceNumber) {
        this.deviceNumber = deviceNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", cate_id=" + cate_id +
                ", img='" + img + '\'' +
                ", name='" + name + '\'' +
                ", oldPrice=" + oldPrice +
                ", price=" + price +
                ", amount=" + amount +
                ", branch='" + branch + '\'' +
                ", deviceNumber=" + deviceNumber +
                ", description='" + description + '\'' +
                '}';
    }


}
