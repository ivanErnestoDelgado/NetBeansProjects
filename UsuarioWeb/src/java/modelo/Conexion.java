/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;


/**
 *
 * @author SADValenz
 */
public class Conexion {
    public Conexion(){}
    
    public Connection getConexion(){
    Connection con= null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/practica6", "root", "27octiedv@5000");
            
            
        } catch (Exception e) {
            
        }
        
    return con;
    }
    
}
