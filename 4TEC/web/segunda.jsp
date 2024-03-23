<%-- 
    Document   : segunda
    Created on : 12/03/2024, 07:38:37 AM
    Author     : SADValenz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Seleccione para escoger profesor: <br>
        <% 
            String procedencia=request.getHeader("referer");
            if((procedencia==null)||(!procedencia.contains("http://localhost:8080/4TEC/"))){
                response.sendRedirect("http://localhost:8080/4TEC/index.jsp");
            }
            HttpSession sesion= request.getSession();
            String lastima1=(String) sesion.getAttribute("Lastima1");
            String Lloriqueos2=(String) sesion.getAttribute("Lloriqueos2");
            String DOA=(String) sesion.getAttribute("DOA");
            boolean bandera=false;
            
            String Genero=request.getParameter("GeneroEspecificado");
            
            if(Genero==null){
            Genero=(String) sesion.getAttribute("Genero");
            }
            else{
            sesion.setAttribute("Genero", Genero );
            }
            
            String Curso=request.getParameter("Curso");
            if(Curso==null){
            Curso=(String)sesion.getAttribute("Curso");
            }else{
            sesion.setAttribute("Curso", Curso );
            }
            
            
            
           if(sesion.getAttribute("DOA")!=null){
           out.println("<a href=\"http://localhost:8080/4TEC/tercera.jsp?materia=Drama_Orientado_A_Objetos\">Drama orientado a objetos</a><br>");
           bandera=true;
           }
           if(sesion.getAttribute("Lloriqueos2")!=null){
           out.println("<a href=\"http://localhost:8080/4TEC/tercera.jsp?materia=Lloriqueos_ll\">Lloriqueos ll</a><br>");
           bandera=true;
           }
           if(sesion.getAttribute("lastima1")!=null){
           out.println("<a href=\"http://localhost:8080/4TEC/tercera.jsp?materia=Lastima_l\">Lastima l</a><br>");
           bandera=true;
           }
           
            String profeEscogido= request.getParameter("profesores");
            
            ArrayList<String> profesoresDisponibles=(ArrayList<String>) sesion.getAttribute("docentes");
            
            ArrayList<String> materiasEscogidas=(ArrayList<String>) sesion.getAttribute("materiasEscogidas");
            ArrayList<String> profesoresEscogidos= (ArrayList<String>) sesion.getAttribute("profesoresEscogidos"); 
            if(!(profeEscogido==null)){
            profesoresDisponibles.remove(profeEscogido);
            sesion.removeAttribute("docentes");
            sesion.setAttribute("docentes",profesoresDisponibles);
            if(!(profesoresEscogidos.contains(profeEscogido)))profesoresEscogidos.add(profeEscogido);        
            for(int x=1;x<=materiasEscogidas.size();x++){
            out.println(materiasEscogidas.get((x-1))+": "+profesoresEscogidos.get((x-1))+"<br>");
                
            }
            
            }
        %>
        Genero:<%=" "+Genero%> <br>
        Curso:<%=" "+Curso%><br>
        
        <%
            
            if(!(bandera)){
                
                
                out.println("<h2>Registro culminado</h2>");
                try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection con = null;
            try {
                String ruta="C://Users/SADValenz/Documents/NetBeansProjects/4TEC/4TEC";
                con = DriverManager.getConnection("jdbc:sqlite:"+ruta);
                
                
                String usuario=(String) sesion.getAttribute("usuario");
                String contrasena=(String) sesion.getAttribute("contrasena");
                
                PreparedStatement comprobacion = con.prepareStatement(
                        "SELECT * FROM alumnos where nombre=?;");
                
                comprobacion.setString(1, usuario);
                
                ResultSet resultadoComprobacion = comprobacion.executeQuery();
                String existencia="";
                while (resultadoComprobacion.next()) {
                    
                    existencia= resultadoComprobacion.getString(2);
                }
                if(!(existencia.equals(""))){
                    out.println("<a href=\"http://localhost:8080/4TEC/index.jsp\">Regresar</a>");
                    return;
                }
                
                
                
                PreparedStatement consultaUsuario = con.prepareStatement(
                        "insert into alumnos(nombre,clave,genero) values(?,?,?)");
                
                consultaUsuario.setString(1, usuario);
                consultaUsuario.setString(2, contrasena);
                consultaUsuario.setString(3, Genero);
                consultaUsuario.execute();
                
                //obtengo la id del alumno insertado para su uso en las claves foraneas
                PreparedStatement prep = con.prepareStatement(
                        "SELECT * FROM alumnos where nombre=?;");
                
                prep.setString(1, usuario);
                
                ResultSet rs = prep.executeQuery();
                int resultado=0;
                while (rs.next()) {
                    resultado= rs.getInt(1);
                }
                
                //hago la consulta de cursos
                PreparedStatement consultaCursos = con.prepareStatement(
                        "insert into cursos values(?,?)");
                
                consultaCursos.setString(1, Curso);
                consultaCursos.setInt(2, resultado);
                consultaCursos.execute();
                
                int idObtenida=0;
                for(int x=1;x<=materiasEscogidas.size();x++){
                PreparedStatement consultaMaterias = con.prepareStatement(
                        "insert into materias values(?,?,?)");
                
                consultaMaterias.setString(1, materiasEscogidas.get((x-1)));
                consultaMaterias.setInt(2, resultado);
                
                //Aqui primero busco la ID del docente mediante el nombre
                PreparedStatement obtenerIdDocente = con.prepareStatement(
                        "SELECT * FROM  profesores where nombre=?;");
                obtenerIdDocente.setString(1, profesoresEscogidos.get((x-1)));
                
                ResultSet docenteObtenido = obtenerIdDocente.executeQuery();
                while (docenteObtenido.next()) {
                    idObtenida= docenteObtenido.getInt(1);
                }
                
                //ya pongo la id obtenida del docente en la consulta
                consultaMaterias.setInt(3, idObtenida);
                consultaMaterias.execute();
                  
                }
                //imprimo la id del alumno
                out.println("<h3>tu ID es la siguiente: "+resultado+"<br>");
                out.println("Gardala bien</h3>");
                out.println("<a href=\"http://localhost:8080/4TEC/index.jsp\">Regresar</a>");
                
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            }
        
        
        %>
        
    </body>
</html>
