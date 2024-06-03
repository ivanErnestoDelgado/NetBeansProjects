
package pruebasherlock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;



/**
 *
 * @author aleja
 */
public class Mano {
    public List<Carta> cartasEnMano = new ArrayList<>();
    MazoDescartes md = new MazoDescartes();
    Carta carta = new Carta();
    public Mano(){
        
    }
    //recibe cartas del MazoRobo
    public void recibirCarta(Carta carta){
        cartasEnMano.add(carta);
    }
    //imprime las cartas
    public void imprimirCartas(){
        System.out.println(Carta.ANSI_YELLOW+"Valores dentro de la lista de la mano");
        for(Carta c : cartasEnMano){
            if(c.getValorAmenaza()==null){
                System.out.println(Carta.ANSI_CYAN+c.getValoresInvestigacion());
            }else{
                System.out.println(Carta.ANSI_RED+c.getValorAmenaza());
            }
        }
    }
    //función que elimina un elemento específicado de la mano
    public void eliminarElemento(int c){
        getCartasEnMano().remove(c);
    }
    //función que revisa si la mano está vacía 
    public boolean estaVacia(){
        return cartasEnMano.isEmpty();  
    }
    //booleano que verifica las cartas iguales dentro de la mano
    public boolean todasCartasMismoTipo(){
        if(cartasEnMano.isEmpty()){
            return false;
        }
        boolean todasInv = true;
        boolean todasAme = true;
        for(Carta c: cartasEnMano){
            if(c.getValorAmenaza()==null){
                todasAme=false;
            }else{
                todasInv=false;
            }
        }
        return todasInv || todasAme;
    }
    //Metodo pensado para validar si hay 3 cartas del mismo valor (amenaza o investigacion)
    public boolean hayTresConMismoValor() {
        Map<Carta.valoresAmenaza, Integer> contadorAmenazas = new HashMap<>();
        Map<Carta.valoresInvestigacion, Integer> contadorInvestigaciones = new HashMap<>();
        for (Carta carta : cartasEnMano) {
            if (carta.getValorAmenaza() != null) {
                contadorAmenazas.put(carta.getValorAmenaza(), contadorAmenazas.getOrDefault(carta.getValorAmenaza(), 0) + 1);
                if (contadorAmenazas.get(carta.getValorAmenaza()) >= 3) {
                    return true;
                }
            }else if(carta.getValoresInvestigacion()!=null){
                contadorInvestigaciones.put(carta.getValoresInvestigacion(),contadorInvestigaciones.getOrDefault(carta.getValoresInvestigacion(), 0)+1);
                if(contadorInvestigaciones.get(carta.getValoresInvestigacion())>=3){
                    return true;
                }
            }
        }
        return false;
    }
    
    //Método qu se activará si todas las cartas de la mano son del mismo tipo
    
    public List<Carta> getCartasEnMano() {
        return this.cartasEnMano;
    }

    public void setCartasEnMano(List<Carta> cartasEnMano) {
        this.cartasEnMano = cartasEnMano;
    }

}


