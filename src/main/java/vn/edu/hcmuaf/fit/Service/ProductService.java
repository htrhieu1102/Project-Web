package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<Product> getProduct() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT product.pid, category.cname, product.pimage, product.pname, product.pprice_old, product.pprice, product.pamount, product.pbranch, product.pnumber_device, product.pdesciption\n" +
                "FROM product JOIN category \n" +
                "WHERE product.cid = category.cid";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                productList.add(new Product(resultSet.getInt(1),
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
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getInt(6),
                        resultSet.getInt(7),
                        resultSet.getString(8),
                        resultSet.getInt(9),
                        resultSet.getString(10));
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
    public void addProduct(int cid,String img,String name, int oldPrice, int price, int amount,
                           String branch, int deviceNumber, String description){
        String query = "INSERT INTO product(cid,pimage,pname,pprice_old,pprice,pamount,pbranch,pnumber_device,pdesciption) VALUES\n" +
                "(?,?,?,?,?,?,?,?,?)";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, cid);
            preparedStatement.setString(2,img);
            preparedStatement.setString(3,name);
            preparedStatement.setInt(4,oldPrice);
            preparedStatement.setInt(5,price);
            preparedStatement.setInt(6,amount);
            preparedStatement.setString(7,branch);
            preparedStatement.setInt(8,deviceNumber);
            preparedStatement.setString(9,description);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
