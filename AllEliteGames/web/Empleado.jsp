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
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 70vh; margin-top: 0;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <form action="Controlador?menu=Empleado" method="POST">
                                <div class="form-group mb-3">
                                    <label><strong>DPI:</strong></label>
                                    <input type="text" value="${empleado.getDPIEmpleado()}" name="txtDPIEmpleado" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label><strong>Nombres:</strong></label>
                                    <input type="text" value="${empleado.getNombresEmpleado()}" name="txtNombresEmpleado" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label><strong>Teléfono:</strong></label>
                                    <input type="text" value="${empleado.getTelefonoEmpleado()}" name="txtTelefonoEmpleado" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label><strong>Correo</strong></label>
                                    <input type="text" value="${empleado.getCorreoEmpleado()}" name="txtCorreoEmpleado" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label><strong>Estado:</strong></label>
                                    <select name="txtEstado" class="form-control  form-control-lg">
                                        <option value="Activo">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label><strong>Usuario:</strong></label>
                                    <input type="text" value="${empleado.getUsuario()}" name="txtUsuario" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label><strong>Contraseña</strong></label>
                                    <input type="text" value="${empleado.getContrasena()}" name="txtContrasena" class="form-control form-control-ls">
                                </div>
                                <div>
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
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead class="bg-info text-white">
                                        <tr>
                                            <th>CODIGO</th>
                                            <th>DPI</th>
                                            <th>NOMBRES</th>
                                            <th>TELEFONO</th>
                                            <th>CORREO</th>
                                            <th>ESTADO</th>
                                            <th>USUARIO</th>
                                            <th>CONTRASEÑA</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="empleado" items="${empleados}">
                                            <tr>
                                                <td>${empleado.getCodigoEmpleado()}</td>
                                                <td>${empleado.getDPIEmpleado()}</td>
                                                <td>${empleado.getNombresEmpleado()}</td>
                                                <td>${empleado.getTelefonoEmpleado()}</td>
                                                <td>${empleado.getCorreoEmpleado()}</td>
                                                <td>${empleado.getEstado()}</td>
                                                <td>${empleado.getUsuario()}</td>
                                                <td>${empleado.getContrasena()}</td>
                                                <td>
                                                    <div class="d-flex flex-column align-items-center gap-1">
                                                        <a class="btn btn-warning btn-sm mb-1" href="Controlador?menu=Empleado&accion=Editar&codigoEmpleado=${empleado.getCodigoEmpleado()}">Editar</a>   
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
