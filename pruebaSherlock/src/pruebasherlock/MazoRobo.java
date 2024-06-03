    
package pruebasherlock;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;



public final class MazoRobo extends Mazo{
    List<Carta> cartasMano = new ArrayList<>();
    public MazoRobo(){
    }
    //Método para crear el mazo de cartas del juego
    public void crearMazoJuego(){
         Carta cartai,cartaa;
         //Ciclos foreach recorriendo todos los elementos de los enums y agregandolos como atributos a las cartas
         for (int i = 0; i < 8; i++) {
            for (Carta.valoresInvestigacion vi : Carta.valoresInvestigacion.values()) {
                cartai = new Carta(vi);
                mazoRobo.add(cartai);
            }
        }
        for (int i = 0; i < 4; i++) {
            for (Carta.valoresAmenaza va:  Carta.valoresAmenaza.values()) {
                cartaa = new Carta(va);
                mazoRobo.add(cartaa);
            }
        }
         //Se baraja el mazo luego de crearlo
        barajar();
     }
    //Metodo para bajarar el mazo
    public void barajar() {
        Random random = new Random();
        Collections.shuffle(mazoRobo, random); // Utiliza la clase Collections para barajar
    }
    //Imprime las cartas dentro del mazo
    public void imprimirCartas() {
        int contadorCartas=0;
        System.out.println("Cartas del mazo: ");
        for (Carta carta : mazoRobo) {
            if(carta.getValorAmenaza()==null){
                System.out.print(Carta.ANSI_CYAN+"|"+carta.getValoresInvestigacion()+"|");
            }else if(carta.getValoresInvestigacion()==null){
                System.out.print(Carta.ANSI_RED+"|"+carta.getValorAmenaza()+"|");
            }
            contadorCartas++;
            if(contadorCartas%4==0){
                System.out.println("\n");
            }
        }

    }
    //Elimina un elemento dada la pocisión de este
    public void eliminarElemento(int idx){
        if (idx >= 0 && idx < getCartasMano().size()) {
           getCartasMano().remove(idx);
        }
    }
    //Imprime las cartas dentro del mazo creado para la mano
    public void imprimirCartasMano() {
        System.out.println("Cartas de la mano y clase MR: ");
        for (Carta carta : cartasMano) {
            if(carta.getValorAmenaza()==null){
                System.out.print(Carta.ANSI_CYAN+"|"+carta.getValoresInvestigacion()+"|");
            }else if(carta.getValoresInvestigacion()==null){
                System.out.print(Carta.ANSI_RED+"|"+carta.getValorAmenaza()+"|");
            }
        }
        System.out.println("\n");
    }
    //Método heredado de Mazo que verifica si está vacío
    @Override
    public boolean estaVacio(){
        return mazoRobo.isEmpty();
    }
     //método que obtiene 4 cartas y las almacena dentro de una lista llamada cartasMano y las quita de la lista mazo
     public Carta darCuatroCartas() {
        Carta cA = mazoRobo.get(0);
         if (mazoRobo.isEmpty()) {
             System.out.println("No quedan más cartas");
         } else {
             System.out.println(Carta.ANSI_YELLOW+"\nEstas son tus cartas:");
             for(int i=0;i<4;i++){
                 cA = mazoRobo.get(0);
                 mazoRobo.remove(0);
                 cartasMano.add(cA);
                 // Condiciona qué atributo tiene cada carta para mostrarlas
                 if (cA.getValorAmenaza() == null) {
                     System.out.println(Carta.ANSI_CYAN + cA.getValoresInvestigacion());
                 } else {
                     System.out.println(Carta.ANSI_RED + cA.getValorAmenaza());
                 } 
             }
         }
         return cA;
    }
    //getters y setters para acceder al mazo y al mazo de la mano    
    public List<Carta> getCartasMano() {
        return this.cartasMano;
    }
    public void setCartasMano(List<Carta> cartasMano) {
        this.cartasMano = cartasMano;
    } 
     //Enum con los valores de las amenazas
    
}
