package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoginService {
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public User login(String user, String pass) {
        String query = "SELECT * \n" +
                "FROM USER\n" +
                "WHERE USER.user_email = ? and USER.user_password = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new User(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getDate(6),
                        resultSet.getInt(7));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;

    }
    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM user";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(new User(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getDate(6),
                        resultSet.getInt(7)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public void permission(int id, int isAdmin) {
        String query = "UPDATE user SET isAdmin = ? WHERE user_id = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, isAdmin);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    public List<User> searchNameUser(String text) {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM user WHERE user_name like ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setString(1, "%"+text+"%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(new User(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getDate(6),
                        resultSet.getInt(7)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public void changeInformation(int id,String name, int number) {
        String query = "UPDATE user SET user_name = ?, user_phone = ? WHERE user_id = ?";
        try {
            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, number);
            preparedStatement.setInt(3, id);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
