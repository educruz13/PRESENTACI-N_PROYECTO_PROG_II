<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>PROGRAMACIÓN II</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
    <center>
        <div class="container" style="margin-top: 80px;">
            <form method="post" action="/PROYECTO_FINAL_PROGRA_II/sr_usuario">
                <div class="card" style="width: 30rem;">
                <div class="card-body">
                    <h2>Iniciar Sesion</h2>
                    <input type="text" name="txtusuario" class="form-control mt-2" placeholder="Ingrese Usuario" required>
                    <input type="password" name="txtclave" class="form-control mt-2" placeholder="Ingrese Clave" required>
                    <input type="submit" class="btn btn-primary btn-block mt-2" name="btn-login" value="Ingresar">
                </div>
            </div>
            </form>
        </div>
    </center>
    </body>
</html>
