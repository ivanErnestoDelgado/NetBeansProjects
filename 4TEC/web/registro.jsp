<%-- 
    Document   : registro
    Created on : 20/03/2024, 08:30:29 PM
    Author     : SADValenz
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Segundo Registro</title>
    </head>
    <body>
       
        <%
            HttpSession sesion= request.getSession();
            
            String procedencia=request.getHeader("referer");
            if((procedencia==null)||(!procedencia.contains("http://localhost:8080/4TEC/"))){
                response.sendRedirect("http://localhost:8080/4TEC/index.jsp");
            }
            
            String Genero= request.getParameter("Genero");
              session.setAttribute("Genero",Genero);
            
            
            
            String lastima1= request.getParameter("Lastima1");
                String Lloriqueos2= request.getParameter("Lloriqueos2");
                String DOA= request.getParameter("DOA");
                

                
                
                
                sesion.setAttribute("Genero", Genero);
                if(DOA!=null){
                sesion.setAttribute("DOA", DOA);
                }
                if(Lloriqueos2!=null){
                sesion.setAttribute("Lloriqueos2", Lloriqueos2);
                }
                if(lastima1!=null){
                sesion.setAttribute("lastima1", lastima1);
                }
                
        if(Genero.equals("Hombre")) {
                    
                    
                    sesion.setAttribute("Genero", Genero);
                   out.println("Haras un curso de mansplaining<br>");
                   out.println("<a href=\"http://localhost:8080/4TEC/segunda.jsp?Curso=Mansplaining\">Aceptar</a>");
        }
        if(Genero.equals("Otros")){
                out.println("<h1>Especifique su genero</h1>");
                out.println("<form action=\"segunda.jsp\">Genero: <br><input type=\"text\" name=\"GeneroEspecificado\"/><input type=\"submit\" value=\"Enviar\"></form>");
                sesion.setAttribute("Curso", "No hay curso, la sociedad le debe");
                }


                if(Genero.equals("Mujer")) {
                    out.println("<h1>Seleccione los cursos</h1>");
                        out.println("<form action=\"segunda.jsp\">");
                        out.println("Seleccione curso:<br>");
                        out.println("<input type=\"radio\" name=\"Curso\" value=\"Plomeria\" checked=\"check\"/> Curso de plomeria");
                        out.println("<input type=\"radio\" name=\"Curso\" value=\"Albañileria\" /> Curso de albañileria");
                        out.println("<br><input type=\"submit\" value=\"enviar\">");
                        out.println("</form>");
                        sesion.setAttribute("Genero", Genero);
                    }
                
                ArrayList<String> materiasEscogidas=new ArrayList<>();
                ArrayList<String> profesoresEscogidos=new ArrayList<>();
                sesion.setAttribute("materiasEscogidas", materiasEscogidas );
                sesion.setAttribute("profesoresEscogidos", profesoresEscogidos );
          %>          
    </body>
</html>
