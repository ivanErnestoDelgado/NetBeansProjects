/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crearleerxml;
import javax.swing.JOptionPane;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;




/**
 *
 * @author alumno
 */
public class metodos{
    ArrayList<Usuario> arrayAux= new ArrayList<>();
    String fila;

    void quitar(short posicion){
    arrayAux.remove(posicion);
   }
   
  void leerArchivo()
  {
        try {
            SAXBuilder constructor= new SAXBuilder();
            File archivoXML= new File("datosXML//grupo.xml");
            
            Document doc= constructor.build(archivoXML);
            Element raiz= doc.getRootElement();
            
            List<Element> lista=raiz.getChildren("Alumnos");
            for (int i = 0; i < lista.size(); i++) {
                
                Element alumno= lista.get(i);
                
                List<Element> valores_alumnos=alumno.getChildren();
                for (int j = 0; j < valores_alumnos.size(); j++) {
                    
                    Element campo=valores_alumnos.get(j);
                    

                     Usuario al= new Usuario(campo.getChildTextTrim("numControl"), campo.getChildTextTrim("Nombres"), campo.getChildTextTrim("Apellidos"), campo.getChildTextTrim("Carrera"));
                    this.agregar(al);
                }
                
            }
        } catch (JDOMException | IOException ex) {
            JOptionPane.showMessageDialog(null, "Algo fallo");
        }
  }
  
  
  String mostrar(){
    String texto="NControl\tApellidos\tNombres\tCarrera\n";
    for(Usuario alumno:arrayAux){
            texto+=alumno.getNumControl()+"\t"+alumno.getApellidos()+"\t"+alumno.getNombres()+"\t"+alumno.getCarrera()+"\n";
            }
    return texto;
}
  
  Usuario visualizar(short pos){
  return arrayAux.get(pos);
 }
  boolean vacio(){
  return arrayAux.isEmpty();
  }
   
  void agregar(Usuario al){
  
  arrayAux.add(al);
  }
  
  void guardar() throws IOException{
       File archivo= new File("datosxml//grupo.xml");
       if(archivo.exists()){
       archivo.delete();
       archivo.createNewFile();
       try {
            Element grupo =new Element("Grupo");
            Document doc= new Document(grupo);
            
            //grupo de alumnos ya declarado
            Element alumnos= new Element("Alumnos");
            grupo.addContent(alumnos);
            
            //alumno
            Element alumno;
            //elementos del alumno
            Element numControl;
            Element nombre;
            Element apellidos;
            Element carrera;
            
            for(Usuario morro:arrayAux){
            alumno= new Element("Alumno");
            
            numControl=new Element("numControl");
            numControl.setText(morro.getNumControl());
            
            nombre=new Element("Nombres");
            nombre.setText(morro.getNombres());
            
            apellidos=new Element("Apellidos");
            apellidos.setText(morro.getApellidos());
            
            carrera=new Element("Carrera");
            carrera.setText(morro.getCarrera());
            
            alumno.addContent(numControl);
            alumno.addContent(nombre);
            alumno.addContent(apellidos);
            alumno.addContent(carrera);
            
            alumnos.addContent(alumno);
            }
              
            XMLOutputter xml= new XMLOutputter();
            xml.setFormat(Format.getPrettyFormat());
            xml.output(doc, new FileWriter(archivo));
         }
         catch(IOException e){
         JOptionPane.showMessageDialog(null,e.getMessage());
         }
       }
   }

   void cambiar(short posi,Usuario al){
   arrayAux.set(posi,al);
   }
   
   void comprobarExistencia(){
   File archivo= new File("datosXML//grupo.xml");
   File directorio= new File("datosXML");
        if(directorio.exists()==false){
            directorio.mkdir();
        }
        if(archivo.exists()){
            this.leerArchivo();
        }
        else{
            try{
                archivo.createNewFile();
            }
            catch(IOException e){
            JOptionPane.showMessageDialog(null, "Problema con entreada y/o salida");
            }
        }
   }
}

