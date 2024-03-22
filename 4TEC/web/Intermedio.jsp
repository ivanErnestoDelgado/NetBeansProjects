<%-- 
    Document   : Intermedio
    Created on : 14/03/2024, 07:48:29 AM
    Author     : SADValenz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usuario=request.getParameter("Usuario");
            String contrasena=request.getParameter("Contrasena");
            if((usuario==null)||(contrasena==null)){
            response.sendRedirect("http://localhost:8080/4TEC/index.jsp");
            }
            if((usuario=="")||(contrasena=="")){
            response.sendRedirect("http://localhost:8080/4TEC/index.jsp");
            }
           
            try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection con = null;
            try {
                con = DriverManager.getConnection("jdbc:sqlite:C:/SQlite/4TEC");
                
                PreparedStatement prep = con.prepareStatement(
                        "SELECT * FROM alumnos where nombre=?;");
                
                prep.setString(1, usuario);
                
                ResultSet rs = prep.executeQuery();
                String resultado="";
                while (rs.next()) {
                    resultado= rs.getString(2);
                    out.println(resultado);
                    //si la contraseña que vienen con el usuario en la base de datos no coincide te redirige al index
                    if(!(rs.getString(3).equals(contrasena)))response.sendRedirect("http://localhost:8080/4TEC/index.jsp?mensaje=Clave_Incorrecta");
                    
                }
                if(resultado.equals("")){
                    out.println("Usuario nuevo <br> ¿Desea registrarse?");
                    out.println("<a href=\"http://localhost:8080/4TEC/registro.jsp\">Si</a> o");
                    out.println("<a href=\"http://localhost:8080/4TEC/index.jsp\">No</a>");
                    
                    HttpSession sesion= request.getSession();
                    
                    
            
                ArrayList<String> profesores=new ArrayList<>();
                PreparedStatement profes = con.prepareStatement(
                        "SELECT * FROM profesores");
                ResultSet resultadoProfes=profes.executeQuery();
                
                while (resultadoProfes.next()) {
                    resultado= resultadoProfes.getString(2);
                    profesores.add(resultado);
                }
                
                String lastima1= request.getParameter("Lastima1");
                String Lloriqueos2= request.getParameter("Lloriqueos2");
                String DOA= request.getParameter("DOA");
                String Genero= request.getParameter("Genero");

                sesion.setAttribute("docentes", profesores);
                
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
                
                sesion.setAttribute("usuario", usuario);
                sesion.setAttribute("contrasena", contrasena);
                
                    return;
                    } 
                /*
                PreparedStatement prep = con.prepareStatement(
                        "insert into alumno values (?, ?);");
 
                prep.setString(1, "Gandhi");
                prep.setString(2, "Perez");
                prep.execute();
                // Add your database operations here
                */
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
