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
            String n1=request.getParameter("numero1");
            String n2= request.getParameter("numero2");
            String Remitente=request.getHeader("referer");
            boolean parametroPrimeroEsNumerico,parametroSegundoEsNumerico;
            String mensaje=""; 
            float resultado=0;
            
            if((n2==null)||(n1==null))
            {
                mensaje=(n1==null)?"_Numero_1":"";
               mensaje+=(n2==null)?"_Numero_2":"";
                 mensaje="http://localhost:8080/sumaProyecto/index.jsp?mensaje=Los_Campos_nulos_son:_"+mensaje;
            response.sendRedirect(mensaje);
            return;
            }
            if((Remitente==null)||(!Remitente.contains("http://localhost:8080/sumaProyecto/"))){
                            response.sendRedirect("http://localhost:8080/sumaProyecto/index.jsp?mensaje=Pagina_de_acceso_invalida");
                            return;
            }
            if((n1.equals(""))||(n2.equals(""))){
               mensaje=(n1=="")?"_Numero_1":"";
               mensaje+=(n2=="")?"_Numero_2":"";
             mensaje="http://localhost:8080/sumaProyecto/index.jsp?mensaje=Los_Campos_vacios_son:"+mensaje;
            response.sendRedirect(mensaje);
            return;
            }
            
            try {
                    resultado+=Float.parseFloat(n1);
                    parametroPrimeroEsNumerico=true;
                } catch (Exception e) {
                    parametroPrimeroEsNumerico=false;
                }
            
            try {
                    resultado+=Float.parseFloat(n2);
                    parametroSegundoEsNumerico=true;
                } catch (Exception e) {
                    
                    parametroSegundoEsNumerico=false;
                }
            if(!(parametroPrimeroEsNumerico&&parametroSegundoEsNumerico)){
                mensaje=(parametroPrimeroEsNumerico)?"":"_Numero_1";
               mensaje+=(parametroSegundoEsNumerico)?"":"_Numero_2";
                mensaje="http://localhost:8080/sumaProyecto/index.jsp?mensaje=Los_Campos_mal_escritos_son:_"+mensaje;
             response.sendRedirect(mensaje);
            return;
            }
        %>
        
        
        <%=n1%> +<%=n2%><b>=<%=resultado%></b><br>
        
       
        
        
    </body>
</html>
