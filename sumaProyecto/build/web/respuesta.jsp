<%-- 
    Document   : respuesta
    Created on : 5/03/2024, 07:17:22 AM
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
            String liga="index.html";
            String n1=request.getParameter("numero1");
            String n2= request.getParameter("numero2");
            float res;
            if((n2==null)||(n1==null))
            {
            out.println("Eres nulo loco");
            out.println("<br><a href="+liga+">Regresar</a>");
            return;
            }
            if((n1.equals(""))||(n2.equals(""))){
            out.println("No le escribiste bien loco");
            out.println("<br><a href="+liga+">Regresar</a>");
            return;
            }
            try{
                res=Float.parseFloat(n1)+Float.parseFloat(n2);
            }catch(NumberFormatException e){
            out.println("No le escribiste numero loco");
            out.println("<br><a href="+liga+">Regresar</a>");
            return;
            };
        %>
        
        <a href=""></a>
        
        <%=n1%> +<%=n2%><b>=<%=res%></b>
    </body>
</html>
