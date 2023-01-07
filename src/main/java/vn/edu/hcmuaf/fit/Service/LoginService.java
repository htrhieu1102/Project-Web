package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
                        resultSet.getDate(6));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;

    }
}
