<%-- 
    Document   : tercera
    Created on : 12/03/2024, 09:25:32 PM
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
            String Materia= request.getParameter("materia");
            out.println(Materia.replace("_"," "));
            HttpSession sesion= request.getSession();
            String profesores=(String) sesion.getAttribute("docentes");
            String profesoresfiltrados=profesores;
            
            if(Materia.contains("Lastima")) profesoresfiltrados=(profesores.replace(",Ileanovsky",""));
            String[] arregloProfes=profesoresfiltrados.split(",");
            
            
            String materias_profes= (sesion.getAttribute("Materias_Profes"))==null?"":(String)sesion.getAttribute("Materias_Profes");
            sesion.removeAttribute("Materias_Profes");
            materias_profes+=Materia+": ";
            
            
            if(Materia.contains("Drama")){
            sesion.removeAttribute("DOA");
            }
            if(Materia.contains("Lloriqueos")){
            sesion.removeAttribute("Lloriqueos2");
            }
            if(Materia.contains("Lastima")){
            sesion.removeAttribute("lastima1");
            }
            
            sesion.setAttribute("Materias_Profes", materias_profes);
            if(!(profesoresfiltrados.length()<3)){
            out.println("<br>Escoger profesor <br>");
            out.println("<form action=\"segunda.jsp\">");
           
           for (String profe : arregloProfes) {
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
