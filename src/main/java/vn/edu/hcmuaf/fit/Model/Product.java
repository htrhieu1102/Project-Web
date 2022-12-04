package vn.edu.hcmuaf.fit.Model;

public class Product {
    private String product_id;
    private String img;
    private String branch;
    private String name;
    private int oldPrice;
    private int price;

    public Product() {

    }

    public Product(String product_id, String img, String branch, String name, int oldPrice, int price) {
        this.product_id = product_id;
        this.img = img;
        this.branch = branch;
        this.name = name;
        this.oldPrice = oldPrice;
        this.price = price;
    }

    public String getId() {
        return product_id;
    }

    public void setId(String product_id) {
        this.product_id = product_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
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

    @Override
    public String toString() {
        return "Product{" +
                "product_id='" + product_id + '\'' +
                ", branch='" + branch + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }

    //    @Override
//    public String toString() {
//        return "Product{" +
//                "id=" + id +
//                ", img='" + img + '\'' +
//                ", branch='" + branch + '\'' +
//                ", name='" + name + '\'' +
//                ", oldPrice=" + oldPrice +
//                ", price=" + price +
//                '}';
//    }
}
