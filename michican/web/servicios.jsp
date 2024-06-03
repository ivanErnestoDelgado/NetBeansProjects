<%-- 
    Document   : Servicios
    Created on : 28/05/2024, 10:13:30 PM
    Author     : SADValenz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Principal.modelos.servicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios</title>
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <%
         HttpSession sesion = request.getSession();
        String procedencia=request.getHeader("referer");
            if((procedencia==null)){
                response.sendRedirect("index.jsp");
                return;
            }
            
        ArrayList<servicio> servicios = (ArrayList) sesion.getAttribute("servicios");
        
        if((servicios==null)){
                response.sendRedirect("index.jsp");
                return;
            }
        
    %>
    <body class="servicios-body">
        <header>
            <nav class="barraNavegacion">
                <div class="titulo-pagina">
                    <a>Servicios</a>
                </div>
                <ul class="Menu-barra-navegacion">
                    <li class="elemento-barra"><a href="login.jsp">Iniciar sesion</a></li>
                    <li class="elemento-barra"><a href="registro.jsp">Registrarse</a></li>
                    <li class="elemento-barra"><a href="michican.jsp">Nosotros</a></li>
                    <li class="elemento-barra"><a href="servicios.jsp">Servicios</a></li>
                    <li class="elemento-barra"><a href="contacto.jsp">Contacto</a></li>
                </ul>
            </nav>
        </header>
        <div class="contenido">
            <table id="esqueleto">
                <tr>
                    <td>
                        <div class="padre">
                            <div class="servicios-contenedor">
                                <%
                                    for (int indice = 0; indice < servicios.size(); indice++) {
                                %>
                                <div class="servicios-registrados-estilo">
                                    <h3><%=servicios.get(indice).getNombre()%></h3><hr>
                                    <p> <%=servicios.get(indice).getDescripcion()%></p>
                                    <p>Costo: <%=servicios.get(indice).getCosto()%> USD</p>
                                </div> <br>
                                <%
                                    }
                                %>
                            </div>    
                        </div>

                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="padre">
                               
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
