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
        <link rel="stylesheet" href="./estilos.css">
        
        <title>Registrado</title>
    </head>
    
    <body id="cuerpo-Final"> 
        <% 
            String inicioRuta="http://localhost:8080/4TEC_Javascript/";
            String procedencia=request.getHeader("referer");
            if((procedencia==null)||(!procedencia.contains(inicioRuta))){
                
                response.sendRedirect(inicioRuta+"index.jsp");
                return;
                
            }
            
            HttpSession sesion= request.getSession();
            
            String ID=((sesion.getAttribute("ID")!=null)&&(sesion.getAttribute("ID")!="invalido")&&(sesion.getAttribute("ID")!="invalido"))?(String)sesion.getAttribute("ID"):"";
            String contrasena=((sesion.getAttribute("contrasena")!=null)&&(sesion.getAttribute("contrasena")!="invalido"))?(String)sesion.getAttribute("contrasena"):"";
            String DOO=request.getParameter("DOO");
            String lloriqueos2=request.getParameter("Lloriqueos2");
            String lastima1=request.getParameter("Lastima1");
            String Nombre=request.getParameter("Nombre");
            
            String MateriasImpartidas="";
            if((ID=="")||(contrasena=="")){
                String url=inicioRuta+"index.jsp?mensaje=Ingresaste_valores_vacios";
            response.sendRedirect(url);
            return;
            }
            if((!ID.matches("[0-9]+"))||(!contrasena.matches("[a-zA-Z0-9_]+"))){
                String url=inicioRuta+"index.jsp?mensaje=Ingresaste_valores_invalidos";
              response.sendRedirect(url);
              return;
            }              
            
            String Genero=request.getParameter("Genero");
          
            String Curso=request.getParameter("Curso");
            
            sesion.setAttribute("Curso", Curso );
           
            ArrayList<String> profesoresEscogidos=new  ArrayList();
            ArrayList<String> materiasEscogidas=new  ArrayList();
            
            if(DOO!=null){
            materiasEscogidas.add("Drama Orientado a Objetos");
            profesoresEscogidos.add(DOO);
            MateriasImpartidas+="Drama Orientado a Objetos impartida por "+DOO+"<br>";
            }
            if(lastima1!=null){
            materiasEscogidas.add("Lastima I");
            profesoresEscogidos.add(lastima1);
            MateriasImpartidas+="Lastima I impartida por "+ lastima1+"<br>";
            }
            if(lloriqueos2!=null){
            materiasEscogidas.add("Lloriqueos II");
            profesoresEscogidos.add(lloriqueos2);
            MateriasImpartidas+="Lloriqueos II impartida por "+lloriqueos2+"<br>";
            }
        %>
        
        <table id="esqueleto">
            <tr>
                <td>
                    <div id="encabezado-Final">
                        <h1>Comprobacion de registro</h1>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                     <div id="informacion-registrada-final">
                        <h3>Informacion general</h3>
                        <p>
                        Nombre: <%=Nombre%><br>
                        Genero: <%=Genero%><br>
                        Curso: <%=Curso%><br>
                        </p>
                        <h3>Materias</h3>
                        <p>
                        <%=MateriasImpartidas%>
                        </p>
                        <h2>Registro culminado</h2><br>
                        <a id="enlaceRegreso" href="http://localhost:8080/4TEC_Javascript/index.jsp">Regresar</a>
                    </div>
                </td>
            </tr>
        
        
        <%
            
                try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection con = null;
            try {
                String ruta="C://Users/SADValenz/Documents/NetBeansProjects/4TEC_Javascript/4TEC";
                con = DriverManager.getConnection("jdbc:sqlite:"+ruta);
                
                PreparedStatement comprobacion = con.prepareStatement(
                        "SELECT * FROM alumnos where id_alumno=?;");
                
                int idABuscar=0;
                try {
                        idABuscar=Integer.parseInt(ID);
                    } catch (NumberFormatException e) {
                        String url=inicioRuta+"index.jsp?mensaje=ID_Corrompida";
                        response.sendRedirect(url);
                        return;
                    }
                comprobacion.setInt(1, idABuscar);
                
                ResultSet resultadoComprobacion = comprobacion.executeQuery();
                String existencia="";
                while (resultadoComprobacion.next()) {
                    
                    existencia= resultadoComprobacion.getString(2);
                }
                
                if(!(existencia.equals(""))){
                    return;
                }
                
                
                
                PreparedStatement consultaUsuario = con.prepareStatement(
                        "insert into alumnos(id_alumno,nombre,clave,genero) values(?,?,?,?)");
                int idConvertida=0;
                try {
                        idConvertida=Integer.parseInt(ID);
                    } catch (NumberFormatException e) {
                        String url=inicioRuta+"index.jsp?mensaje=ID_Corrompida";
                        response.sendRedirect(url);
                        return;
                    }
                consultaUsuario.setInt(1, idConvertida);
                consultaUsuario.setString(2, Nombre);
                consultaUsuario.setString(3, contrasena);
                consultaUsuario.setString(4, Genero);
                consultaUsuario.execute();
                
                //obtengo la id del alumno insertado para su uso en las claves foraneas
                PreparedStatement prep = con.prepareStatement(
                        "SELECT * FROM alumnos where nombre=?;");
                
                prep.setString(1, Nombre);
                
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
