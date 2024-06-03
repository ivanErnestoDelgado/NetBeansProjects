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
public class BaseDatosPG {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BaseDatosPG conexion=new BaseDatosPG();
        conexion.connectDatabase();
    }
     public void connectDatabase() {
        try {
            
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
                    "cliente_general", "cliente");
 
            boolean valid = connection.isValid(50000);
            
            PreparedStatement materias = connection.prepareStatement(
                        "select * from Mascotas_Amos;");
                
                ResultSet resultado = materias.executeQuery();
                
                while (resultado.next()) {
                    System.out.println(resultado.getString(1));
                }
                
        } catch (java.sql.SQLException sqle) {
            System.out.println("Error: " + sqle);
        }
    } 
    
}
