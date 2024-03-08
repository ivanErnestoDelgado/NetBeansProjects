<%-- 
    Document   : index
    Created on : 7/03/2024, 07:18:05 AM
    Author     : SADValenz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        Indroduzca dos numeros:
        <form action="respuesta.jsp" >
            numero 1:
            <input type="text" name="numero1" value=""/>
            numero 2:
            <input type="text" name="numero2" value=""/>
            <input type="submit" value="apachurra"/>
            <%   
            String mensaje=request.getParameter("mensaje");
            if(mensaje!=null)out.println(mensaje.replace("_", " "));
            %>
            
        </form>
    </body>
</html>
