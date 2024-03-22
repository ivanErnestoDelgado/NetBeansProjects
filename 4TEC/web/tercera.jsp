<%-- 
    Document   : tercera
    Created on : 12/03/2024, 09:25:32 PM
    Author     : SADValenz
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String Materia= request.getParameter("materia").replace("_"," ");
            out.println(Materia);
            HttpSession sesion= request.getSession();
            ArrayList<String> profesoresDisponibles=(ArrayList<String>) sesion.getAttribute("docentes");
            ArrayList<String> materiasEscogidas=(ArrayList<String>) sesion.getAttribute("materiasEscogidas");
            
            ArrayList<String> profesores=(ArrayList<String>)profesoresDisponibles.clone();
            
            materiasEscogidas.add(Materia);
            if(Materia.contains("Lastima"))profesores.remove("Ileanovsky");
            
            if(Materia.contains("Drama")){
            sesion.removeAttribute("DOA");
            }
            
            if(Materia.contains("Lloriqueos")){
            sesion.removeAttribute("Lloriqueos2");
            }
            if(Materia.contains("Lastima")){
            sesion.removeAttribute("lastima1");
            }
            
            
            if(!(profesores.isEmpty())){
            out.println("<br>Escoger profesor <br>");
            out.println("<form action=\"segunda.jsp\">");
           
           for (String profe : profesores) {
                   out.println(" <input type=\"radio\" name=\"profesores\" value=\""+profe+"\" checked=\"checked\"/>"+profe+"<br>");
               }
           out.println("<input type=\"submit\" value=\"Escoger\">");
           out.println("</form>");
           return;
            }
            out.println("<br> No se encontraron profesores disponibles");
        %>
    </body>
</html>
