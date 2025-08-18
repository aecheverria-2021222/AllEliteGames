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
                            <li><a class="dropdown-item" href="Controlador?menu=Genero" target="myFrame">Generos</a></li>
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
        <main>
            <section class="conteiner titulo">
                <h1 class="titulo mt-5" >AlleliteGames</h1>
                <div class="conteiner principal" style="text-align: center">
                    <img src="img/AllEliteGames.png" alt="70" width="300" style="margin-right:  350px;" />


                    <div class="principal-conteiner" >
                        <h3>Misión</h3>
                        <p>La misión de AllEliteGames es ofrecer diversión y
                            entretenimiento de manera accesible y cómoda,
                            llevando la experiencia del consumidor a un nuevo 
                            nivel mediante un servicio excepcional y un
                            compromiso constante con la calidad en cada entrega.
                        </p>
                        <h3>Visión</h3>
                        <p>La misión de AllEliteGames es transformar el acceso 
                            al entretenimiento digital ofreciendo videojuegos, 
                            consolas y servicios personalizados que se adaptan a
                            las necesidades de cada cliente. Nos comprometemos a 
                            brindar una experiencia única mediante atención de 
                            calidad, innovación constante y un firme compromiso 
                            con la comodidad del consumidor. 
                        </p>
                    </div>
                    <div class="secundary-conteiner">
                        <h4>Historia</h4>
                        <p>Éramos un pequeño grupo de amigos apasionados por 
                            las consolas y los videojuegos. Nos encantaba jugar 
                            en línea por las tardes y organizar pequeños torneos;
                            en esas tardes, el tiempo simplemente volaba. 

                            Un día intentamos comprar una nueva consola, pero 
                            nos dimos cuenta de que en Guatemala era difícil 
                            acceder a una buena tienda: o estaban agotadas o 
                            sus precios eran demasiado elevados, lo mismo ocurría
                            con los videojuegos. 

                            Fue entonces cuando decidimos crear AllEliteGames, 
                            una empresa hecha por gamers y para gamers. Un lugar
                            donde puedas comprar consolas y videojuegos con una
                            experiencia agradable, precios accesibles, 
                            suscripciones flexibles y un catálogo siempre 
                            al nivel. 
                        </p>
                    </div>
                    <div class="third-conteiner">
                        <h4>Descripción</h4>
                        <p>AllEliteGames es una empresa guatemalteca creada por
                            y para gamers, dedicada a la venta, distribución de
                            videojuegos y consolas. Nuestro objetivo es ofrecer 
                            a la comunidad gamer una experiencia completa, 
                            accesible y confiable, combinando precios justos, 
                            un catálogo variado y un servicio al cliente de alto
                            nivel. 

                            Contamos con tiendas físicas y presencia digital, 
                            donde los jugadores pueden descubrir, comprar o 
                            suscribirse a sus títulos favoritos de forma fácil 
                            y cómoda. Además, brindamos membresías con beneficios
                            especiales y soporte personalizado. En AllEliteGames,
                            creemos que jugar no debería tener límites, por eso
                            trabajamos cada día para llevar el mejor entretenimiento
                            a todos los rincones del país. 
                        </p>
                    </div>
                </div>
            </section>    
        </main>
        <div class="m-4" style="height: 100px">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none;  "></iframe>
        </div>
         <footer>
        <div class="contenedor-footer">
            <div class="content-foot">
                <h4>Teléfono</h4>
                <p>2314-5687</p>
            </div>
            <div class="content-foot">
                <h4>Correo Electronico</h4>
                <p>allelitegames@gmail.com</p>
            </div>
            <div class="content-foot">
                <h4>Ubicación</h4>
                <p> Diagonal 6, 11-97 zona 10.Ciudad de Guatemala.</p>
            </div>
        </div>
        <h2><div class="titulo-final">&copy; AlleEliteGames | AllEliteGames</div></h2>
    </footer>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
