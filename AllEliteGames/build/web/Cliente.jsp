<%-- 
    Document   : Cliente
    Created on : 20/08/2025, 02:36:41
    Author     : aleja
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 90vh; margin-top: 0;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <div class="col-md-4">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <c:if test="${not empty vacio}">
                                <div class="alert alert-danger" role="alert">${vacio}</div>
                            </c:if>
                            <c:if test="${not empty lleno}">
                                <div class="alert alert-danger" role="alert">${lleno}</div>
                            </c:if>
                            <form action="Controlador?menu=Cliente" method="POST">
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>DPI:</strong></label>
                                    <input type="text" value="${cliente.getDPICliente()}" name="txtDPICliente" class="form-control  form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Nombres:</strong></label>
                                    <input type="text" value="${cliente.getNombresCliente()}" name="txtNombresCliente" class="form-control  form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Correo:</strong></label>
                                    <input type="text" value="${cliente.getCorreoCliente()}" name="txtCorreoCliente" class="form-control  form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Direccion:</strong></label>
                                    <input type="text" value="${cliente.getDireccionCliente()}" name="txtDireccionCliente" class="form-control  form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Estado:</strong></label>
                                    <select name="cmbEstado" class="form-control  form-control-lg">
                                        <option value="Activo">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </select>
                                </div>
                                <div  class="d-flex gap-3">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-info btn-lg">
                                <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-lg">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Tabla -->
                <div class="col-md-8">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-0"> 
                            <table class="table table-hover table-lg fs-5 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                        <th style="text-align: center; vertical-align: middle;">CÓDIGO</th>
                                        <th style="text-align: center; vertical-align: middle;">DPI</th>
                                        <th style="text-align: center; vertical-align: middle;">NOMBRES</th>
                                        <th style="text-align: center; vertical-align: middle;">CORREO</th>
                                        <th style="text-align: center; vertical-align: middle;">DIRECCION</th>
                                        <th style="text-align: center; vertical-align: middle;">ESTADO</th>
                                        <th style="text-align: center; vertical-align: middle;">ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cliente" items="${clientes}">
                                        <tr>
                                            <td style="text-align: center; vertical-align: middle;">${cliente.getCodigoCliente()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${cliente.getDPICliente()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${cliente.getNombresCliente()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${cliente.getCorreoCliente()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${cliente.getDireccionCliente()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${cliente.getEstado()}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-2">
                                                    <a class="btn btn-warning btn-lg mb-2" href="Controlador?menu=Cliente&accion=Editar&codigoCliente=${cliente.getCodigoCliente()}">Editar</a>   
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
