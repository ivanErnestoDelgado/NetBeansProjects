
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenida</title>
    </head>
    <script>
        function redireccionar(){
            var id=document.getElementById("ID").value;
            var contrasena=document.getElementById("contrasena").value;
            
            if(!validarContrasena()&&!validarID()){
                window.location.href="http://localhost:8080/Proyecto_Ana/Intermedio.jsp?mensaje=Campos_Invalidos;
            }
        }
        
    function validarID(){
            var valor=document.getElementById("nombre").value;
            var expresion = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+(?:\s+[a-zA-ZáéíóúÁÉÍÓÚñÑ]+)*$/; // Expresión regular para permitir letras, números y espacios exceptuando al principio

            if (valor === null || valor.trim() === "") {
                alert("El campo no puede estar vacío.");
                return false;
            } else if (valor.match(expresion)) {
                return true;
            } else {
                alert("No se admiten caracteres especiales ni numeros ni espacios al principio.");
                return false;
            }
            
        }
        function validarContrasena(){
            var contrasena=document.getElementById("contra").value;
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
        </script>
    <body>
        <%
        HttpSession sesion= request.getSession();
        
        if(!(sesion.isNew())){
            sesion.invalidate();
        }
           
           %>
           
           <h1><i>Iniciar Sesion</i></h1>
           <hr>
           <form action="primera.jsp">
            Nombre: <input id="nombre" type="text" name="Usuario"/> <br>
            Contraseña: <input  id="contra" type="password" name="Contrasena" /> <br>
             Seleccione su Genero:
            <select name="Genero">
                <option>Mujer</option>
                <option>Otros</option>
                <option>Hombre</option>
            </select><br>
            <h3> sleccione las materias para su horario</h3>
            Estas son las materias disponibles:<br>
            <input type="checkbox" name="Lastima1" value="ON" checked="checked"/> Lastima l<br>
            <input type="checkbox" name="Lloriqueos2" value="ON" /> Lloriqueos 2<br>
            <input type="checkbox" name="DramaOA" value="ON"/> Drama orientado a objetos <br>
           
            <br><input type="submit" onclick="redireccionar();" value="SIGUENTE">
        </form>
           <%
           String mensaje=request.getParameter("mensaje");
           if(!(mensaje==null))out.println("<br>"+mensaje.replace("_", " "));
           %>
    </body>
</html>
