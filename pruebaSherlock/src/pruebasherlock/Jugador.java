
package pruebasherlock;

/**
 *
 * @author aleja
 */
public class Jugador {
    public int vidas;
    public String nombre;
    public Jugador(String nombre){
        this.nombre=nombre;
        this.vidas=3;
    }
    public String getNombre(){
        return nombre;
    }
    public int getVidas(){
        return vidas;
    }
    public void recibeHerida(){
        vidas--;
        System.out.println(Carta.ANSI_YELLOW+"Has recibido una herida");
    }
    
}
