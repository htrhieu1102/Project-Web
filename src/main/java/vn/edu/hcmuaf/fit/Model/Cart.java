package vn.edu.hcmuaf.fit.Model;

public class Cart{

    private Product pro;
    private int quantity;

    public Cart(){

    }

    public Product getPro() {
        return pro;
    }

    public void setPro(Product pro) {
        this.pro = pro;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return  pro +"-"+ quantity ;
    }

    public static void main(String[] args) {
        Cart c = new Cart();
    }
}

