<%-- 
    Document   : segunda
    Created on : 11/03/2024, 05:52:31 PM
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
            String nombre= request.getParameter("nombre");
            HttpSession sesion= request.getSession();
            sesion.setAttribute("nombre", nombre);
        %>
        
        <a href="./tercera.jsp">Sera cierto</a>
    </body>
</html>
