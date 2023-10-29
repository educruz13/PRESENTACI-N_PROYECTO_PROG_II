<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insertar Proveedor</title>
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Insertar Nuevo Proveedor</h1>
        
        <%@ page import="java.sql.*" %>
        <%@ page import="modelo.Conexion" %>
        <%
            if (request.getMethod().equals("POST")) {
                String proveedor = request.getParameter("proveedor");
                String nit = request.getParameter("nit");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
               
                if (proveedor != null && nit != null && direccion != null && telefono != null) {
                    Conexion con = new Conexion();
                    con.abrir_conexion();
                    
                    try {
                        String consulta = "INSERT INTO proveedores (proveedor, nit, direccion, telefono) VALUES (?, ?, ?, ?)";
                        PreparedStatement pstmt = con.conexionBD.prepareStatement(consulta);
                        pstmt.setString(1, proveedor);
                        pstmt.setString(2, nit);
                        pstmt.setString(3, direccion);
                        pstmt.setString(4, telefono);
                        pstmt.executeUpdate();
        %>
                        <div class="alert alert-success mt-3" role="alert">
                            Proveedor insertado correctamente.
                        </div>
        <%
                    } catch (SQLException e) {
        %>
                        <div class="alert alert-danger mt-3" role="alert">
                            Error al insertar proveedor: <%= e.getMessage() %>
                        </div>
        <%
                    }
                    
                    con.cerrar_conexion();
                } else {
        %>
                    <div class="alert alert-warning mt-3" role="alert">
                        Por favor, complete todos los campos.
                    </div>
        <%
                }
            }
        %>
       
        <form action="insertar.jsp" method="post">
            <div class="form-group">
                <label for="proveedor">Proveedor:</label>
                <input type="text" class="form-control" id="proveedor" name="proveedor">
            </div>
            <div class="form-group">
                <label for="nit">NIT:</label>
                <input type="text" class="form-control" id="nit" name="nit">
            </div>
            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" class="form-control" id="direccion" name="direccion">
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="text" class="form-control" id="telefono" name="telefono">
            </div>
            <button type="submit" class="btn btn-primary">Insertar</button>
        </form>
        
        <p class="mt-3"><a class="btn btn-secondary" href="proveedor.jsp">Volver a la lista de proveedores</a></p>
    </div>
</body>
</html>
