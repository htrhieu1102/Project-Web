package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CheckoutService {
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public int addOrderDetails(int order_id, int product_id, int price, int quantity) {
        try {
            statement = DBConnect.getInstall().get();
            if (statement != null) {
                String query = "INSERT INTO `order_details`(o_id, p_id, pprice, od_quantity, od_total) VALUES (?, ?, ?, ?, ?) ";
                preparedStatement = statement.getConnection().prepareStatement(query);
                preparedStatement.setInt(1, order_id);
                preparedStatement.setInt(2, product_id);
                preparedStatement.setInt(3, price);
                preparedStatement.setInt(4, quantity);
                preparedStatement.setInt(5, price * quantity);

                return preparedStatement.executeUpdate();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return order_id;
    }

    public int addCheckout(int user,String card, String bank) {

        String order_query = "INSERT INTO `order`(user_id, o_date, o_status, o_cardnumber, o_bank) VALUES (?,CURRENT_DATE, '0',  ?, ?)";
        try {
            statement = DBConnect.getInstall().get();

            preparedStatement = statement.getConnection().prepareStatement(order_query);
            preparedStatement.setInt(1, user);
            preparedStatement.setString(2, card);
            preparedStatement.setString(3, bank);

            int rs=    preparedStatement.executeUpdate();
            System.out.println(user + "-"+ card + "-"+bank + "-" + rs);

            return rs;
//                statement.close();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int getOrderNew() {
        String order_query = "SELECT max(o_id) FROM `order`";
        try {
            statement = DBConnect.getInstall().get();

            preparedStatement = statement.getConnection().prepareStatement(order_query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return resultSet.getInt(1);
            }
            return -1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
    }
}
