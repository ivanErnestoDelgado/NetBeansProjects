/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author SADValenz
 */
public class prueba {
    public static void main(String[] args) {
        EmpleadoDAO emp= new EmpleadoDAO();
        Empleado empleado= emp.verificaUsuario("3", "4", "Gerente");
        System.out.println(empleado.getDni()+"    "+empleado.getContraseña()+"    "+empleado.getNombres()+"   "+empleado.getApellidos()+"   "+empleado.getPrivilegio());
    }
}
