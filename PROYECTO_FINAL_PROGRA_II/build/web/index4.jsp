<%@page import="modelo.Marca" %>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.table.DefaultTableModel" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marcas</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
          crossorigin="anonymous">
</head>
<body>
    <h1>Formulario Marcas</h1>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_marca" onclick="limpiar()">Nuevo</button>

    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="modal_marca" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content -->
                <div class="modal-content">
                    <div class="modal-body">
                        <!-- Ingreso formulario -->
                        <form action="sr_marca" method="post" class="form-group">
                            <label for="lbl_id"><b>ID</b> </label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly><br><br>
                            <label for="lbl_marcas"><b>Marca:</b> </label>
                            <input type="text" name="txt_marcas" id="txt_marcas" class="form-control"
                                   placeholder="Ejemplo: Ingrese su marca" required><br><br>

                            <br>
                            <br>
                            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg">AGREGAR</button>
                            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success btn-lg">MODIFICAR</button>
                            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg"
                                    onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">ELIMINAR</button>
                            
                            <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Marca</th>
                </tr>
            </thead>
            <tbody id="tbl_marca">
        <% 
        Marca marca = new Marca();
        DefaultTableModel tabla = marca.leer();
        for (int t = 0; t < tabla.getRowCount(); t++) { 
        %>
        <tr ondblclick="llena_form(<%= tabla.getValueAt(t, 0) %>, '<%= tabla.getValueAt(t, 1) %>')">
            <td><%= tabla.getValueAt(t, 0) %></td>
            <td><%= tabla.getValueAt(t, 1) %></td>
        </tr>
        <% } // Fin del bucle %>
    </tbody>
            <!-- Contenido de la tabla -->
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
            crossorigin="anonymous"></script>

    <script type="text/javascript">
        function limpiar() {
            $("#txt_id").val(0); 
            $("#txt_marcas").val('');
        }
        
        function llena_form(idmarca, marca){
                     
           $("#txt_id").val(idmarca);
           $("#txt_marcas").val(marca);
           $("#modal_marca").modal('show');
        }
    </script>
</body>
</html>
