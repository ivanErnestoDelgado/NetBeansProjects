/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package basedatospg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author SADValenz
 */
public class Insert1 {
    
     public static void main(String[] args) {
        Insert1 conexion=new Insert1();
        conexion.connectDatabase();
    }
    
    public void connectDatabase() {
                
        try {
            // We register the PostgreSQL driver
            // Registramos el driver de PostgresSQL
            try { 
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
            }
            Connection connection = null;
            // Database connect
            // Conectamos con la base de datos
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost/Michican",
                    "administrador_clientes", "admon");
 
            boolean valid = connection.isValid(50000);
            
            
            int id=10;
            String nombre="Miguel";
            String Apellido="Robles";
            String Telefono="6682401203";
            String Correo="el_Funko@hotmail.com";
            String Sexo="Hombre";
            
            PreparedStatement insercionCliente = connection.prepareStatement(
                        "insert into CLIENTE VALUES(?,?,?,?,?,?);");
            
            insercionCliente.setInt(1, id);
            
            insercionCliente.setString(2, nombre);
            insercionCliente.setString(3, Apellido);
            insercionCliente.setString(4, Telefono);
            insercionCliente.setString(5, Correo);
            insercionCliente.setString(6, Sexo);
            
            insercionCliente.execute();
                
                
                System.out.println("Registro insertado");
                
        } catch (java.sql.SQLException sqle) {
            System.out.println("Error: " + sqle);
        }
    } 
}
