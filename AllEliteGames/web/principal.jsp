<%-- 
    Document   : Principal
    Created on : 15 jul 2025, 07:46:42
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllEliteGames</title>
        <link rel="shortcut icon" href="img/AllEliteGames.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/inicio.css' />">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-info fixed-top">
            <div class="collapse navbar-collapse" id="navbarNav">         
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a style="margin-left: 10px;  border: none" class="btn btn-outline-light" href="#">Inicio</a>
                    </li>

                    <!-- CLIENTES -->
                    <li class="nav-item dropdown">
                        <a style="margin-left: 10px;  border: none" class="btn btn-outline-light dropdown-toggle" href="#" type="button" data-toggle="dropdown" aria-expanded="true">Clientes</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Clientes</a></li>
                            <li><a class="dropdown-item" href="#">Suscripciones</a></li>
                            <li><a class="dropdown-item" href="#">Membresias</a></li>
                        </ul>
                    </li>

                    <!-- EMPLEADOS -->
                    <li class="nav-item dropdown">
                        <a style="margin-left: 10px;  border: none" class="btn btn-outline-light dropdown-toggle" href="#" type="button" data-toggle="dropdown" aria-expanded="true">Empleados</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Empleados</a></li>
                            <li><a class="dropdown-item" href="#">Tiendas</a></li>
                        </ul>
                    </li>

                    <!-- GENEROS -->
                    <li class="nav-item dropdown">
                        <a style="margin-left: 10px;  border: none" class="btn btn-outline-light dropdown-toggle" href="#" type="button" data-toggle="dropdown" aria-expanded="true">Generos</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="Controlador?menu=Genero&accion=Listar" target="myFrame">Generos</a></li>
                            <li><a class="dropdown-item" href="#">Videojuegos</a></li>
                        </ul>
                    </li>

                    <!-- PROVEEDORES -->
                    <li class="nav-item dropdown">
                        <a style="margin-left: 10px;  border: none" class="btn btn-outline-light dropdown-toggle" href="#" type="button" data-toggle="dropdown" aria-expanded="true">Proveedores</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Proveedores</a></li>
                            <li><a class="dropdown-item" href="#">Videojuegos</a></li>
                            <li><a class="dropdown-item" href="#">Consolas</a></li>
                            <li><a class="dropdown-item" href="#">Suscripciones</a></li>
                        </ul>
                    </li>

                    <!-- VENTAS -->
                    <li class="nav-item dropdown">
                        <a style="margin-left: 10px;  border: none" class="btn btn-outline-light dropdown-toggle" href="#" type="button" data-toggle="dropdown" aria-expanded="true">Ventas</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Ventas</a></li>
                            <li><a class="dropdown-item" href="#">Metodos de Pago</a></li>
                            <li><a class="dropdown-item" href="#">Devoluciones</a></li>
                        </ul>
                    </li> 
                </ul>
            </div>
            <div class="d-flex align-items-center">
                <a class="nav-link text-white position-relative" href="#">
                    <i class="fas fa-shopping-cart fa-lg"></i> 
                </a>
            </div>

            <div class="dropdown">
                <button style="border: none" class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButtomn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${usuario.getNombresEmpleado()}
                </button>
                <div class="dropdown-menu dropdown-menu-right text-center" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">
                        <img src="img/ImagenUsuarios.png" alt="60" width="60">
                    </a>
                    <a class="dropdown-item">${usuario.getUsuario()}</a>
                    <a class="dropdown-item">${usuario.getCorreoEmpleado()}</a>
                    <div class="dropdown-divider"></div>
                    <form action="Validar" method="POST">
                        <button name="accion" name="Salir" class="dropdown-item">Salir </button>
                    </form>
                </div>  
            </div>
        </nav>
       <div class="m-4" style="margin-top: 80px; height: 900px;">
    <iframe name="myFrame" src="inicio.jsp" style="height: 100%; width: 100%; border: none;"></iframe>
</div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
