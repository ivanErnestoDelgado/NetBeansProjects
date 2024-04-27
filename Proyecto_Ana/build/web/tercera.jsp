
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hola</title>
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
            sesion.removeAttribute("DramaOA");
            }
            
            if(Materia.contains("Lloriqueos")){
            sesion.removeAttribute("Lloriqueos2");
            }
            if(Materia.contains("Lastima")){
            sesion.removeAttribute("lastima1");
            }
            
            
            if(!(profesores.isEmpty())){
            out.println("<br><h2>Estos son los profesores disponibles:</h2><br>");
            out.println("<form action=\"segunda.jsp\">");
           
           for (String profe : profesores) {
                   out.println(" <input type=\"radio\" name=\"profesores\" value=\""+profe+"\" checked=\"checked\"/>"+profe+"<br>");
               }
           out.println("<input type=\"submit\" value=\"Escoger\">");
           out.println("</form>");
           return;
            }
            out.println("<br> No se encontro ningun profesores disponibles");
        %>
    </body>
</html>