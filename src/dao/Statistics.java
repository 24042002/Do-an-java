package dao;

import connection.MyConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nk172
 */
public class Statistics {

    Connection con = MyConnection.getConnection();
    PreparedStatement ps;
    Statement st;
    ResultSet rs;

    private int total(String tableName) {
        int total = 0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("Select count(*) as 'total' from " + tableName + "");
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    private double totalSale() {
        double total = 0.0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("Select sum(total) as 'total' from purchase");
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    private double todaySale() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        Date date = new Date();
        String today = df.format(date);
        double total = 0.0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("Select sum(total) as 'total' from purchase where p_date = "+ today+ "");
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    private double totalPurchase(int id) {
        double total = 0.0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("Select sum(total) as 'total' from purchase where uid = "+id+ "");
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    private int totalDeliver(String name) {
        int total = 0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("Select count(*) as 'total' from purchase where supplier = '" + name + "'and status = 'Received'");
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    //Admindash
    public void admin() {
        admin.AdminDashboard.jCat.setText(String.valueOf(total("category")));
        admin.AdminDashboard.jProduct.setText(String.valueOf(total("product")));
        admin.AdminDashboard.jUser.setText(String.valueOf(total("user")));
        admin.AdminDashboard.jSupplier.setText(String.valueOf(total("supplier")));
        admin.AdminDashboard.jTotalSale.setText(String.valueOf(totalSale()));
        admin.AdminDashboard.jTodaySale.setText(String.valueOf(todaySale()));

    }
    
    //userdash
    public void user(int id){
        user.UserDashboard.jCat.setText(String.valueOf(total("category")));
        user.UserDashboard.jProduct.setText(String.valueOf(total("product")));
        user.UserDashboard.jPurchase.setText(String.valueOf(totalPurchase(id)));
    }
    
    //supplierdash
    
    public void supplier(String name){
        supplier.SupplierDashboard.jDeliver.setText(String.valueOf(totalDeliver(name)));
    }
}
