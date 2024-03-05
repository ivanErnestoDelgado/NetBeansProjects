/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservices;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import modelo.*;


/**
 *
 * @author SADValenz
 */
@WebService(serviceName = "WSGestionUsuario")
public class WSGestionUsuario {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Validar")
    public Empleado Validar(@WebParam(name = "dni") String dni, @WebParam(name = "pass") String pass, @WebParam(name = "privilegio") String privilegio) {
        EmpleadoDAO emp= new EmpleadoDAO();
        Empleado empleado= emp.verificaUsuario(dni,pass,privilegio);
        return empleado;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Registrar")
    public String Registrar(@WebParam(name = "dni") String dni, @WebParam(name = "pass") String pass, @WebParam(name = "apellidos") String apellidos, @WebParam(name = "nombres") String nombres, @WebParam(name = "privilegios") String privilegios) {
        EmpleadoDAO emp=new EmpleadoDAO();
        String respuesta=emp.generarUsuario(dni, pass, apellidos, nombres, privilegios);
        return respuesta;
    }
}
