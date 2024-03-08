/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pruebasqlite;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author SADValenz
 */
public class Connect {
    
    public static void connect() throws ClassNotFoundException {
        Connection conn = null;
        try {
                        Class.forName("org.sqlite.JDBC");

            // db parameters
            String url = "jdbc:sqlite:C:/Users/SADValenz/Desktop/proyecto/my wea.db";
            // create a connection to the database
            conn = DriverManager.getConnection(url);
            
            System.out.println("Connection to SQLite has been established.");
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
    }
    public static void main(String[] args) throws ClassNotFoundException {
        connect();
    }
    

}
