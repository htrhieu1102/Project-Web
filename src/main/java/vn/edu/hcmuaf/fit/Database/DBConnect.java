package vn.edu.hcmuaf.fit.Database;

import java.sql.*;

public class DBConnect {
    String url = "jdbc:mysql://localhost:3306/shopkey";
    String user = "root";
    String pass = "";
    Connection conn;

    static DBConnect install;

    private DBConnect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static DBConnect getInstall() {
        if (install == null) install = new DBConnect();
        return install;
    }

    public Statement get() {
        if (conn == null) return null;
        try {
            return conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            return null;
        }
    }

    public static void main(String[] args) {
        Statement statement = DBConnect.getInstall().get();
        if (statement != null)
            try {
<<<<<<< HEAD
                ResultSet rs = statement.executeQuery("select * from product");
                rs.last();
                System.out.println(rs.getRow());
                rs.beforeFirst();
                while (rs.next()){
                    System.out.println(rs.getString(1)+ " -- "+ rs.getString(2));
=======
                ResultSet resultSet = statement.executeQuery("select  * from product");
//                resultSet.last();
//                System.out.println(resultSet.getRow());
                while (resultSet.next()){
                    System.out.print(resultSet.getString(1) + "--");
                    System.out.print(resultSet.getString(2) + "  ");
                    System.out.println(resultSet.getString(3));
>>>>>>> 8df66b6f1f2bb1171f3f076c77faef235b058fe1
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        else{
            System.out.println("Không có kết nối");
        }
    }
}
