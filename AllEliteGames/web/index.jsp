<%-- 
    Document   : index
    Created on : 15 ago 2025, 22:05:02
    Author     : gonze
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllEliteGames</title>
        <link rel="shortcut icon" href="img/AllEliteGames.png" type="image/x-icon">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/style.css' />">
        
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card col-sm-10">
                <div class="card-body">
                    <form class="form-sign" action="Validar" method="POST"><!-- metodo validar y el porst siempre mayuscula -->
                        <div class="form-group text-center">
                            <h1 style="font-family: 'Arial', cursive; font-size:24px">Login</h1>
                            <img src="img/AllEliteGames.png" alt="70" width="120"/><br>
                            <label style="font-size: 20px">Bienvenido al sistema</label><div style="height: 20px;"></div>
                        </div>
                        <div class="form-group">
                            <label><Strong>Usuario:</strong></label>
                            <input type="text" name="txtUser" class="form-control" placeholder="Type your text">
                        </div>
                        <div class="form-group">
                            <label><strong>Contraseña:</strong></label>
                            <Input type="password" name="txtPass" class="form-control" placeholder="********">
                        </div>
                        <input type="submit" name="accion" value="Login" class="btn btn-primary btn-block">
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
