

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Registro de cursos disponibles</h1>
        <%
            HttpSession sesion= request.getSession();
            String Genero=(String) session.getAttribute("Genero");
        if(Genero.equals("Hombre")) {
                    sesion.setAttribute("Genero", Genero);
                   out.println("para usted solo esta el curso de mansplaining<br>");
                   out.println("<a href=\"http://localhost:8080/Proyecto_Ana/segunda.jsp?Curso=Mansplaining\">Siguiente</a>");
        }
        if(Genero.equals("Otros")){
                out.println("<form action=\"segunda.jsp\">Especifique su genero: <br><input type=\"text\" name=\"GeneroEspecificado\"/><input type=\"submit\" value=\"Enviar\"></form>");
                sesion.setAttribute("Curso", "No hay curso para ti, la sociedad le debe");
                }


                if(Genero.equals("Mujer")) {
                        out.println("<form action=\"segunda.jsp\">");
                        out.println("Seleccione curso:<br>");
                        out.println("<input type=\"radio\" name=\"Curso\" value=\"Plomeria\" checked=\"check\"/> Curso de plomeria");
                        out.println("<input type=\"radio\" name=\"Curso\" value=\"Albañileria\" /> Curso de albañileria");
                        out.println("<br><input type=\"submit\" value=\"enviar\">");
                        out.println("</form>");
                        sesion.setAttribute("Genero", Genero);
                    }
                ArrayList<String> materiasEscogidas=new ArrayList();
                ArrayList<String> profesoresEscogidos=new ArrayList();
                sesion.setAttribute("materiasEscogidas", materiasEscogidas );
                sesion.setAttribute("profesoresEscogidos", profesoresEscogidos );
          %>          
    </body>
</html>

