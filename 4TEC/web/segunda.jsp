<%-- 
    Document   : segunda
    Created on : 12/03/2024, 07:38:37 AM
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
        Seleccione para escoger profesor: <br>
        <% String lastima1= request.getParameter("Lastima1");
            String Lloriqueos2= request.getParameter("Lloriqueos2");
            String DOA= request.getParameter("DOA");
            HttpSession sesion= request.getSession();
            
            String procedencia=request.getHeader("referer");
            String usuario=request.getParameter("Usuario");
            String contrasena=request.getParameter("Contrasena");
            
            if((usuario==null)||(contrasena==null)){
            response.sendRedirect("http://localhost:8080/4TEC/index.jsp");
            }
            if((procedencia==null)||(!procedencia.contains("http://localhost:8080/4TEC/"))){
                response.sendRedirect("http://localhost:8080/4TEC/index.jsp");
            }
                  
            if(DOA!=null){
            sesion.setAttribute("DOA", DOA);
            }
            if(Lloriqueos2!=null){
            sesion.setAttribute("Lloriqueos2", Lloriqueos2);
            }
            if(lastima1!=null){
            sesion.setAttribute("lastima1", lastima1);
            }
            
            
           if(sesion.getAttribute("DOA")!=null){
           out.println("<a href=\"http://localhost:8080/4TEC/tercera.jsp?materia=Drama_Orientado_A_Objetos\">Drama orientado a objetos</a><br>");
           }
           if(sesion.getAttribute("Lloriqueos2")!=null){
           out.println("<a href=\"http://localhost:8080/4TEC/tercera.jsp?materia=Lloriqueos_ll\">Lloriqueos ll</a><br>");
           }
           if(sesion.getAttribute("lastima1")!=null){
           out.println("<a href=\"http://localhost:8080/4TEC/tercera.jsp?materia=Lastima_l\">Lastima l</a><br>");
           }
           
            String profeEscogido= request.getParameter("profesores");
            
            if(!(profeEscogido==null)){
            String profesoresDisponibles=(String) session.getAttribute("docentes");
            profesoresDisponibles=profesoresDisponibles.replace(profeEscogido, " ");
            profesoresDisponibles=profesoresDisponibles.replace(", ", "");
            profesoresDisponibles=profesoresDisponibles.replace(" ,", "");
            sesion.removeAttribute("docentes");
            sesion.setAttribute("docentes",profesoresDisponibles);
            String materias_profes= (sesion.getAttribute("Materias_Profes"))==null?"":(String)sesion.getAttribute("Materias_Profes");
            sesion.removeAttribute("Materias_Profes");
            materias_profes+=profeEscogido+"<br>";
            sesion.setAttribute("Materias_Profes", materias_profes);
            
            out.println(materias_profes.replace("_", " "));
            }
        %>
        
    </body>
</html>
