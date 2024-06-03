
package pruebasherlock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author aleja
 */
public class Oficina {
    List<Carta> col1 = new ArrayList<>();
    List<Carta> col2 = new ArrayList<>();
    List<Carta> col3 = new ArrayList<>();
    List<Carta> col4 = new ArrayList<>();
    //Constructor
    public Oficina(){
    }
    //Método usado para mandar a la escena del crimen cuando se use un poder
    public void descartarCartas(){
        
    }
    //Método usado para imprimir los elementos dentro de la oficina
    public void imprimirListas() {
        System.out.println(Carta.ANSI_YELLOW+"Lista de cartas de la oficina");
        System.out.println("Columna 1:");
        for(Carta carta: col1){
            imprimirColumna(carta);
        }
        System.out.println("Columna 2:");
        for(Carta carta: col2){
            imprimirColumna(carta);
        }
        System.out.println("Columna 3:");
        for(Carta carta: col3){
            imprimirColumna(carta);
        }
        System.out.println("Columna 4:");
        for(Carta carta: col4){
            imprimirColumna(carta);
        }
    }
    //Metodo para imprimir la coumna ingresada
    public void imprimirColumna(Carta carta) {
        if (carta.getValorAmenaza() == null) {
            System.out.println(Carta.ANSI_CYAN + "|" + carta.getValoresInvestigacion() + "|");
        } else {
            System.out.println(Carta.ANSI_RED + "|" + carta.getValorAmenaza() + "|");
        }
    }
    //Recibirá una carta a insertar y la columna en que quiera que se inserte la carta especificada
    public void insertarCarta(Carta c,int columna){
        List<Carta> columnaSeleccionada = new ArrayList<>();
        switch (columna) {
            case 1:
                columnaSeleccionada=col1;
                break;
            case 2:
                columnaSeleccionada=col2;
                break;
            case 3:
                columnaSeleccionada=col3;
                break;
            case 4:
                columnaSeleccionada=col4;   
                break;
            default:
                throw new IndexOutOfBoundsException(Carta.ANSI_YELLOW+"Ingrese número valido");
        }
        if(columnaSeleccionada != null){
            if(esValidoInsertar(c, columnaSeleccionada)){
                columnaSeleccionada.add(c);
            }else{
                throw new IllegalArgumentException("El patrón no es válido");
            }
        }
        System.out.println();
    }
     //Método pensado para validar tanto las cartas amenazas como las cartas investigación dentro de la oficina
    private boolean esValidoInsertar(Carta carta, List<Carta> col){
        if(col.isEmpty()){
            return carta.getValoresInvestigacion()!=null;
        }
        Carta ultimaCarta = col.get(col.size()-1);
        if(ultimaCarta.getValoresInvestigacion()!=null){
            return carta.getValorAmenaza()!=null;
        }else{
            return carta.getValoresInvestigacion()!=null;
        }
    }
    
    //Getters y setters de las columnas
    public List<Carta> getCol1() {
        return col1;
    }
    public void setCol1(List<Carta> col1) {
        this.col1 = col1;
    }
    public List<Carta> getCol2() {
        return col2;
    }
    public void setCol2(List<Carta> col2) {
        this.col2 = col2;
    }
    public List<Carta> getCol3() {
        return col3;
    }
    public void setCol3(List<Carta> col3) {
        this.col3 = col3;
    }
    public List<Carta> getCol4() {
        return col4;
    }
    public void setCol4(List<Carta> col4) {
        this.col4 = col4;
    }
    
}
