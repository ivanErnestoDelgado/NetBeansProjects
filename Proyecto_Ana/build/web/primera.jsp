

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <%
            String usuario=request.getParameter("Usuario");
            String contrasena=request.getParameter("Contrasena");
            if((usuario==null)||(contrasena==null)){
            response.sendRedirect("http://localhost:8080/Proyecto_Ana/index.jsp");
            }
            if((usuario=="")||(contrasena=="")){
            response.sendRedirect("http://localhost:8080/Proyecto_Ana/index.jsp");
            }
            if((usuario.matches("[a-zA-Z0-9_áéíóúÁÉÍÓÚñÑ]+")||contrasena.matches("[a-zA-Z0-9_]+"))==false){
              response.sendRedirect("http://localhost:8080/Proyecto_Ana/index.jsp?mensaje=Ingresaste_valores_invalidos");
           }
           
            try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection con = null;
            try {
                String ruta="C:/Users/MQDC/Documents/NetBeansProjects/Proyecto_Ana/4TEC";
                con = DriverManager.getConnection("jdbc:sqlite:"+ruta);
                
                PreparedStatement prep = con.prepareStatement(
                        "SELECT * FROM alumnos where nombre=?;");
                
                prep.setString(1, usuario);
                
                ResultSet rs = prep.executeQuery();
                int id=0;
                String resultado="";
                while (rs.next()) {
                    id=rs.getInt(1);
                    resultado= rs.getString(2);
                    out.println("<h1><i>Hola, bienvenido a la 4TEC "+resultado+"<br><i></h1>");
                  
                    if(!(rs.getString(3).equals(contrasena)))response.sendRedirect("http://localhost:8080/Proyecto_Ana/index.jsp?mensaje=Clave_Incorrecta");
                    out.println("<h2>Tu genero es "+rs.getString(4)+"<h2><br>");
                }
                if(resultado.equals("")){
                    out.println(" hola. al parecer usted es nuevo ¿Desea registrarse?");
                    out.println("<a href=\"http://localhost:8080/Proyecto_Ana/registro.jsp\">Si</a> o");
                    out.println("<a href=\"http://localhost:8080/Proyecto_Ana/index.jsp\">No</a>");
                    
                    HttpSession sesion= request.getSession();
                    
                    
            
                ArrayList<String> profesores=new ArrayList();
                PreparedStatement profes = con.prepareStatement(
                        "SELECT * FROM profesores");
                ResultSet resultadoProfes=profes.executeQuery();
                
                while (resultadoProfes.next()) {
                    resultado= resultadoProfes.getString(2);
                    profesores.add(resultado);
                }
                
                String lastima1= request.getParameter("Lastima1");
                String Lloriqueos2= request.getParameter("Lloriqueos2");
                String DOA= request.getParameter("DramaOA");
                String Genero= request.getParameter("Genero");

                sesion.setAttribute("docentes", profesores);
                
                sesion.setAttribute("Genero", Genero);
                if(DOA!=null){
                sesion.setAttribute("DramaOA", DOA);
                }
                if(Lloriqueos2!=null){
                sesion.setAttribute("Lloriqueos2", Lloriqueos2);
                }
                if(lastima1!=null){
                sesion.setAttribute("lastima1", lastima1);
                }
                
                sesion.setAttribute("usuario", usuario);
                sesion.setAttribute("contrasena", contrasena);
                
                    return;
                }
                
                PreparedStatement materias = con.prepareStatement(
                        "SELECT * FROM materias where alumno=?;");
                
                materias.setInt(1, id);
                
                ResultSet resultadoMaterias = materias.executeQuery();
                
                out.println("<h2>Estas materias llevaras:</h2>");
                while (resultadoMaterias.next()) {
                    String nombre= resultadoMaterias.getString(1);
                    out.println(nombre);
                    
                    int idDocente=resultadoMaterias.getInt(3);
                    
                    PreparedStatement obtenerNombreDocente = con.prepareStatement(
                        "SELECT * FROM  profesores where id_profesor=?;");
                    obtenerNombreDocente.setInt(1, idDocente);
                
                    ResultSet docenteObtenido = obtenerNombreDocente.executeQuery();
                    while (docenteObtenido.next()) {
                    String nombreDocente= docenteObtenido.getString(2);
                    out.println("sera impartida por el profesor: "+nombreDocente+"<br>");
                }
                    
                }
                
                PreparedStatement Cursos = con.prepareStatement(
                        "SELECT * FROM cursos where alumno=?;");
                
                Cursos.setInt(1, id);
                
                ResultSet resultadoCursos = Cursos.executeQuery();
                
                out.println("<h3>Curso que llevaras es:</h3>");
                while (resultadoCursos.next()) {
                    String nombre= resultadoCursos.getString(1);
                    out.println(nombre+"<br>");
                }
                
            
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
            
            

        %>
        
       
        
    </body>
</html>
