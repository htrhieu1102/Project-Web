package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.Cart;
import vn.edu.hcmuaf.fit.Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ProductService {
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<Product> getProduct() {
        List<Product> productList = new ArrayList<>();

        String query = "SELECT product.pid, category.cid, product.pimage, product.pname, product.pprice_old, product.pprice, product.pamount, product.pbranch, product.pnumber_device, product.pdesciption " +
                "FROM product JOIN category ON product.pid = category.cid";

        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                productList.add(new Product(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getInt(6),
                        resultSet.getInt(7),
                        resultSet.getString(8),
                        resultSet.getInt(9),
                        resultSet.getString(10)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    public Product getProductDetail(int pid) {
        String query = "SELECT *\n" +
                "FROM product\n" +
                "WHERE product.pid = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, pid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return (new Product(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getInt(6),
                        resultSet.getInt(7),
                        resultSet.getString(8),
                        resultSet.getInt(9),
                        resultSet.getString(10)));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public void deleteProduct(int pid) {
        String query = "DELETE FROM product WHERE product.pid = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, pid);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    public void addProduct(int cid, String img, String name, int oldPrice, int price, int amount,
                           String branch, int deviceNumber, String description) {
        String query = "INSERT INTO product(cid,pimage,pname,pprice_old,pprice,pamount,pbranch,pnumber_device,pdesciption) VALUES\n" +
                "(?,?,?,?,?,?,?,?,?)";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, cid);
            preparedStatement.setString(2, img);
            preparedStatement.setString(3, name);
            preparedStatement.setInt(4, oldPrice);
            preparedStatement.setInt(5, price);
            preparedStatement.setInt(6, amount);
            preparedStatement.setString(7, branch);
            preparedStatement.setInt(8, deviceNumber);
            preparedStatement.setString(9, description);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    public void editProduct(int cid, String img, String name, int oldPrice, int price, int amount,
                            String branch, int deviceNumber, String description, int pid) {
        String query = "UPDATE product SET\n" +
                "cid = ?,\n" +
                "pimage = ?,\n" +
                "pname = ?,\n" +
                "pprice_old = ?,\n" +
                "pprice = ?,\n" +
                "pamount = ?,\n" +
                "pbranch = ?,\n" +
                "pnumber_device = ?,\n" +
                "pdesciption = ?\n" +
                "WHERE pid = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, cid);
            preparedStatement.setString(2, img);
            preparedStatement.setString(3, name);
            preparedStatement.setInt(4, oldPrice);
            preparedStatement.setInt(5, price);
            preparedStatement.setInt(6, amount);
            preparedStatement.setString(7, branch);
            preparedStatement.setInt(8, deviceNumber);
            preparedStatement.setString(9, description);
            preparedStatement.setInt(10, pid);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    public List<Product> searchNameProduct(String text) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT product.pid, category.cname, product.pimage, product.pname, product.pprice_old, product.pprice, product.pamount, product.pbranch, product.pnumber_device, product.pdesciption\n" +
                "FROM product JOIN category \n" +
                "WHERE product.cid = category.cid AND product.pname like ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setString(1, "%"+text+"%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(new Product(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getInt(6),
                        resultSet.getInt(7),
                        resultSet.getString(8),
                        resultSet.getInt(9),
                        resultSet.getString(10)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public Product findById(int id){
        Product pro = null;
        try {
            String query1 = "select * from product where product.pid = ?";

            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query1);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                pro = new Product();
                pro.setId(resultSet.getInt(1));
                pro.setCate_id(resultSet.getInt(2));
                pro.setImg(resultSet.getString(3));
                pro.setName(resultSet.getString(4));
                pro.setOldPrice(resultSet.getInt(5));
                pro.setPrice(resultSet.getInt(6));
                pro.setAmount(resultSet.getInt(7));
                pro.setBranch(resultSet.getString(8));
                pro.setDeviceNumber(resultSet.getInt(9));
                pro.setDescription(resultSet.getString(10));


                return pro;
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                preparedStatement.close();
            } catch (Exception e){

            }
        }
        return pro;
    }

    public static void main(String[] args) {
        ProductService ps = new ProductService();
        ArrayList<Cart> products = new ArrayList<Cart>();

        System.out.println(ps.getProduct().toString());
//        System.out.println((ps.getProduct().toString()));
//        System.out.println(ps.getCartProducts(products));
    }
}
