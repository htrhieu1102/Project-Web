package vn.edu.hcmuaf.fit.Service;
import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductFilterService {
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
public ArrayList<Product> getProduct() {
    List<Product> productList = new ArrayList<>();
    String query = "SELECT product.pid, product.pimage, product.pname, product.pprice_old, product.pprice, product.pbranch, product.pstatus, product.pdevice, product.pnumber_device, product.pdesciption, product.pamount, category.cname\n" +
            "FROM product JOIN category WHERE product.cid = category.cid";

    return null;
}
}
