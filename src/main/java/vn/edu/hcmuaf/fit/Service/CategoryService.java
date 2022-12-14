package vn.edu.hcmuaf.fit.Service;

import com.microsoft.sqlserver.jdbc.SQLServerDatabaseMetaData;
import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Database.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {
    public List<Category> getALl() throws SQLException {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [id] \n"
                + "          ,[name]  "
                + "FROM [dbo].[Category]";
    try {
        PreparedStatement st = statement.getConnection().prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Category c = new Category(rs.getInt("id"),
                    rs.getString("name"));
            list.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
        return list;
    }
}
