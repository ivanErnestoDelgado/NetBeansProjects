<%-- 
    Document   : respuesta
    Created on : 4/03/2024, 07:25:07 AM
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
            String a=request.getParameter("apellido");
            String s= request.getParameter("nombre");
            if((s==null)||(a==null))
            {
            out.println("Eres nulo loco");
            return;
            }
            if((s.equals(""))||(a.equals(""))){
            out.println("No le escribiste nada loco");
            return;
            } 
        %>
        
        <%=s%> <b><%=a%></b>
        
    </body>
</html>
