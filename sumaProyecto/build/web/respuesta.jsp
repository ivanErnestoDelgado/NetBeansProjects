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
            String Remitente=request.getHeader("referer");
            float res;
            
            if((n2==null)||(n1==null))
            {
                String mensaje="";
                mensaje=(n1==null)?"Num_1":"";
               mensaje+=(n2==null)?"Num_2":"";
                 mensaje="http://localhost:8080/sumaProyecto/index.jsp?mensaje=Los_Campos_nulos_son:_"+mensaje;
            response.sendRedirect(mensaje);
            return;
            }
            if((Remitente==null)||(!Remitente.contains("http://localhost:8080/sumaProyecto/"))){
                            response.sendRedirect("http://localhost:8080/sumaProyecto/index.jsp?mensaje=Pagina_de_acceso_invalida");
                            return;
            }
            
                    
           
           
            if((n1.equals(""))||(n2.equals(""))){
               String mensaje=""; 
               mensaje=(n1=="")?"Num_1":"";
               mensaje+=(n2=="")?"Num_2":"";
             mensaje="http://localhost:8080/sumaProyecto/index.jsp?mensaje=Los_Campos_vacios_son:"+mensaje;
            response.sendRedirect(mensaje);
            return;
            }
            
            try{
                if(n1.matches("")){}
                res=Float.parseFloat(n1)+Float.parseFloat(n2);
                out.println("Todo bien loco"+"<br>");
            }catch(NumberFormatException e){
             
             String mensaje="http://localhost:8080/sumaProyecto/index.jsp?mensaje=Los_Campos_mal_escritos_son:_";
             response.sendRedirect(mensaje);
            return;
            };
        %>
        
        
        <%=n1%> +<%=n2%><b>=<%=res%></b><br>
        
        <%=Remitente%>
        
        
    </body>
</html>
