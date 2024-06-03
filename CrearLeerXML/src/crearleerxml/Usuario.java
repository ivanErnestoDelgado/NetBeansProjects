/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crearleerxml;
import java.util.ArrayList;

/**
 *
 * @author SADValenz
 */
public class Usuario {
    private String numControl;
    private String nombres;
    private String apellidos;
    private String carrera;
    

    public Usuario(String numControl, String nombres, String apellidos, String carrera) {
        this.numControl = numControl;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.carrera = carrera;
    }

    public String getNumControl() {
        return numControl;
    }

    public void setNumControl(String numControl) {
        this.numControl = numControl;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
    
    
}
