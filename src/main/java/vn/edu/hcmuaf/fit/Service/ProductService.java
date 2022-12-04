package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DbCon;
import vn.edu.hcmuaf.fit.Model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class ProductService {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductService(Connection con) {
        this.con = con;
    }

    public List<Product> getAllProducts(){
        List<Product> list = new ArrayList<>();

        try{
            query = "select * from product";
            pst =  this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()){
                Product row = new Product();
                row.setId(rs.getString("product_id"));
//                row.setImg(rs.getString("img"));
                row.setBranch(rs.getString("product_branch"));
                row.setName(rs.getString("product_name"));
//                row.setOldPrice(rs.getInt("oldPrice"));
                row.setImg(rs.getString("product_decsription"));
                row.setPrice(rs.getInt("product_price"));

                list.add(row);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        try {
            ProductService pd = new ProductService(DbCon.getConnection());
            System.out.println(pd.getAllProducts().toString());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
