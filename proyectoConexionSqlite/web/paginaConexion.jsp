<%-- 
    Document   : paginaConexion
    Created on : 5/03/2024, 09:53:57 PM
    Author     : SADValenz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conexion</title>
    </head>
    <body>
        <% 
            
            Connection conn = null;
        try {
            // db parameters
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:C:/Users/SADValenz/Desktop/proyecto/my.exe";
            // create a connection to the database
            conn = DriverManager.getConnection(url);
            
            out.println("Connection to SQLite has been established.");
            
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
        }
        conn.close();
        %>
    </body>
</html>
