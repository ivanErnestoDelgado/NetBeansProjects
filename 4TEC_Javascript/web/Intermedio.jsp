<%-- 
    Document   : Intermedio
    Created on : 14/03/2024, 07:48:29 AM
    Author     : SADValenz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        
    </head>
    <%
        String inicioRuta="http://localhost:8080/4TEC_Javascript/";    
        HttpSession sesion= request.getSession();
            
            
            String procedencia=request.getHeader("referer");
            if((procedencia==null)||(!procedencia.contains(inicioRuta))){
                response.sendRedirect(inicioRuta+"index.jsp");
            }
            
            String Registro=request.getParameter("Registro");
            
            String usuario="";
            String ID;
            String contrasena;
            
            String generoAlumno="";
            String nombreAlumnoTabla="";
            String MateriasImpartidas="";
            String Curso="";
            String DatoSeEncontro="";
            
            if(Registro!=null){
            ID=(String) sesion.getAttribute("ID");
            contrasena=(String) sesion.getAttribute("contrasena");
            }else{
            ID=request.getParameter("ID");
            contrasena=request.getParameter("Contrasena");
            }
            if((ID==null)||(contrasena==null)){
            String url=inicioRuta+"index.jsp?mensaje=Ingresaste_valores_nulos";
            response.sendRedirect(url);
            return;
            }
            if((ID=="")||(contrasena=="")){
                String url=inicioRuta+"index.jsp?mensaje=Ingresaste_valores_vacios";
            response.sendRedirect(url);
            return;
            }
            
            if((!ID.matches("[0-9]+")||!contrasena.matches("[a-zA-Z0-9_]+"))){
                String url=inicioRuta+"index.jsp?mensaje=Ingresaste_valores_invalidos";
              response.sendRedirect(url);
              return;
           }
           
            try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection con = null;
            try {
                
                int idConvertida=Integer.parseInt(ID);
                String ruta="C://Users/SADValenz/Documents/NetBeansProjects/4TEC_Javascript/4TEC";
                con = DriverManager.getConnection("jdbc:sqlite:"+ruta);
                PreparedStatement prep = con.prepareStatement(
                        "SELECT * FROM alumnos where id_alumno=?;");
                prep.setInt(1, idConvertida);
                
                ResultSet rs = prep.executeQuery();
                int idTabla=0;
                while (rs.next()) {
                    idTabla=rs.getInt(1);
                    nombreAlumnoTabla= rs.getString(2);
                    generoAlumno=rs.getString(4);
                    
                    //si la contraseña que vienen con el usuario en la base de datos no coincide te redirige al index
                    if(!(rs.getString(3).equals(contrasena)))response.sendRedirect(inicioRuta+"index.jsp?mensaje=Clave_Incorrecta");
                    
                }
                
                if(!nombreAlumnoTabla.equals("")){
                    DatoSeEncontro="Si";
                    
                    PreparedStatement materias = con.prepareStatement(
                        "SELECT * FROM materias where alumno=?;");
                
                materias.setInt(1, idTabla);
                
                ResultSet resultadoMaterias = materias.executeQuery();
                while (resultadoMaterias.next()) {
                    String nombre= resultadoMaterias.getString(1);
                    int idDocente=resultadoMaterias.getInt(3);
                    
                    PreparedStatement obtenerNombreDocente = con.prepareStatement(
                        "SELECT * FROM  profesores where id_profesor=?;");
                    obtenerNombreDocente.setInt(1, idDocente);
                
                    ResultSet docenteObtenido = obtenerNombreDocente.executeQuery();
                    while (docenteObtenido.next()) {
                    String nombreDocente= docenteObtenido.getString(2);
                    MateriasImpartidas+=nombre+" impartida por "+nombreDocente+"<br>";
                }
                    
                }
                
                
                PreparedStatement Cursos = con.prepareStatement(
                        "SELECT * FROM cursos where alumno=?;");
                
                Cursos.setInt(1, idTabla);
                
                ResultSet resultadoCursos = Cursos.executeQuery();
                while (resultadoCursos.next()) {
                    String nombreCurso= resultadoCursos.getString(1);
                    
                    Curso=nombreCurso;
                }
                
                }
                
                
                //Extraigo los profesores de la base de datos
                ArrayList<String> profesores=new ArrayList<>();
                PreparedStatement profes = con.prepareStatement(
                        "SELECT * FROM profesores;");
                ResultSet resultadoProfes=profes.executeQuery();
                
                while (resultadoProfes.next()) {
                    String profesor= resultadoProfes.getString(2);
                    profesores.add(profesor);
                }
                sesion.setAttribute("docentes", profesores);
                
                sesion.setAttribute("ID", ID);
                sesion.setAttribute("usuario", usuario);
                sesion.setAttribute("contrasena", contrasena);
                
            } catch (SQLException e) {
                e.printStackTrace();
            }catch(NumberFormatException e)
            {
               response.sendRedirect(inicioRuta+"index.jsp?mensaje=Clave_Incorrecta");
               return;
            }
            finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            
            

        %>

    <script>
        function mandarDatosIniciales(){
            var genero = document.getElementById("genero");
            var valorSeleccionado = genero.value;
            
            var FormOtros=document.getElementById("formOtros");
            var FormHombre=document.getElementById("formHombre");
            var FormMujer=document.getElementById("formMujer");
            var formRegistro = document.getElementById("registro");
            
            var nombreAlumno = document.getElementById("nombre");
            
            if(!validarTexto(nombreAlumno)){
                return;
            }
            if(!almacenarMateria()){
                alert("Seleccione al menos una materia");
                return;
            }
            
            if(valorSeleccionado==="genMujer"){
                
                FormMujer.removeAttribute("hidden","");
              
                ocultarFormHombre();
                ocultarFormOtros();
                
                sessionStorage.setItem('Genero', "Mujer");
            }
            if(valorSeleccionado==="genOtros"){
                
                FormOtros.removeAttribute("hidden","");
                
                ocultarFormHombre();
                ocultarFormMujer();
                
            }
            if(valorSeleccionado==="genHombre"){
                FormHombre.removeAttribute("hidden","");
                
                ocultarFormMujer();
                ocultarFormOtros();
                
                sessionStorage.setItem('Genero', "Hombre");
                
            }
            
            
            
            formRegistro.setAttribute("hidden","hidden");
            almacenarNombre();
        }   
        
        function redireccionarARegistro(){
            var ruta="<%=inicioRuta%>";
            window.location.href=ruta+"Intermedio.jsp?Registro=Si";
        }
        function verificarConfirmacionRegistro(){
            var decision="<%=Registro%>";
            
            if(decision==="Si"){
                ocultarDesicionRegistro();
                mostrarformularioRegistro();
                var botonReiniciarRegistro=document.getElementById("botonReiniciarRegistro");
                botonReiniciarRegistro.removeAttribute("hidden","");
            }
            borrarDatos();
        }
        function mostrarformularioRegistro(){
            var formRegistro = document.getElementById("registro");
            formRegistro.removeAttribute("hidden","");
        }
        
        function redireccionarAInicio(){
            var ruta="<%=inicioRuta%>";
            window.location.href=ruta+"index.jsp";
        }
        
        function ocultarDesicionRegistro(){
            var formDecision=document.getElementById("decision");
            formDecision.setAttribute("hidden","hidden");
        }
        function validarTexto(campo){
            var valor=campo.value;
            var expresion = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+(?:\s+[a-zA-ZáéíóúÁÉÍÓÚñÑ]+)*$/; // Expresión regular para permitir letras, números y espacios exceptuando al principio

            if (valor === null || valor.trim() === "") {
                alert("El campo de texto no puede estar vacío.");
                return false;
            } else if (valor.match(expresion)) {
                return true;
            } else {
                alert("El campo de texto no puede contener caracteres especiales ni numeros ni espacios al principio.");
                return false;
            }
        }
        
        
        function enviarCursoHombre(){
            sessionStorage.setItem('Curso', "Mansplaining");
        }
        
        function enviarCursoMujer(){
            var radios = document.getElementsByName('Curso');
                var valorSeleccionado;
                
                for (var i = 0; i < radios.length; i++) {
                  if (radios[i].checked) {
                    
                    valorSeleccionado = radios[i].value;
                    break;
                  }
            }
            sessionStorage.setItem('Curso', valorSeleccionado);
        }
        
        
        function enviarGeneroEspecificado(){
            var FormOtros=document.getElementById("formOtros");
            var FormHombre=document.getElementById("formHombre");
            var FormMujer=document.getElementById("formMujer");
            
            var generoEspecificado=document.getElementById("GeneroEspecificado");
            var texto = generoEspecificado.value;
            
            var expresionHombre = /(hombre|masculino|macho)/i; 
            var expresionMujer=/(mujer|femenino|hembra)/i;

            if (texto.match(expresionHombre)) {
                FormHombre.removeAttribute("hidden","");
                FormOtros.setAttribute("hidden","hidden");
                
                sessionStorage.setItem('Genero', "Hombre");
                alert("Puso un genero ya mostrado");
                return;
            }
            if (texto.match(expresionMujer)) {
                FormMujer.removeAttribute("hidden","");
                FormOtros.setAttribute("hidden","hidden");
                
                sessionStorage.setItem('Genero', "Mujer");
                alert("Puso un genero ya mostrado");
                return;
            }
            sessionStorage.setItem('Curso', "Ninguno");
            sessionStorage.setItem('Genero', texto);
            mostrarDivsMaterias();
            
        }
        
        function almacenarNombre(){
            var nombre=document.getElementById("nombre").value;
            sessionStorage.setItem("nombre",nombre);
        }
        
        function almacenarMateria(){
           var lastimaCheckbox = document.querySelector('#lastima');
           var lloriqueosCheckbox = document.querySelector('#lloriqueos');
           var dramaCheckbox = document.querySelector('#drama');
           var flag=false;
           if(lastimaCheckbox.checked){
               sessionStorage.setItem("lastima","Lastima I");
               flag=true;
           }
           if(lloriqueosCheckbox.checked){
               sessionStorage.setItem("lloriqueos","Lloriqueos II");
               flag=true;
           }
           if(dramaCheckbox.checked){
               sessionStorage.setItem("drama","DOO");
               flag=true;
           }
           return flag;
        }
        
        function mostrarInformacion(){
            var contenedor=document.getElementById("contenedor-info");
            var parrafoInfo=document.getElementById("informacion");
            var botonRedirigir=document.getElementById("botonRedirigir");
            
            var cadena="";
                     
            var genero=sessionStorage.getItem('Genero');
            var curso=sessionStorage.getItem('Curso');
            var nombre=sessionStorage.getItem('nombre');
            var lastima=sessionStorage.getItem('lastima');
            var lloriqueos=sessionStorage.getItem('lloriqueos');
            var drama=sessionStorage.getItem('drama');

         
            parrafoInfo.innerHTML="<h2>Confirme sus datos</h2>";
            imprimirDato("nombre",nombre);
            imprimirDato("genero",genero);
            imprimirDato("curso",curso);
            cadena=parrafoInfo.innerHTML+"<h3>Materias escogidas:</h3> ";
            parrafoInfo.innerHTML=cadena;
            
            if (lastima!==null)parrafoInfo.innerHTML+="Lastima I impartida por "+lastima+"<br>";
            if (drama!==null)parrafoInfo.innerHTML+="Drama Orientado a Objetos impartida por "+drama+"<br>";
            if (lloriqueos!==null)parrafoInfo.innerHTML+="Lloriqueos II impartida por "+lloriqueos+"<br>";
            
            
            parrafoInfo.removeAttribute("hidden","");
            botonRedirigir.removeAttribute("hidden","");
            contenedor.removeAttribute("hidden","");
        }
        
        function imprimirDato(nombre,valor){
         var parrafoInfo=document.getElementById("informacion");
         var informacion=parrafoInfo.innerHTML;
         var cadena=informacion+"Tu "+nombre+" es "+valor+"<br>";
         parrafoInfo.innerHTML=cadena;
        }
        
        function borrarDatos(){
            sessionStorage.removeItem('Genero');
            sessionStorage.removeItem('Curso');
            sessionStorage.removeItem('nombre');
            sessionStorage.removeItem('lastima');
            sessionStorage.removeItem('lloriqueos');
            sessionStorage.removeItem('drama');
        }
        function ocultarFormHombre(){            
            var FormHombre=document.getElementById("formHombre");
            FormHombre.setAttribute("hidden","hidden");
        }
        function ocultarFormMujer(){
            var FormMujer=document.getElementById("formMujer");
            FormMujer.setAttribute("hidden","hidden");
        }
        function ocultarFormOtros(){
            var FormOtros=document.getElementById("formOtros");
            FormOtros.setAttribute("hidden","hidden");
        }
        function enviarDatosFinales(){
            var genero=sessionStorage.getItem('Genero');
            var curso=sessionStorage.getItem('Curso');
            var nombre=sessionStorage.getItem('nombre');
            var lastima=sessionStorage.getItem('lastima')===null?"":"Lastima1="+sessionStorage.getItem('lastima')+"&";
            var lloriqueos=sessionStorage.getItem('lloriqueos')===null?"":"Lloriqueos2="+sessionStorage.getItem('lloriqueos')+"&";
            var drama=sessionStorage.getItem('drama')===null?"":"DOO="+sessionStorage.getItem('drama')+"&"; 
            var ruta="<%=inicioRuta%>";
            window.location.href=ruta+"segunda.jsp?Nombre="+nombre+"&Curso="+curso+"&"+lastima+lloriqueos+drama+"Genero="+genero;
        }
        
        function mostrarDivsMaterias(){
            var lastimaRecibida=sessionStorage.getItem('lastima');
            var lloriqueosRecibidos=sessionStorage.getItem('lloriqueos');
            var dramaRecibidos=sessionStorage.getItem('drama');
            
            var expresionDocentes=/(faustinho|medelamlo|ileanovsky)/i;
            
            var FormLastima=document.getElementById('formLastima');
            var FormLloriqueos=document.getElementById('formLloriqueos');
            var FormDOO=document.getElementById('formDOO');
            
            var flag=true;
            
            if((lastimaRecibida!==null)&&!(lastimaRecibida.match(expresionDocentes))){
                FormLastima.removeAttribute("hidden","");
             flag=false;
            }
             if((lloriqueosRecibidos!==null)&&(!lloriqueosRecibidos.match(expresionDocentes))){
                FormLloriqueos.removeAttribute("hidden","");
                flag=false;
            } 
            if((dramaRecibidos!==null)&&(!dramaRecibidos.match(expresionDocentes))){
                FormDOO.removeAttribute("hidden","");
                flag=false;
            }
            if(flag){
                mostrarInformacion();
            }
        }
        function extraerInfoDrama(){
            var radios = document.getElementsByName('DocentesDOO');
                var valorSeleccionado;
                var hayCheck=false;
                for (var i = 0; i < radios.length; i++) {
                  if (radios[i].checked) {
                    
                    valorSeleccionado = radios[i].value;
                    hayCheck=true;
                    break;
                  }
            }
            if(!hayCheck)
            {
                alert("Escoja un docente");
                return;
            }
            sessionStorage.setItem('drama', valorSeleccionado);
            deshabilitarDocente(valorSeleccionado);
            ocultarFormDrama();
        }
        
        function extraerInfoLastima(){
            var radios = document.getElementsByName('DocentesLastima');
                var valorSeleccionado;
                
                var hayHabilitados=false;
                var hayCheck=false;
                for (var i = 0; i < radios.length; i++) {
                    if(radios[i].disabled===false)hayHabilitados=true;        
                    if (radios[i].checked) {
                    
                    valorSeleccionado = radios[i].value;
                    hayCheck=true;
                    break;
                  }
                  
            }
            
           if(!hayHabilitados){
               alert("No hay docente disponible");
               redireccionarARegistro();
               borrarDatos();
               return;
           }
            if(!hayCheck)
            {
                alert("Escoja un docente");
                return;
            }
            sessionStorage.setItem('lastima', valorSeleccionado);
            deshabilitarDocente(valorSeleccionado);
            ocultarFormLastima();
        }
        function deshabilitarIlleanovsky(){
         document.getElementById('illeanovskyDOO').disabled=true;
         document.getElementById('illeanovskyLloriqueos').disabled=true;
         
         document.getElementById('illeanovskyDOO').checked=false;
         document.getElementById('illeanovskyLloriqueos').checked=false;
        }
        function deshabilitarFaustinho(){
        document.getElementById('faustinhoLastima').disabled=true;
        document.getElementById('faustinhoDOO').disabled=true;
        document.getElementById('faustinhoLloriqueos').disabled=true;
        
        document.getElementById('faustinhoLloriqueos').checked=false;
        document.getElementById('faustinhoDOO').checked=false;
        document.getElementById('faustinhoLastima').checked=false;
        }
        function deshabilitarMedelAmlo(){
        document.getElementById('medelAMLODOO').disabled=true;
        document.getElementById('medelAMLOLloriqueos').disabled=true;
        document.getElementById('medelAMLOLastima').disabled=true;
        
        document.getElementById('medelAMLODOO').checked=false;
        document.getElementById('medelAMLOLloriqueos').checked=false;;
        document.getElementById('medelAMLOLastima').checked=false;;
        
        }
        function deshabilitarDocente(docente){
            if(docente==="MedelAMLO")deshabilitarMedelAmlo();
            if(docente==="Faustinho")deshabilitarFaustinho();
            if(docente==="Ileanovsky")deshabilitarIlleanovsky();
        }
        function extraerInfoLloriqueos(){
            var radios = document.getElementsByName('DocentesLloriqueos');
                var valorSeleccionado;
                
                var hayCheck=false;
                for (var i = 0; i < radios.length; i++) {
                  if (radios[i].checked) {
                    
                    valorSeleccionado = radios[i].value;
                    hayCheck=true;
                    break;
                  }
            }
            if(!hayCheck)
            {
                alert("Escoja un docente");
                return;
            }
            sessionStorage.setItem('lloriqueos', valorSeleccionado);
            deshabilitarDocente(valorSeleccionado);
            ocultarFormLloriqueos();
        }
        
        function ocultarFormLastima(){
            var formLastima=document.getElementById("formLastima");
            formLastima.setAttribute("hidden","hidden");
        }
        function ocultarFormLloriqueos(){
            var FormLloriqueos=document.getElementById("formLloriqueos");
            FormLloriqueos.setAttribute("hidden","hidden");
        }
        function ocultarFormDrama(){
            var formDOO=document.getElementById("formDOO");
            formDOO.setAttribute("hidden","hidden");
        }
        function verificarDatosEncontrados(){
            var confirmacion="<%=DatoSeEncontro%>";
            var parrafoInfo=document.getElementById("informacion-registrada");
            var decisionForm=document.getElementById("decision");
            if(confirmacion==="Si"){
            parrafoInfo.removeAttribute("hidden","");
            decisionForm.setAttribute("hidden","hidden");
            }
        }
    </script>
    <body id="cuerpo-Registro" onload="verificarDatosEncontrados();verificarConfirmacionRegistro();">
            
        <table id="esqueleto">
            <tr>
                <td>
                    <div id="encabezado">
                        <h1>Bienvenid@ a la 4TEC</h1>
                    </div>
                </td>
            </tr>
        <tr>
            <td>
                <div id="informacion-registrada" hidden="hidden">
                    <div id="informacion-registrada-estilo">
                            <h1>Hola <%=nombreAlumnoTabla%></h1>
                            <p>Tu genero es <%=generoAlumno%></p>
                            <h3>Materias:</h3>
                            <p><%=MateriasImpartidas%></p>
                            <h3>Curso:</h3>
                            <p><%=Curso%></p><br>
                            <a id="enlaceRegreso" href="http://localhost:8080/4TEC_Javascript/index.jsp">Regresar</a>
                    </div> 
                </div>    
                
                <form id="decision" name="decisionRegistro">
                        <div class="decision-Form">
                           <br>
                        <h1>Usuario nuevo</h1>
                        <h3>¿Desea registrarse?</h3>
                        <p>
                        <input class="boton-Registro" type="button"  value="Si" name="botonSI" onclick="redireccionarARegistro();"/>
                        <input class="boton-Registro" type="button" value="No" name="botonNo" onclick="redireccionarAInicio();"/>
                        </p>
                        </div>
                </form>
        
        <form name="RegistroDatos" id="registro" hidden="hidden" action="registro.jsp">
            <div class="datosIniciales-Form">
            <h1>Ingrese los datos</h1>
                Nombre:
                <input id="nombre" type="text" name="Nombre"/> <br>
                Materias:
                <input class="ckeck-Registro" id="lastima" type="checkbox" name="Lastima1" value="ON" checked="checked"/> Lastima l
                <input class="ckeck-Registro" id="lloriqueos" type="checkbox" name="Lloriqueos2" value="ON" /> Lloriqueos ll <br>
                <input class="ckeck-Registro" id= "drama" type="checkbox" name="DOO" value="ON"/> Drama orientado a objetos <br>
                Genero:
                <select id="genero" name="Genero">
                    <option value="genMujer">Mujer</option>
                    <option value="genOtros">Otros</option>
                    <option value="genHombre">Hombre</option>
                </select><br>
                <br><input class="boton-Registro" type="button" value="Enviar" onclick="mandarDatosIniciales();">
                </div>
         </form>
          
        <form hidden="hidden" id="formOtros">
        <div id="Otros" hidden="hidden" class="genero"> 
            <h1>Especifique su genero</h1>
            <br>Genero:
            <input id="GeneroEspecificado" type="text"/>
            <input class="boton-GeneroOtros" type="button" onclick="enviarGeneroEspecificado();ocultarFormOtros()" value="Escoger"><br>
        </div>
        </form>
        
        <form hidden="hidden" id="formHombre">
        <div id="Hombre" hidden="hidden" class="genero">
            Haras un curso de mansplaining <br>
            <br><input class="boton-Registro" type="button" onclick="enviarCursoHombre();ocultarFormHombre();mostrarDivsMaterias();" value="Aceptar"><br>
        </div>
        </form>
        
        <form hidden="hidden" id="formMujer">
        <div id="Mujer" hidden="hidden" class="genero">
            <h3> Seleccione curso:</h3> 
            <input id="plomeria" type="radio" name="Curso" value="Plomeria" checked="check"/> Curso de plomeria
            <input id="albanileria" type="radio" name="Curso" value="Albañileria" /> Curso de albañileria
            <br><input class="boton-Registro" type="button" value="Escoger" onclick="enviarCursoMujer();ocultarFormMujer();mostrarDivsMaterias();"><br>
        </div>
        </form>
      
        <form hidden="hidden" id="formDOO">
        <div id="divDOO" hidden="hidden" class="materia">
            <h3>Escoja su docente en la materia de Drama Orientado a Objetos:</h3> 
            <input id="medelAMLODOO" type="radio" name="DocentesDOO" value="MedelAMLO" checked="check"/> MedelAMLO<br>
            <input id="illeanovskyDOO" type="radio" name="DocentesDOO" value="Ileanovsky"/> Ileanovsky<br>
            <input id="faustinhoDOO" type="radio" name="DocentesDOO" value="Faustinho"/> Faustinho<br>
            <br><input class="boton-Registro" type="button" value="Escoger" onclick="mostrarDivsMaterias();extraerInfoDrama();mostrarDivsMaterias();"><br>
        </div>
            </form>
      
        <form hidden="hidden" id="formLastima">
        <div id="divLastima" hidden="hidden" class="materia">
            <h3> Escoja su docente en la materia de Lastima I:</h3> 
            <input id="medelAMLOLastima" type="radio" name="DocentesLastima" value="MedelAMLO" checked="check"/> MedelAMLO<br>
            <input id="faustinhoLastima" type="radio" name="DocentesLastima" value="Faustinho"/> Faustinho<br>
            <br><input class="boton-Registro" type="button" value="Escoger" onclick="mostrarDivsMaterias();extraerInfoLastima();mostrarDivsMaterias();" ><br>
      </div>
        </form>
        
        <form hidden="hidden" id="formLloriqueos">
            <div id="divLloriqueos" hidden="hidden" class="materia">
            <h3> Escoja su docente en la materia de Lloriqueos II:</h3> 
            <input id="medelAMLOLloriqueos" type="radio" name="DocentesLloriqueos" value="MedelAMLO" checked="check"/> MedelAMLO<br>
            <input id="illeanovskyLloriqueos" type="radio" name="DocentesLloriqueos" value="Ileanovsky" /> Ileanovsky<br>
            <input id="faustinhoLloriqueos" type="radio" name="DocentesLloriqueos" value="Faustinho"/> Faustinho
            <br><input class="boton-Registro" type="button" value="Escoger" onclick="mostrarDivsMaterias();extraerInfoLloriqueos();mostrarDivsMaterias();" ><br>
            </div>
        </form>
            <div id="contenedor-info" hidden="hidden">
                <div id="contenedor-Informacion-estilo">
                <p id="informacion" hidden="hidden"></p>
                </div>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                
            
            <div class="contenedor-Controles">
            <br>
            <table>
                    <tr>
                        <td><input id="botonReiniciarRegistro" type="button" value="Reiniciar registro" name="botonSI" hidden="hidden" onclick="borrarDatos();redireccionarARegistro();"/></td>
                        <td><input class="boton-Registro" id="botonRedirigir" type="button" value="Siguiente" name="botonDocente" onclick="enviarDatosFinales();" hidden="hidden"/></td>
                    </tr>
            </table>
            
            </div>  
                
            </td>
        </tr>
        </table>

        
    </body>
</html>
