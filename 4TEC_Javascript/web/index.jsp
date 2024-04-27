<%-- 
    Document   : index
    Created on : 12/03/2024, 09:03:45 PM
    Author     : SADValenz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="./estilos.css">
    </head>
     <%
        HttpSession sesion= request.getSession();
        
        if(!(sesion.isNew())){
            sesion.invalidate();
        }
           
           %>
    <script>
        
        function validarID(){
            var id=document.getElementById("ID").value;
            var expresion = /^[0-9]+$/; 

            if (id === null || id.trim() === "") {
                alert("El campo de id solo debe contener numeros.");
                return false;
            } else if (id.match(expresion)) {
                return true;
            } else {
                alert("El campo de id debe contener numeros");
                return false;
            }
            
        }
        function validarContrasena(){
            var contrasena=document.getElementById("contrasena").value;
            var expresion = /^[a-zA-Z0-9]+$/; 

            if (contrasena === null || contrasena.trim() === "") {
                alert("El campo de contraseña no puede estar vacío.");
                return false;
            } else if (contrasena.match(expresion)) {
                return true;
            } else {
                alert("El campo de contraseña debe contener numeros o letras");
                return false;
            }
        }
        function redireccionar(){
            var id=document.getElementById("ID").value;
            var contrasena=document.getElementById("contrasena").value;
            
            if(validarContrasena()&&validarID()){
                window.location.href="http://localhost:8080/4TEC_Javascript/Intermedio.jsp?ID="+id+"&Contrasena="+contrasena;
            }
        }
        
    </script>
    <body id="cuerpo-Inicio">

        <table id="esqueleto-Inicio">
            <tr>
                <td>
                    <div id="encabezado-Inicio">
                        <h1>Inicia en la 4TEC</h1>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="registro-Form">
                        <h1 id="titulo-Index">Ingrese el alumno</h1>
                       <form action="Intermedio.jsp">
                           <p class="contenedor-ID">
                               <b>ID </b><input id="ID" type="number" name="ID" class="entradaDatos"/> <br>
                           </p>
                           <p class="contenedor-Contrasena">
                               <b>Contraseña </b><input id="contrasena" type="password" name="Contrasena" class="entradaDatos" /> 
                           </p>
                           <input id="boton-Iniciar" type="button" onclick="redireccionar();"  value="Siguiente" >
                         </form>
                    </div>
                </td>
            </tr>
            
            <tr>
                <td>
                    <div id="mensaje-error">
                        <h2>
                            <%
           String mensaje=request.getParameter("mensaje");
           if(!(mensaje==null))out.println("<br>"+mensaje.replace("_", " "));
           %>
                        </h2>
                    </div>
                </td>
            </tr>
        </table>
        
           
    </body>
</html>
