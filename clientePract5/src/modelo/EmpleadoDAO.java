/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.*;

/**
 *
 * @author SADValenz
 */
public class EmpleadoDAO {
    Conexion conexion;
    
    public EmpleadoDAO(){
    conexion=new Conexion();
    }
    
    public Empleado verificaUsuario(String dni, String contraseña, String privilegio){
        Empleado empleado=null;
        Connection accesoDB=conexion.getConexion();
        try {
            
            PreparedStatement ps=accesoDB.prepareStatement("select * from empleado where dni=? and clave=? and privilegio=?;");
            ps.setString(1, dni);
            ps.setString(2, contraseña);
            ps.setString(3, privilegio);
            
            ResultSet rs= ps.executeQuery();
            if (rs.next()) {
                empleado= new Empleado();
                empleado.setDni(rs.getString(1));
                empleado.setContraseña(rs.getString(2));
                empleado.setApellidos(rs.getString(3));
                empleado.setNombres(rs.getString(4));
                empleado.setPrivilegio(rs.getString(5));
                return empleado;
            }
        } catch (Exception e) {
            
        }
        return empleado;
    }
    public String generarUsuario(String dni, String pass, String apellidos, String nombres, String privilegio){
    String respuesta=null;
    
    Connection accesoBD= conexion.getConexion();
        try {
            PreparedStatement ps= accesoBD.prepareStatement("INSERT INTO `practica6`.`empleado` (`dni`, `clave`, `apellidos`, `nombres`, `privilegio`) VALUES (?,?,?,?,?);");
            ps.setString(1, dni);
            ps.setString(2, pass);
            ps.setString(3, apellidos);
            ps.setString(4, nombres);
            ps.setString(5, privilegio);
            
            
            int rs=ps.executeUpdate();
            
            if(rs>0){
            respuesta="Registro exitoso";
            }
        } catch (Exception e) {
        }
    return respuesta;
    }
}
