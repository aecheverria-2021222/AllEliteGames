<%-- 
    Document   : Devolucion
    Created on : 19 ago 2025, 07:57:37
    Author     : informatica
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllEliteGames - Devoluciones</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
        <style>
            input[type="date"]:hover, select:hover {
                border-color: #023059;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 100vh; margin-top: 0;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <c:if test="${not empty vacio}">
                                <div class="alert alert-danger" role="alert">${vacio}</div>
                            </c:if>
                            
                            <form action="Controlador?menu=Devolucion" method="POST">
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Fecha Solicitud:</strong></label>
                                    <input type="date" value="${devolucion.getFechaSolicitud()}" name="dtFechaSolicitud" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Fecha Devolución:</strong></label>
                                    <input type="date" value="${devolucion.getFechaDevolucion()}" name="dtFechaDevolucion" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Motivo de Devolución:</strong></label>
                                    <input type="text" value="${devolucion.getMotivo()}" name="txtMotivo" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Estado:</strong></label>
                                    <input type="text" value="${devolucion.getEstado()}" name="txtEstado" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Código Venta:</strong></label>
                                    <input type="text" value="${devolucion.getCodigoVenta()}" name="txtCodigoVenta" class="form-control form-control-lg">
                                </div>
                                <div class="d-flex gap-3">
                                    <input type="submit" name="accion" value="Agregar" class="btn btn-info btn-lg">
                                    <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-lg">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Columna derecha: tabla -->
                <div class="col-md-8">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-0"> 
                            <table class="table table-hover table-lg fs-5 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                        <th>CÓDIGO</th>
                                        <th>FECHA SOLICITUD</th>
                                        <th>FECHA DEVOLUCIÓN</th>
                                        <th>MOTIVO</th>
                                        <th>ESTADO</th>
                                        <th>CÓDIGO VENTA</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="devolucion" items="${devoluciones}">
                                        <tr>
                                            <td>${devolucion.getCodigoDevolucion()}</td>
                                            <td>${devolucion.getFechaSolicitud()}</td>
                                            <td>${devolucion.getFechaDevolucion()}</td>
                                            <td>${devolucion.getMotivo()}</td>
                                            <td>${devolucion.getEstado()}</td>
                                            <td>${devolucion.getCodigoVenta()}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-2">
                                                    <a class="btn btn-warning btn-lg mb-2" href="Controlador?menu=Devolucion&accion=Editar&codigoDevolucion=${devolucion.getCodigoDevolucion()}">Editar</a>
                                                    <a class="btn btn-danger btn-lg" href="Controlador?menu=Devolucion&accion=Eliminar&codigoDevolucion=${devolucion.getCodigoDevolucion()}">Eliminar</a>
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