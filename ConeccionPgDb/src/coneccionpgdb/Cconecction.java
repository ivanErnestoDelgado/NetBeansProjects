
package coneccionpgdb;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;


public class Cconecction {
    Connection conectar = null;
    String Usuario = "postgres";
    String Contrasena = "";
    String Bd = "michican";
    String Ip = "localhost";
    String Puerto = "5432";
    
    String cadena = "jdbc:postgresql://"+Ip+":"+Puerto+"/"+Bd; 
       
    public  Connection establecerConexion(){
        try {
            Class.forName("org.postgresql.Driver");
                       conectar=DriverManager.getConnection(cadena,Usuario,Contrasena);
                      JOptionPane.showMessageDialog(null, "CONEXION EXITOSA A LA BASE DE DATOS ");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null , "ERROR AL CONECTAR A LA BASE DE DATOS " + e.toString());
        }
        return conectar;
    } 
    }