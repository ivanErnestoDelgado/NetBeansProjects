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
        
        if(!(sesion.isNew())){
            sesion.invalidate();
        }
           
           %>
           
           <h1>Ingrese alumno</h1>
           <form action="Intermedio.jsp">
            Nombre: <input type="text" name="Usuario"/> <br>
            Contraseña: <input type="text" name="Contrasena" /> <br>
            <br><input type="submit" value="Siguiente">
        </form>
           <%
           String mensaje=request.getParameter("mensaje");
           if(!(mensaje==null))out.println("<br>"+mensaje.replace("_", " "));
           %>
    </body>
</html>
