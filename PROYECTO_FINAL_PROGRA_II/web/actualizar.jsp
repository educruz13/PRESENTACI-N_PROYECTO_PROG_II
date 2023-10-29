<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Proveedor</title>
    
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Actualizar Proveedor</h1>
        
        <%@ page import="java.sql.*" %>
        <%@ page import="modelo.Conexion" %>
        <%
            
            int idProveedor = Integer.parseInt(request.getParameter("id"));
            
            if (request.getMethod().equals("POST")) {
           
                String proveedor = request.getParameter("proveedor");
                String nit = request.getParameter("nit");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
                
            
                if (proveedor != null && nit != null && direccion != null && telefono != null) {
                    Conexion con = new Conexion();
                    con.abrir_conexion();
                    
                    try {
                   
                        String consulta = "UPDATE proveedores SET proveedor = ?, nit = ?, direccion = ?, telefono = ? WHERE idproveedores = ?";
                        PreparedStatement pstmt = con.conexionBD.prepareStatement(consulta);
                        pstmt.setString(1, proveedor);
                        pstmt.setString(2, nit);
                        pstmt.setString(3, direccion);
                        pstmt.setString(4, telefono);
                        pstmt.setInt(5, idProveedor);
                        pstmt.executeUpdate();
                    
        %>
                        <div class="alert alert-success mt-3" role="alert">
                            Proveedor actualizado correctamente.
                        </div>
        <%
                    } catch (SQLException e) {
        %>
                        <div class="alert alert-danger mt-3" role="alert">
                            Error al actualizar proveedor: <%= e.getMessage() %>
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
            } else {
              
                Conexion con = new Conexion();
                con.abrir_conexion();
                String consulta = "SELECT * FROM proveedores WHERE idproveedores = ?";
                PreparedStatement pstmt = con.conexionBD.prepareStatement(consulta);
                pstmt.setInt(1, idProveedor);
                ResultSet rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    String proveedorActual = rs.getString("proveedor");
                    String nitActual = rs.getString("nit");
                    String direccionActual = rs.getString("direccion");
                    String telefonoActual = rs.getString("telefono");
        %>
                   
                    <form action="actualizar.jsp?id=<%= idProveedor %>" method="post">
                        <div class="form-group">
                            <label for="proveedor">Proveedor:</label>
                            <input type="text" class="form-control" id="proveedor" name="proveedor" value="<%= proveedorActual %>">
                        </div>
                        <div class="form-group">
                            <label for="nit">NIT:</label>
                            <input type="text" class="form-control" id="nit" name="nit" value="<%= nitActual %>">
                        </div>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" value="<%= direccionActual %>">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<%= telefonoActual %>">
                        </div>
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </form>
        <%
                } else {
        %>
                    <div class="alert alert-warning mt-3" role="alert">
                        Proveedor no encontrado.
                    </div>
        <%
                }
                con.cerrar_conexion();
            }
        %>
        
        <p class="mt-3"><a class="btn btn-secondary" href="proveedor.jsp">Volver a la lista de proveedores</a></p>
    </div>
</body>
</html>
