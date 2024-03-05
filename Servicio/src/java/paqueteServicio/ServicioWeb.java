/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paqueteServicio;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author SADValenz
 */
@WebService(serviceName = "ServicioWeb")
public class ServicioWeb {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Sumar")
    public Integer Sumar(@WebParam(name = "num1") int num1, @WebParam(name = "num2") int num2) {
        //TODO write your implementation code here:
        return num1+num2;
    }
}
