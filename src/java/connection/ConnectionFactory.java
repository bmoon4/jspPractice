/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;
 import java.sql.Connection;
 import java.sql.DriverManager;
 import java.sql.SQLException;

public class ConnectionFactory {
   private String dbURL="jdbc:mysql://localhost:3306/BBS";
   private String dbID="root";
   private String dbPassword="skrkwk";

    public Connection getConnection() throws SQLException{
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
