
package pruebasherlock;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author aleja
 */
public abstract class Mazo {
    public List<Carta> mazoRobo = new ArrayList<>();
    public List<Carta> mazoDescartes = new ArrayList<>();

    public List<Carta> getEscenaCrimen() {
        return escenaCrimen;
    }

    public void setEscenaCrimen(List<Carta> escenaCrimen) {
        this.escenaCrimen = escenaCrimen;
    }
    public List<Carta> escenaCrimen = new ArrayList<>();
    public abstract boolean estaVacio();
    
    public List<Carta> getMazoRobo() {
        return mazoRobo;
    }
    
    public void setMazoRobo(List<Carta> mazoRobo) {
        this.mazoRobo = mazoRobo;
    }

    public List<Carta> getMazoDescartes() {
        return mazoDescartes;
    }

    public void setMazoDescartes(List<Carta> mazoDescartes) {
        this.mazoDescartes = mazoDescartes;
    }
    
}
