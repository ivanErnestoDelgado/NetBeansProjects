/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Principal;

import Principal.modelos.administrador;
import Principal.modelos.cliente;
import Principal.modelos.mascota;
import Principal.modelos.servicio;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author SADValenz
 */
public class OperacionesBD {

    public cliente buscarCliente(String contrasena, String correo) {
        try {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
            }
            Connection connection = null;
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost/Michican",
                    "postgres", "27octiedv@5000");

            PreparedStatement consulta = connection.prepareStatement(
                    "select * from cliente where correo=? and contrasena=?;");

            consulta.setString(1, correo);
            consulta.setString(2, contrasena);
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                int idClienteEncontrado = resultado.getInt(1);
                String nombreEncontrado = resultado.getString(2);
                String apellidoEncontrado = resultado.getString(3);
                String telefonoEncontrado = resultado.getString(4);
                String correoEncontrado = resultado.getString(5);
                String sexoEncontrado = resultado.getString(6);
                String contrasenaEncontrada = resultado.getString(7);

                cliente clienteEncontrado;
                if (!correoEncontrado.equals("")) {
                    clienteEncontrado = new cliente(idClienteEncontrado, nombreEncontrado,
                            apellidoEncontrado, telefonoEncontrado, correoEncontrado,
                            sexoEncontrado, contrasenaEncontrada);
                    return clienteEncontrado;
                }
            }
        } catch (java.sql.SQLException sqle) {
            System.out.println("Error en PostgreSQL: " + sqle);
        }
        return null;
    }
    public ArrayList<mascota> buscarMascotas(int idCliente) {
        ArrayList<mascota> mascotas=new ArrayList();
        try {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
            }
            Connection connection = null;
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost/Michican",
                    "postgres", "27octiedv@5000");

            PreparedStatement consulta = connection.prepareStatement(
                    "select * from mascota where id_cliente=?;");

            consulta.setInt(1, idCliente);
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {

                int id_mascota = resultado.getInt(1);
                String nombre = resultado.getString(2);
                String especie = resultado.getString(3);
                String raza = resultado.getString(4);
                Date fechaNacimiento = resultado.getDate(5);
                int id_cliente = resultado.getInt(6);

                mascota mascotaEncontrada;
                if (!nombre.equals("")) {
                    mascotaEncontrada = new mascota(id_mascota, nombre,
                            especie, raza, fechaNacimiento,
                            idCliente);
                    mascotas.add(mascotaEncontrada);
                }
            }
            if(mascotas.size()>1)return mascotas;
        } catch (java.sql.SQLException sqle) {
            System.out.println("Error en PostgreSQL: " + sqle);
        }
        return null;
    }
    public administrador buscarAdministrador(String contrasena, String correo) {
        try {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
            }
            Connection connection = null;
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost/Michican",
                    "postgres", "27octiedv@5000");

            PreparedStatement consulta = connection.prepareStatement(
                    "select * from administrador where correo=? and contrasena=?;");

            consulta.setString(1, correo);
            consulta.setString(2, contrasena);
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                int id_administrador=resultado.getInt(1);
                String nombreEncontrado=resultado.getString(2);
                String apellidoEncontrado=resultado.getString(3);
                String correoEncontrado=resultado.getString(4);
                String contrasenaEncontrada=resultado.getString(5);
                
                administrador administradorEncontrado;
                if (!nombreEncontrado.equals("")) {
                    administradorEncontrado=new administrador(id_administrador, nombreEncontrado, 
                                        apellidoEncontrado, correoEncontrado, contrasenaEncontrada);
                    return administradorEncontrado;
                }
            }
        } catch (java.sql.SQLException sqle) {
            System.out.println("Error en PostgreSQL: " + sqle);
        }
        return null;
    }
    public ArrayList<servicio> devolverServicios(){
        ArrayList<servicio> servicios=new ArrayList();
        try {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
            }
            Connection connection = null;
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost/Michican",
                    "postgres", "27octiedv@5000");

            PreparedStatement consulta = connection.prepareStatement(
                    "select * from servicio;");
            
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                int id_servicio=resultado.getInt(1);
                String nombre=resultado.getString(2);
                String descripcion=resultado.getString(3);
                float costo=resultado.getFloat(4);

                servicio servicioEncontrado;
                if (!nombre.equals("")) {
                    servicioEncontrado = new servicio(id_servicio,nombre,descripcion,costo);
                    servicios.add(servicioEncontrado);
                }
            }
            if(servicios.size()>1)return servicios;
        } catch (java.sql.SQLException sqle) {
            System.out.println("Error en PostgreSQL: " + sqle);
        }
        return null;
    }
}
