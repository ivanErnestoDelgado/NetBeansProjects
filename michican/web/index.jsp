<%-- 
    Document   : index
    Created on : 28/05/2024, 09:53:46 PM
    Author     : SADValenz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <script>
        function redireccionarRegistro(){
            window.location.href="mascota.jsp?registro";
        }
    </script>
    <%
        HttpSession sesion = request.getSession();

        if (!(sesion.isNew())) {
            sesion.invalidate();
        }
    %>
    <body class="index-body">
        <header>
            <nav class="barraNavegacion">
                <div class="titulo-pagina">
                    <a>Michican</a>
                </div>
                <ul class="Menu-barra-navegacion">
                    <li class="elemento-barra"><a href="login.jsp">Iniciar sesion</a></li>
                    <li class="elemento-barra"><a href="registro.jsp">Registrarse</a></li>
                    <li class="elemento-barra"><a href="michican.jsp">Nosotros</a></li>
                    <li class="elemento-barra"><a href="SVServicios">Servicios</a></li>
                    <li class="elemento-barra"><a href="contacto.jsp">Contacto</a></li>
                </ul>
            </nav>
        </header>
        
            <div class="padre">
                <div class="contenedor-Texto">
                    <h1 id="titulo-Index">Bienvenido a Michican</h1>
                    <p>En Michican, nuestra pasión es el bienestar y la salud de sus mascotas. Nos enorgullecemos de ofrecer una atención veterinaria de calidad y personalizada, con un equipo de profesionales dedicados y experimentados.</p>
                    <button onclick="redireccionarRegistro();">¡Inicie con nosotros!</button>
                </div>
            </div>
    

    </body>

</html>
