package pruebasherlock;
import java.util.InputMismatchException;
import java.util.Scanner;


public class PruebaSherlock {
    
    
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        MazoRobo mazo = new MazoRobo();
        Mano mano = new Mano();
        MazoDescartes md = new MazoDescartes();
        EscenaCrimen ec = new EscenaCrimen();
        Oficina oficina = new Oficina();
        Jugador jugador = new Jugador("Juanito");
        
        
        String decision;
        System.out.println("¿Quieres jugar?[si/no]");
        decision = s.next();
        //Condiciona la decisión
        switch (decision) {
            case "no":
                System.out.println("Okey, buen día");
                break;
            case "si":
                //Crea un mazo
                mazo.crearMazoJuego();
                while (true) {
                    //Condiciona si la mano está vacía, reparte otras 4 cartas y las agrega a la mano
                    if (mazo.cartasMano.isEmpty()) {
                        mazo.darCuatroCartas();
                        for (int j = 0; j < mazo.cartasMano.size(); j++) {
                            mano.recibirCarta(mazo.cartasMano.get(j));
                        }
                    }
                    if(mano.todasCartasMismoTipo()){
                        System.out.println(Carta.ANSI_YELLOW+"Tienes 4 cartas del mismo tipo! se enviaron al Mazo de descartes");
                        md.recibiCartas(mano.getCartasEnMano());
                        mano.getCartasEnMano().clear();
                        for (int j = 0; j < mazo.cartasMano.size(); j++) {
                            mano.recibirCarta(mazo.cartasMano.get(j));
                        }
                        mano.imprimirCartas();
                    }
                    System.out.println("Hay 3 cartas del mismo valor: "+mano.hayTresConMismoValor());
                    //Itera sobre el número de cartas que debe de tener la mano
                    for (int i = 1; i <= 4; i++) {
                        boolean entradaValida = false;
                        //Mientras haya cartas, entra al ciclo de juego de cartas
                        while (!entradaValida) {
                            try {
                                System.out.println("¿Qué carta quieres jugar?[0-" + (mano.getCartasEnMano().size() - 1) + "]");
                                
                                int cartaElegida = s.nextInt();
                                if (cartaElegida < 0 || cartaElegida >= mano.getCartasEnMano().size()) {
                                    throw new IndexOutOfBoundsException();
                                }
                                System.out.println("¿Donde quieres jugar la carta?[1-Escena del Crimen, 2-Oficina]");
                                int lugar = s.nextInt();
                                //Switch que vlaida donde se va a jugar la carta seleccionada
                                switch (lugar) {
                                    // Manda la carta seleccionada a la escena del crimen
                                    case 1:
                                        ec.recibirCarta(mano.getCartasEnMano().get(cartaElegida));
                                        //Verifica si existen dos cartas con los mismos atributos dentro de la escena del crimen
                                        ec.verificarCartas();
                                        entradaValida = true;
                                        break;
                                    //Manda la carta seleccionada a la oficina 
                                    case 2:
                                        while(!entradaValida){
                                            try{
                                                System.out.println("¿En que columna? [1,2,3,4]");
                                                int col = s.nextInt();
                                                oficina.insertarCarta(mano.getCartasEnMano().get(cartaElegida), col);
                                                entradaValida=true;
                                            }catch(IllegalArgumentException e){
                                                System.out.println(e.getMessage());
                                                break;
                                            }catch(IndexOutOfBoundsException e){
                                                System.out.println(Carta.ANSI_YELLOW+"Ingresa un número valido de columa");
                                            }
                                        }
                                        break;
                                    default:
                                        throw new IndexOutOfBoundsException();
                                }
                                
                                // Elimina el elemento de la mano y del mazo
                                if(entradaValida){
                                   mano.eliminarElemento(cartaElegida);
                                   mazo.eliminarElemento(cartaElegida); 
                                   entradaValida=true;
                                }
                                // Imprime las cartas que quedan en la mano y las que ya se colocaron dentro de la escena del crimen
                                mano.imprimirCartas();
                                ec.imprimirEscena();
                                oficina.imprimirListas();
                            //Valida la entrada de numeros    
                            } catch (InputMismatchException e) {
                                System.out.println(Carta.ANSI_YELLOW+"Ingresa un número.");
                                s.next();  // Consumir la entrada no válida
                            //Vallida el numero de carta seleccionada, con las cartas dentro de la mano
                            } catch (IndexOutOfBoundsException e) {
                                System.out.println(Carta.ANSI_YELLOW+"Ingrese un número dentro del rango");
                            }
                        }
                    }
                    //Si puso todas las cartas pregunta de nuevo si quiere jugar
                    System.out.println(Carta.ANSI_YELLOW+"\n¿Quieres jugar otra ronda?[si/no]");
                    decision = s.next();
                    if (!decision.equalsIgnoreCase("si")) {
                        System.out.println(Carta.ANSI_YELLOW+"¡Hasta la próxima!");
                        break;
                    }
                }
                break;
            default:
                System.out.println(Carta.ANSI_YELLOW+"Ingresa si o no");
                main(null);
                break;
        }
        s.close();
    }
    
}

