<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllEliteGames</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
        <style>
            input, select {
                border-radius: 5px;
                padding: 4px 6px;
                box-sizing: border-box;
            }
            input:hover, select:hover {
                border-color: #023059;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-center"; style="margin-top: 75px;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <div class="col-md-3">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <c:if test="${not empty vacio}">
                                <div class="alert alert-danger" role="alert">${vacio}</div>
                            </c:if>
                            <form action="Controlador?menu=Videojuego" method="POST">
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Videojuego:</strong></label>
                                    <input type="text" value="${videojuegoSeleccionado.nombreVideojuego}" name="txtNombreVideojuego" class="form-control form-control-lg" required>
                                </div>
                                <div class="form-group">
                                    <label class="fs-5"><strong>Precio:</strong></label>
                                    <input type="text" value="${videojuegoSeleccionado.precioVideojuego}" name="txtPrecioVideojuego" class="form-control form-control-lg" required>
                                </div>
                                <div class="form-group">
                                    <label class="fs-5"><strong>Stock:</strong></label>
                                    <input type="text" value="${videojuegoSeleccionado.stockVideojuego}" name="txtStockVideojuego" class="form-control form-control-lg" required>
                                </div>
                                <div class="form-group">
                                    <label class="fs-5"><strong>Desarrollador:</strong></label>
                                    <input type="text" value="${videojuegoSeleccionado.desarrollador}" name="txtDesarrollador" class="form-control form-control-lg" required>
                                </div>
                                <div class="form-group">
                                    <label><strong>Estado:</strong></label>
                                    <select name="txtEstado" class="form-control form-control-lg" required>
                                        <option value="Activo" <c:if test="${videojuegoSeleccionado.estado eq 'Activo'}">selected</c:if>>Activo</option>
                                        <option value="Inactivo" <c:if test="${videojuegoSeleccionado.estado eq 'Inactivo'}">selected</c:if>>Inactivo</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="fs-5"><strong>Código Género:</strong></label>
                                        <input type="text" value="${videojuegoSeleccionado.codigoGenero}" name="txtCodigoGenero" class="form-control form-control-lg" required>
                                </div>
                                <div class="form-group">
                                    <label class="fs-5"><strong>Código Proveedor:</strong></label>
                                    <input type="text" value="${videojuegoSeleccionado.codigoProveedor}" name="txtCodigoProveedor" class="form-control form-control-lg" required>
                                </div>
                                <input type="submit" name="accion" value="Agregar" class="btn btn-info btn-ls">
                                <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-ls">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover table-lg fs-5 mb-0">
                                    <thead class="bg-info text-white">
                                        <tr>
                                            <th>CÓDIGO</th>
                                            <th>VIDEOJUEGO</th>
                                            <th>PRECIO</th>
                                            <th>STOCK</th>
                                            <th>DESARROLLADOR</th>
                                            <th>ESTADO</th>
                                            <th>CÓDIGO GÉNERO</th>
                                            <th>CÓDIGO PROVEEDOR</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="videojuego" items="${videojuegos}">
                                            <tr>
                                                <td>${videojuego.codigoVideojuego}</td>
                                                <td>${videojuego.nombreVideojuego}</td>
                                                <td>${videojuego.precioVideojuego}</td>
                                                <td>${videojuego.stockVideojuego}</td>
                                                <td>${videojuego.desarrollador}</td>
                                                <td>${videojuego.estado}</td>
                                                <td>${videojuego.codigoGenero}</td>
                                                <td>${videojuego.codigoProveedor}</td>
                                                <td>
                                                    <div>
                                                        <a class="d-flex flex-column align-items-center gap-2" href="Controlador?menu=Videojuego&accion=Editar&codigoVideojuego=${videojuego.codigoVideojuego}">Editar</a>
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


                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
                </body>
                </html>
