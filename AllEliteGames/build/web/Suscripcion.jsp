
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllEliteGames</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/general.css' />">

    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 100vh; margin-top: 0;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <!-- Alert de validación -->
                            <c:if test="${not empty vacio}">
                                <div class="alert alert-danger" role="alert">${vacio}</div>
                            </c:if>

                            <form action="Controlador?menu=Suscripcion" method="POST">
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong> Fecha Suscripción: </strong></label>
                                    <input type="date" value="${suscripcion.getFechaSuscripcion()}" name="dtFechaSuscripcion" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong> Fecha Fin: </strong></label>
                                    <input type="date" value="${suscripcion.getFechaFin()}" name="dtFechaFin" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong> Tipo de Suscripción: </strong></label>
                                    <input type="text" value="${suscripcion.getTipoSuscripcion()}" name="txtTipoSuscripcion" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong> Estado: </strong></label>
                                    <select name="cmbEstado" class="form-control form-control-lg">
                                        <option value="Activo">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </select>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong> Código Cliente: </strong></label>
                                    <input type="text" value="${suscripcion.getCodigoCliente()}" name="txtCodigoCliente" class="form-control form-control-lg" >
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong> Código Videojuego: </strong></label>
                                    <input type="text" value="${suscripcion.getCodigoVideojuego()}" name="txtCodigoVideojuego" class="form-control form-control-lg" >
                                </div>
                                <div class="d-flex gap-3">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-info btn-lg">
                                <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-lg">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Tabla de suscripciones -->
                <div class="col-md-8">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-0"> 
                            <table class="table table-hover table-lg fs-5 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                        <th>CODIGO</th>
                                        <th>FECHA SUSCRIPCION</th>
                                        <th style="width: 350px;">FECHA FIN</th>
                                        <th>TIPO SUSCRIPCION</th>
                                        <th>ESTADO</th>
                                        <th>CODIGO CLIENTE</th>
                                        <th>CODIGO VIDEOJUEGO</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="suscripcion" items="${suscripciones}">
                                        <tr>
                                            <td>${suscripcion.getCodigoSuscripcion()}</td>
                                            <td>${suscripcion.getFechaSuscripcion()}</td>
                                            <td>${suscripcion.getFechaFin()}</td>
                                            <td>${suscripcion.getTipoSuscripcion()}</td>
                                            <td>${suscripcion.getEstado()}</td>
                                            <td>${suscripcion.getCodigoCliente()}</td>
                                            <td>${suscripcion.getCodigoVideojuego()}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-2">
                                                    <a class="btn btn-warning btn-lg mb-2"href="Controlador?menu=Suscripcion&accion=Editar&codigoSuscripcion=${suscripcion.getCodigoSuscripcion()}">Editar</a> 
                                                    <a class="btn btn-danger btn-lg mb-2" href="Controlador?menu=Suscripcion&accion=Eliminar&codigoSuscripcion=${suscripcion.getCodigoSuscripcion()}" onclick="return confirm('¿Está seguro de eliminar esta suscripción?');">Eliminar</a>
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