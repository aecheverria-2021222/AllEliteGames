<%-- 
    Document   : MetodoPago
    Created on : 22/08/2025, 02:21:28
    Author     : aleja
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
        <div class="container-fluid d-flex justify-content-center align-items-center" style="margin-top: 75px;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card shadow-lg" style="height: 500px">
                        <div class="card-body p-3">
                            <c:if test="${not empty vacio}">
                                <div class="alert alert-danger" role="alert">${vacio}</div>
                            </c:if>
                            <c:if test="${not empty lleno}">
                                <div class="alert alert-danger" role="alert">${lleno}</div>
                            </c:if>
                            <form action="Controlador?menu=genero" method="POST">
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Nombre Metodo:</strong></label>
                                    <input type="text" value="${metodoPago.getNombreMetodo()}" name="txtNombreMetodo" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Descripcion Metodo:</strong></label>
                                    <input type="text" value="${metodoPago.getDescripcionMetodo()}" name="txtDescripcionMetodo" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Comision:</strong></label>
                                    <input type="text" value="${metodoPago.getComision()}" name="txtComision" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Estado:</strong></label>
                                    <input type="text" value="${metodoPago.getEstado()}" name="txtEstado" class="form-control form-control-ls">
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
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-2"> 
                            <table class="table table-hover table-sm fs-6 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                        <th>CÓDIGO</th>
                                        <th>NOMBRE</th>
                                        <th>DESCRIPCION</th>
                                        <th>COMISION</th>
                                        <th>ESTADO</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="metodoPago" items="${metodosPago}">
                                        <tr>
                                            <td>${metodoPago.getCodigoMetodoPago()}</td>
                                            <td>${metodoPago.getNombreMetodo()}</td>
                                            <td>${metodoPago.getDescripcionMetodo()}</td>
                                            <td>${metodoPago.getComision()}</td>
                                            <td>${metodoPago.getEstado()}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-1">
                                                    <a class="btn btn-warning btn-sm" href="Controlador?menu=MetodoPago&accion=Editar&codigoMetodoPago=${metodoPago.getCodigoMetodoPago()}">Editar</a>   
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
