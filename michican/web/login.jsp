<%-- 
    Document   : inicio
    Created on : 28/05/2024, 10:00:37 PM
    Author     : SADValenz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <%
    HttpSession sesion=request.getSession();
        String procedencia=request.getHeader("referer");
            if(procedencia==null){
                response.sendRedirect("index.jsp");
            } 
    %>
    <script>
        
        function validarCorreo(){
            var id=document.getElementById("correo").value;
            var expresion = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 

            if (id === null || id.trim() === "") {
                alert("El campo de correo no debe estar vacio.");
                return false;
            } else if (id.match(expresion)) {
                return true;
            } else {
                alert("El formato de correo no esta correcto.");
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
            var correo=document.getElementById("correo").value;
            var contrasena=document.getElementById("contrasena").value;
            var modo=sessionStorage.getItem("Modo");
            
            if(validarContrasena()&&validarCorreo()){
                window.location.href="http://localhost:8080/michican/SVInicio?Correo="+correo+"&Contrasena="+contrasena+"&modo="+modo;
            }
        }
        function cambiarModo(numeroModo){
            var titulo=document.getElementById("titulo-login");
            switch(numeroModo){
                case 1:{
                    titulo.innerHTML="Cliente";
                    break;
                }

                case 2:{
                    titulo.innerHTML="Administrador";
                    break;
                }
            }
            subirModo(numeroModo);
        }
        function subirModo(numeroModo){
            sessionStorage.setItem("Modo",numeroModo);
        }
    </script>
    <body id="cuerpo-Inicio" onload="subirModo(1);" class="login-body">
        <nav class="barraNavegacion">
                <div class="titulo-pagina">
                    <a>Iniciar Sesion</a>
                </div>
                <ul class="Menu-barra-navegacion">
                    <li class="elemento-barra"><a onclick="cambiarModo(2);">Administrador</a></li>
                    <li class="elemento-barra"><a onclick="cambiarModo(1)">Cliente</a></li>
                </ul>
            </nav>
        <section class="contenido">
        <table id="esqueleto-Inicio">
            <tr>
                <td>
                    <div id="encabezado-Inicio">
                        <h1 id="titulo-login">Cliente</h1>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="padre">
                        <div class="inicio-sesion">
                            <h1 id="titulo-Index">Ingrese sus datos</h1>
                            <form action="SVInicio">
                                <p class="contenedor-Correo">
                                    <b>Correo:</b><input id="correo" type="text" name="ID" class="entradaDatos"/> <br>
                                </p>
                                <p class="contenedor-Contrasena">
                                    <b>Contraseña: </b><input id="contrasena" type="password" name="Contrasena" class="entradaDatos" /> 
                                </p>
                                <input class="boton" type="button" onclick="redireccionar();" value="Iniciar Sesion"/>
                            </form>
                        </div>
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
        
     </section>
    </body>
</html>
