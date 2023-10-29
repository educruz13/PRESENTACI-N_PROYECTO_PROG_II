<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eliminar Proveedor</title>
    

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Eliminar Proveedor</h1>
        
        <%@ page import="java.sql.*" %>
        <%@ page import="modelo.Conexion" %>
        <%
      
            int idProveedor = Integer.parseInt(request.getParameter("id"));
            
            if (request.getMethod().equals("POST")) {
                Conexion con = new Conexion();
                con.abrir_conexion();
                
                try {
                   
                    String consulta = "DELETE FROM proveedores WHERE idproveedores = ?";
                    PreparedStatement pstmt = con.conexionBD.prepareStatement(consulta);
                    pstmt.setInt(1, idProveedor);
                    pstmt.executeUpdate();
        %>
                    <div class="alert alert-success mt-3" role="alert">
                        Proveedor eliminado correctamente.
                    </div>
        <%
                } catch (SQLException e) {
        %>
                    <div class="alert alert-danger mt-3" role="alert">
                        Error al eliminar proveedor, dato en otra tabla! : <%= e.getMessage() %>
                    </div>
        <%
                }
                
                con.cerrar_conexion();
            } else {
        %>
            <div class="alert alert-warning mt-3" role="alert">
                ¿Estás seguro de que deseas eliminar este proveedor?
            </div>
            <form action="eliminar.jsp?id=<%= idProveedor %>" method="post">
                <button type="submit" class="btn btn-danger">Sí, eliminar</button>
            </form>
        <%
            }
        %>
        
        <p class="mt-3"><a class="btn btn-primary" href="proveedor.jsp">Volver a la lista de proveedores</a></p>
    </div>
</body>
</html>
