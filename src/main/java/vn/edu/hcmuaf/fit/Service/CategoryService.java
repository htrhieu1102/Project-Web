package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM category";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(new Category(resultSet.getInt(1),
                        resultSet.getString(2)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public void addCategory(String cname) {
        String query = "INSERT INTO category(cname) VALUES (?)";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setString(1, cname);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    public void deleteCategory(int cid) {
        String query = "DELETE FROM category WHERE cid = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, cid);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    public Category getDetailCategory(int cid) {
        String query = "SELECT * FROM category WHERE cid = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, cid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Category(resultSet.getInt(1),
                        resultSet.getString(2));
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return null;
    }
    public void editCategory(int cid, String cname) {
        String query = "UPDATE category SET cname = ? WHERE cid = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setString(1, cname);
            preparedStatement.setInt(2, cid);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
