package Model;

import MyUtils.DBConnection;
import Object.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class UserModel {

    //declare variables
    private Connection con;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String str;
    public ArrayList<User> list;

    /**
     * constructor
     * @throws SQLException 
     */
    public UserModel() throws SQLException {
        try {
            con = DBConnection.getConnection();
            st = con.createStatement();
            pst = null;
            rs = null;
            str = "";
        } catch (SQLException e) {
            throw new SQLException("PLEASE CONNECT TO DATABASE BEFORE START");
        }
    }

    /**
     * Load account
     *
     * @return
     * @throws SQLException
     */
    public ArrayList<User> loadAccount() throws SQLException {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            st = con.createStatement();
            str = "SELECT * FROM `user`";
            rs = st.executeQuery(str);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    String user_ID = rs.getString("userID");
                    String Password = rs.getString("password");
                    String FName = rs.getString("firstname");
                    String LName = rs.getString("lastname");
                    int isSend = rs.getInt("isSendNotification");
                    String Website = rs.getString("website");
                    int Role_ID = rs.getInt("rodeID");
                    String Email = rs.getString("email");

                    listUser.add(new User(user_ID, Password, FName, LName, isSend, Website, Role_ID, Email));
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Can't load games");
        }
        return listUser;
    }

    /**
     * Insert new account
     * @param username
     * @param password
     * @param fname
     * @param lname
     * @param isSend
     * @param website
     * @param RoldeID
     * @param email
     * @throws SQLException 
     */
    public void insertAccount(String username, String password, String fname, String lname, int isSend, String website, int RoldeID, String email) throws SQLException {
        try {
            str = "INSERT INTO `user`(`userID`, `password`, `firstname`, `lastname`, `isSendNotification`, `website`, `rodeID`, `email`)"
                    + "VALUES (?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(str, Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, fname);
            pst.setString(4, lname);
            pst.setInt(5, isSend);
            pst.setString(6, website);
            pst.setInt(7, RoldeID);
            pst.setString(8, email);
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            rs.next();
        } catch (SQLException e) {
            throw new SQLException("Can't insert account");
        }
    }

    /**
     * update account by role id
     * @param username
     * @param RoleID
     * @return
     * @throws SQLException 
     */
    public boolean updateAccount(String username, int RoleID) throws SQLException {
        try {
            str = "UPDATE `user` SET `rodeID`=? WHERE `userID`=?";
            pst = con.prepareStatement(str);

            pst.setInt(1, RoleID);
            pst.setString(2, username);
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new SQLException("Can't update game");
        }
    }

    /**
     * load account by role id
     * @param RoleID
     * @return
     * @throws SQLException 
     */
    public ArrayList<User> LoadUserByRoleID(int RoleID) throws SQLException {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            st = con.createStatement();
            str = "SELECT * FROM `user` Where rodeID = " + RoleID;
            rs = st.executeQuery(str);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    String user_ID = rs.getString("userID");
                    String Password = rs.getString("password");
                    String FName = rs.getString("firstname");
                    String LName = rs.getString("lastname");
                    int isSend = rs.getInt("isSendNotification");
                    String Website = rs.getString("website");
                    int Role_ID = rs.getInt("rodeID");
                    String Email = rs.getString("email");

                    listUser.add(new User(user_ID, Password, FName, LName, isSend, Website, Role_ID, Email));
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Can't load games");
        }
        return listUser;
    }
    
    /**
     * load account by user name
     * @param Username
     * @return
     * @throws SQLException 
     */
    public ArrayList<User> LoadUserByUserName(String Username) throws SQLException {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            st = con.createStatement();
            str = " SELECT * FROM `user` WHERE `userID` = \""
                    + Username +"\" ";
            rs = st.executeQuery(str);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    String user_ID = rs.getString("userID");
                    String Password = rs.getString("password");
                    String FName = rs.getString("firstname");
                    String LName = rs.getString("lastname");
                    int isSend = rs.getInt("isSendNotification");
                    String Website = rs.getString("website");
                    int Role_ID = rs.getInt("rodeID");
                    String Email = rs.getString("email");

                    listUser.add(new User(user_ID, Password, FName, LName, isSend, Website, Role_ID, Email));
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Can't load games");
        }
        return listUser;
    }
    

    /**
     * search username with name of user and username account
     * @param search
     * @return
     * @throws SQLException 
     */
    public ArrayList<User> SearchUser(String search) throws SQLException {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            st = con.createStatement();
            str = " SELECT * FROM `user` WHERE `userID` LIKE \"%"+search+"%\""
                    + " OR `lastName` LIKE \"%"+search+"%\" ";
            rs = st.executeQuery(str);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    String user_ID = rs.getString("userID");
                    String Password = rs.getString("password");
                    String FName = rs.getString("firstname");
                    String LName = rs.getString("lastname");
                    int isSend = rs.getInt("isSendNotification");
                    String Website = rs.getString("website");
                    int Role_ID = rs.getInt("rodeID");
                    String Email = rs.getString("email");

                    listUser.add(new User(user_ID, Password, FName, LName, isSend, Website, Role_ID, Email));
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Can't search");
        }
        return listUser;
    }

}
