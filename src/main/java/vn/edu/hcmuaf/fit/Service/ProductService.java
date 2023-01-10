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
    public List<Product> getCheapProducts() {
        List<Product> list = new ArrayList<>();
        String query = "Select product.pid, product.pimage, product.pname, product.pprice_old, " +
                "product.pprice, product.pbranch, product.pstatus, product.pdevice, product.pnumber_device, " +
                "product.pdesciption, product.pamount, category.cname\n" +
                "     \n" +
                " from product join category" +
                "where product.cid = category.cid\n" +
                " order by price esc";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
//            preparedStatement.setInt(1, cid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add( new Product(resultSet.getInt(1),
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
        } catch(SQLException e){
            throw new RuntimeException();
        }
        return list;
    }
    public List<Product> getExpensiveProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "Select product.pid, product.pimage, product.pname, product.pprice_old, " +
                "product.pprice, product.pbranch, product.pstatus, product.pdevice, product.pnumber_device, " +
                "product.pdesciption, product.pamount, category.cname\\n\" +\n" +
                "     \n" +
                " from product join category" +
                "where product.cid = category.cid\n" +
                " order by price esc";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(sql);
//            preparedStatement.setInt(1, pid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return (List<Product>) new Product(resultSet.getInt(1),
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
        } catch(SQLException e){
            throw new RuntimeException();
        }
        return list;
    }

    public List<Product> getAll() {
        return null;
    }
}
