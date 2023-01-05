package vn.edu.hcmuaf.fit.Database;

import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO extends DBConnect{
    public List<Category> getAll() throws SQLException {
        List<Category> list = new ArrayList<>();
        String sql = "Select [id]\n" +
                "   , [name]\n" +
                "   from [dbo].[Category]";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
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
    public Category getCategoryById(int id) {
        String sql = "select * from category where id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                Category c = new Category(rs.getInt("id"),
                                    rs.getString("name"));
                return c;
            }
        }catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Product> getExpensiveProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "Select top 5 [id]\n"
                +"      ,[img]\n"
                +"      ,[name]\n"
                +"      ,[oldPrice]\n" +
                "       ,[price]\n" +
                "       ,[branch]\n" +
                "       ,[status]\n" +
                "       ,[device]\n" +
                "       ,[deviceNumber]\n" +
                "       ,[description]\n" +
                "       ,[amount]\n" +
                "       ,[category]\n" +
                " from [dbo].[product]\n" +
                " order by price desc";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setOldPrice(rs.getInt("oldPrice"));
                p.setPrice(rs.getInt("price"));
                p.setBranch(rs.getString("branch"));
                p.setStatus(rs.getString("status"));
                p.setDevice(rs.getString("device"));
                p.setDeviceNumber(rs.getInt("deviceNumber"));
                p.setDescription(rs.getString("description"));
                p.setAmount(rs.getInt("amount"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    public List<Product> getCheapProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "Select top 5 [id]\n"
                +"      ,[img]\n"
                +"      ,[name]\n"
                +"      ,[oldPrice]\n" +
                "       ,[price]\n" +
                "       ,[branch]\n" +
                "       ,[status]\n" +
                "       ,[device]\n" +
                "       ,[deviceNumber]\n" +
                "       ,[description]\n" +
                "       ,[amount]\n" +
                "       ,[category]\n" +
                " from [dbo].[product]\n" +
                " order by price esc";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setOldPrice(rs.getInt("oldPrice"));
                p.setPrice(rs.getInt("price"));
                p.setBranch(rs.getString("branch"));
                p.setStatus(rs.getString("status"));
                p.setDevice(rs.getString("device"));
                p.setDeviceNumber(rs.getInt("deviceNumber"));
                p.setDescription(rs.getString("description"));
                p.setAmount(rs.getInt("amount"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
}
