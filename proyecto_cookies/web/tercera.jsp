<%-- 
    Document   : tercera
    Created on : 11/03/2024, 05:52:51 PM
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
            String n=(String) sesion.getAttribute("nombre");
            if((n==null)||(n.equals(""))){
                response.sendRedirect("http://localhost:8080/proyecto_cookies/index.jsp");
            }
        %>
        hola <b><%=n%></b>
    </body>
</html>
