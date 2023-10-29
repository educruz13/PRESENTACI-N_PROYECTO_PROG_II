<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Proveedores</title>
    

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Proveedores</h1>
        
        <%@ page import="java.sql.*" %>
        <%@ page import="modelo.Conexion" %>
        <%
            Conexion con = new Conexion();
            con.abrir_conexion();
            
    
            String consulta = "SELECT * FROM proveedores";
            ResultSet rs = con.conexionBD.createStatement().executeQuery(consulta);
        %>
        
        <!-- Mostrar los proveedores en una tabla con estilo Bootstrap -->
        <table class="table mt-3">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Proveedor</th>
                    <th>NIT</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("idproveedores") %></td>
                    <td><%= rs.getString("proveedor") %></td>
                    <td><%= rs.getString("nit") %></td>
                    <td><%= rs.getString("direccion") %></td>
                    <td><%= rs.getString("telefono") %></td>
                    <td>
                        <a class="btn btn-primary" href="actualizar.jsp?id=<%= rs.getInt("idproveedores") %>">Actualizar</a>
                        <a class="btn btn-danger" href="eliminar.jsp?id=<%= rs.getInt("idproveedores") %>">Eliminar</a>
                    </td>
                </tr>
                <%
                    }
                    con.cerrar_conexion();
                %>
            </tbody>
        </table>
        

        <h2 class="mt-4">Insertar Nuevo Proveedor</h2>
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
            <button type="submit" class="btn btn-success">Insertar</button>
        </form>
    </div>
</body>
</html>
