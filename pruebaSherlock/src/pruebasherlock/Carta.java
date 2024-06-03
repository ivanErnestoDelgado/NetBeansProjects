
package pruebasherlock;

/**
 *
 * @author aleja
 */
public  class Carta {

    /*
        Clase que representa una carta con un atributo ya sea amenaza o investigación
    */
    
    
    valoresAmenaza atributosAmenazas;
    valoresInvestigacion atributosInvestigacion;
    public Carta(){
        
    }
    //Constructor para cartas usando el enum
    public Carta(valoresAmenaza va){
        atributosAmenazas=va;
    }
    public Carta(valoresInvestigacion vi){
        atributosInvestigacion=vi;
    }
    
    //getters y setters del constructor con enums
    public valoresAmenaza getValorAmenaza(){
        return atributosAmenazas;
    }
    public void setValorAmenaza(valoresAmenaza va){
        this.atributosAmenazas=va;
    }
    public valoresInvestigacion getValoresInvestigacion(){
        return atributosInvestigacion;
    }
    public void setValoresInvestigacion(valoresInvestigacion vi){
        this.atributosInvestigacion=vi;
    }

    public static final String ANSI_CYAN = "\u001B[36m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public enum TipoCarta{INVESTIGACION,AMENAZA};
    public enum valoresAmenaza{A,B,C,D,}
    public enum valoresInvestigacion{UNO,DOS,TRES,CUATRO,}
}
