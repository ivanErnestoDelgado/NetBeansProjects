
package pruebasherlock;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author aleja
 */
public class MazoDescartes extends Mazo{
    private static MazoDescartes instance;
    public void MazoDescartes(){
        
    }
    public void imprimirCartas(){
        System.out.println("Cartas dentro del mazo de descartes:");
        for(Carta c: mazoDescartes){
            if(c.getValorAmenaza()==null){
                System.out.println(Carta.ANSI_CYAN+c.getValoresInvestigacion());
            }else{
                System.out.println(Carta.ANSI_RED+c.getValorAmenaza());
            }
        }
    }
    public List<Carta> vaciarMazo(){
        List<Carta> cartas = new ArrayList<>(mazoDescartes);
        mazoDescartes.clear();
        return cartas;
    }
    
    public void recibirCarta(Carta carta){
        mazoDescartes.add(carta);
    }
    public void recibiCartas(List<Carta> cartas){
        mazoDescartes.addAll(cartas);
    }
    @Override
    public boolean estaVacio() {
        return mazoDescartes.isEmpty();
    }
    
    
}
