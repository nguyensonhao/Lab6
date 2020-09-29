package MyUtils;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBConnection {
    static Connection con = null;

    public static Connection getConnection() {
        try {
            String url = "jdbc:mysql://localhost:3306/dbp0006";
            String username = "root";
            String password = "";    
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con = (Connection) DriverManager.getConnection(url, username, password);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return con;
        }
    }
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
