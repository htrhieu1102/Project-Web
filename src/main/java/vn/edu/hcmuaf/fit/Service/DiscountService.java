package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.Discount;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DiscountService {
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public Discount getDiscount (String discount_code){
        Discount discount = null;
        try {
            String query = "SELECT * FROM DISCOUNT WHERE d_name = ?";

            statement = DBConnect.getInstall().get();
            preparedStatement = statement.getConnection().prepareStatement(query);
            preparedStatement.setString(1, discount_code);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                discount = new Discount();
                discount.setId(resultSet.getInt(1));
                discount.setName(resultSet.getString(2));
                discount.setStart_date(resultSet.getDate(3));
                discount.setEnd_date(resultSet.getDate(4));
                discount.setRate(resultSet.getFloat(5));

                return discount;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return discount;
    }
}
