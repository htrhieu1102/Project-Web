package vn.edu.hcmuaf.fit.Model;

public class Product {
    private int id;
    private String img;
    private String name;
    private int oldPrice;
    private int price;
    private String branch;
    private String status;
    private String device;
    private int deviceNumber;
    private String description;
    private int amount;
    private String category;
    public Product(){}
    public Product(int id, String img, String name, int oldPrice, int price, String branch, String status, String device, int deviceNumber, String description, int amount, String category) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.oldPrice = oldPrice;
        this.price = price;
        this.branch = branch;
        this.status = status;
        this.device = device;
        this.deviceNumber = deviceNumber;
        this.description = description;
        this.amount = amount;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDevice() {
        return device;
    }

    public void setDevice(String device) {
        this.device = device;
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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
