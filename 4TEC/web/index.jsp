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
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sesion= request.getSession();
           String profesores="medelAMLO,Faustinho,Ileanovsky";
           sesion.setAttribute("docentes", profesores);
           %>
           
           <h1>Ingrese alumno</h1>
           <form action="segunda.jsp">
            Usuario: <input type="text" name="Usuario"/> <br>
            Contraseña: <input type="text" name="Contrasena" /> <br>
            Materias a seleccionar:<br>
            <input type="checkbox" name="Lastima1" value="ON" checked="checked"/> Lastima l
            <input type="checkbox" name="Lloriqueos2" value="ON" /> Lloriqueos ll
            <input type="checkbox" name="DOA" value="ON"/> Drama orientado a objetos <br>
            Genero:
            <select name="Genero">
                <option>Mujer</option>
                <option>Otres:</option>
                <option>Hombre</option>
            </select><br>
            <br><input type="submit" value="apachurra">
        </form>
    </body>
</html>
