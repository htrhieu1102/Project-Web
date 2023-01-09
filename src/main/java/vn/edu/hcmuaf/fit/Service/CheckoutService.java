package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class CheckoutService {
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public void addOrderDetails(int order_id, int product_id, int price, int quantity) {
        try {
            statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "INSERT INTO order_details(o_id, p_id, pprice, od_quantity, od_total) VALUES (?, ?, ?, ?, ?) ";
                preparedStatement = statement.getConnection().prepareStatement(query);
                preparedStatement.setInt(1, order_id);
                preparedStatement.setInt(2, product_id);
                preparedStatement.setInt(3, price);
                preparedStatement.setInt(4, quantity);
                preparedStatement.setInt(5, price * quantity);

                preparedStatement.executeUpdate();
                statement.close();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addCheckout(String card, String bank) {
        String order_query = "INSERT INTO order(o_date, o_cardnumber, o_bank) VALUES (CURRENT_DATE, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            statement = DBConnect.getInstall().get();

            preparedStatement = statement.getConnection().prepareStatement(order_query);
//            preparedStatement.setString(1, name);
//            preparedStatement.setString(2, phone);
//            preparedStatement.setString(3, email);
//            preparedStatement.setString(4, street);
//            preparedStatement.setString(5, district);
//            preparedStatement.setString(6, city);
            preparedStatement.setString(1, card);
            preparedStatement.setString(2, bank);

            preparedStatement.executeUpdate();
//                statement.close();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
