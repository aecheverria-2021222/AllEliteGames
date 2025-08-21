<%-- 
    Document   : Genero
    Created on : 18 ago 2025, 16:47:35
    Author     : gonze
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllEliteGames</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 200vh; margin-top: 0; ">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px; margin-left: 0;."> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card fixed-card shadow-lg">
                        <div class="card-body">
                            <form action="Controlador?menu=genero" method="POST">
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Género:</strong></label>
                                    <input type="text" value="${genero.getGenero()}" name="txtGenero" class="form-control form-control-sm">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Edad Recomendada:</strong></label>
                                    <input type="text" value="${genero.getEdadRecomendable()}" name="txtEdadRecomendable" class="form-control form-control-sm">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Popularidad:</strong></label>
                                    <input type="text" value="${genero.getPopularidad()}" name="txtPopularidad" class="form-control form-control-sm">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Público Objetivo:</strong></label>
                                    <input type="text" value="${genero.getPublicoObjetivo()}" name="txtPublicoObjetivo" class="form-control form-control-sm">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Estado:</strong></label>
                                    <input type="text" value="${genero.getEstado()}" name="txtEstado" class="form-control form-control-sm">
                                </div>
                                <div class="d-flex gap-2">
                                    <input type="submit" name="accion" value="Agregar" class="btn btn-info btn-sm">
                                    <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-sm">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Columna derecha: tabla -->
                <div class="col-md-8">
                    <div class="card fix-card shadow-lg h-100">
                        <div class="card-body p-0"> 
                            <table class="table table-hover table-sm fs-6 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                        <th>CÓDIGO</th>
                                        <th>GÉNERO</th>
                                        <th>EDAD RECOMENDABLE</th>
                                        <th>POPULARIDAD</th>
                                        <th>PÚBLICO OBJETIVO</th>
                                        <th>ESTADO</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="genero" items="${generos}">
                                        <tr>
                                            <td>${genero.getCodigoGenero()}</td>
                                            <td>${genero.getGenero()}</td>
                                            <td>${genero.getEdadRecomendable()}</td>
                                            <td>${genero.getPopularidad()}</td>
                                            <td>${genero.getPublicoObjetivo()}</td>
                                            <td>${genero.getEstado()}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-1">
                                                    <a class="btn btn-warning btn-sm" href="Controlador?menu=genero&accion=Editar&codigoGenero=${genero.codigoGenero}">Editar</a>   
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
