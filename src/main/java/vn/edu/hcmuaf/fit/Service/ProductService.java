package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Database.DbCon;
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
        String query = "SELECT product.pid, product.pimage, product.pname, product.pprice_old, product.pprice, product.pbranch, product.pstatus, product.pdevice, product.pnumber_device, product.pdesciption, product.pamount, category.cname\n" +
                "FROM product JOIN category WHERE product.cid = category.cid";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                productList.add(new Product(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getInt(4),
                        resultSet.getInt(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getString(8),
                        resultSet.getInt(9),
                        resultSet.getString(10),
                        resultSet.getInt(11),
                        resultSet.getString(12)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        System.out.println(productList.size());
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
                return new Product(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getInt(4),
                        resultSet.getInt(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getString(8),
                        resultSet.getInt(9),
                        resultSet.getString(10),
                        resultSet.getInt(11),
                        resultSet.getString(12));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
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
                pro.setImg(resultSet.getString(2));
                pro.setName(resultSet.getString(3));
                pro.setOldPrice(resultSet.getInt(4));
                pro.setPrice(resultSet.getInt(5));
                pro.setBranch(resultSet.getString(6));
                pro.setStatus(resultSet.getString(7));
                pro.setDevice(resultSet.getString(8));
                pro.setDeviceNumber(resultSet.getInt(9));
                pro.setDescription(resultSet.getString(10));
                pro.setAmount(resultSet.getInt(11));
                pro.setCategory(resultSet.getString(12));

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

        System.out.println(ps.findById(1));
//        System.out.println((ps.getProduct().toString()));
//        System.out.println(ps.getCartProducts(products));
    }
}
