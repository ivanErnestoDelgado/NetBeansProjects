/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consumidorpractica8c;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import javax.swing.JOptionPane;

/**
 *
 * @author SADValenz
 */
public class ConsumidorPractica8c {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try{
        URL url=new URL("https://jsonplaceholder.typicode.com/todos/3");
        HttpURLConnection conn=(HttpURLConnection)url.openConnection();
        conn.setRequestMethod("GET");
        conn.connect();
        
        int codigoRespuesta=conn.getResponseCode();
        if(codigoRespuesta!=200){
        throw new RuntimeException("Error ocurrido: "+codigoRespuesta);
        }
        else{
            StringBuilder textoCons= new StringBuilder();
            Scanner scanner= new Scanner(url.openStream());
            
            while (scanner.hasNextLine()) {
                textoCons.append(scanner.nextLine());
                
            }
            scanner.close();
            JOptionPane.showMessageDialog(null, textoCons);
            
        }
        }catch(IOException e){
            JOptionPane.showMessageDialog(null, "Valiste queso");
        }
    }
    
}
