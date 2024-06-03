
package pruebasherlock;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author aleja
 */
public class EscenaCrimen extends Mazo{
    public int heridas=0;
    //Método que recibe cartas y las agrega a la escena del crimen
    public void recibirCarta(Carta carta){
       escenaCrimen.add(carta);
    }
    //Método usado para imprimir los elementos dentro de la escena del crimen
    public void imprimirEscena(){
        System.out.println("Cartas dentro del mazo de la escena del crimen:");
        for(Carta c: escenaCrimen){
            if(c.getValorAmenaza()==null){
                System.out.println(Carta.ANSI_CYAN+c.getValoresInvestigacion());
            }else{
                System.out.println(Carta.ANSI_RED+c.getValorAmenaza());
            }
        }
    }
    //Método usado para recorrer los elementos dentro de la escena del crimen y verificar sus elementos
    public void verificarCartas(){
        
    }
    //Metodo pensado para mandar las cartas que se repitan al mazo de descartes
    public void descartarCartas(){
        
    }
    //Método pensado para que cuando se vacíe el mazo de robo, se manden las amenazas a el mazo robo de nuevo y se barajen  
    public void mandarCartasAmenaza(){
       
    }
    @Override
    public boolean estaVacio() {
        return escenaCrimen.isEmpty();
    }
    
}
