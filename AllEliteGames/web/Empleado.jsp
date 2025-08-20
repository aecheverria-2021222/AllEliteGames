<%-- 
    Document   : Empleado
    Created on : 20/08/2025, 00:04:21
    Author     : Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllEliteGames</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 85vh; margin-top: 0;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <form action="Controlador?menu=Empleado" method="POST">
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>DPI:</strong></label>
                                    <input type="text" value="${empleado.getDPIEmpleado()}" name="txtDPIEmpleado" class="form-control form-control-lg"></input>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Nombres:</strong></label>
                                    <input type="text" value="${empleado.getNombresEmpleado()}" name="txtNombresEmpleado" class="form-control form-control-lg"></input>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Teléfono:</strong></label>
                                    <input type="text" value="${empleado.getTelefonoEmpleado()}" name="txtTelefonoEmpleado" class="form-control form-control-lg"></input>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Estado:</strong></label>
                                    <input type="text" value="${empleado.getEstado()}" name="txtEstado" class="form-control form-control-lg"></input>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Usuario:</strong></label>
                                    <input type="text" value="${empleado.getUsuario()}" name="txtUsuario" class="form-control form-control-lg"></input>
                                </div>
                                <div>
                                <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                                <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                    <div class="col-md-8">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-0"> 
                            <table class="table table-hover table-lg fs-5 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                    <th style="text-align: center; vertical-align: middle;">CODIGO</th>
                                    <th style="text-align: center; vertical-align: middle;">DPI</th>
                                    <th style="text-align: center; vertical-align: middle;">NOMBRES</th>
                                    <th style="text-align: center; vertical-align: middle;">TELEFONO</th>
                                    <th style="text-align: center; vertical-align: middle;">ESTADO</th>
                                    <th style="text-align: center; vertical-align: middle;">USUARIO</th>
                                    <th style="text-align: center; vertical-align: middle;">ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="empleado" items="${empleados}">
                                    <tr>
                                        <td style="text-align: center; vertical-align: middle;">${empleado.getCodigoEmpleado()}</td>
                                        <td style="text-align: center; vertical-align: middle;">${empleado.getDPIEmpleado()}</td>
                                        <td style="text-align: center; vertical-align: middle;">${empleado.getNombresEmpleado()}</td>
                                        <td style="text-align: center; vertical-align: middle;">${empleado.getTelefonoEmpleado()}</td>
                                        <td style="text-align: center; vertical-align: middle;">${empleado.getEstado()}</td>
                                        <td style="text-align: center; vertical-align: middle;">${empleado.getUsuario()}</td>
                                        <td>
                                            <div class="d-flex flex-column align-items-center gap-2">
                                                <a class="btn btn-warning btn-lg mb-2"href="Controlador?menu=Empleado&accion=Editar&codigoEmpleado=${empleado.getCodigoEmpleado()}">Editar</a>   
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
