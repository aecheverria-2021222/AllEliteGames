<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tiendas</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-center" style="margin-top: 75px;">
            <div class="row w-100 align-items-stretch" style="max-width: 1400px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-3">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-3">
                            <form action="ControladorTiendas?menu=Tiendas" method="POST">
                                <div class="form-group mb-2">
                                    <label class="fs-6"><strong>Número de Tienda:</strong></label>
                                    <input type="text" value="${tienda.getNumeroTienda()}" name="txtNumeroTienda" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-2">
                                    <label class="fs-6"><strong>Dirección:</strong></label>
                                    <input type="text" value="${tienda.getDireccion()}" name="txtDireccion" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-2">
                                    <label class="fs-6"><strong>Teléfono:</strong></label>
                                    <input type="text" value="${tienda.getTelefonoTienda()}" name="txtTelefonoTienda" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-2">
                                    <label class="fs-6"><strong>Correo:</strong></label>
                                    <input type="text" value="${tienda.getCorreoTienda()}" name="txtCorreoTienda" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-2">
                                    <label class="fs-6"><strong>Horario Apertura:</strong></label>
                                    <input type="text" value="${tienda.getHorarioApertura()}" name="txtHorarioApertura" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-2">
                                    <label class="fs-6"><strong>Horario Cierre:</strong></label>
                                    <input type="text" value="${tienda.getHorarioCierre()}" name="txtHorarioCierre" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-2">
                                    <label class="fs-6"><strong>Estado:</strong></label>
                                    <input type="text" value="${tienda.getEstado()}" name="txtEstado" class="form-control form-control-ls">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Código Empleado:</strong></label>
                                    <input type="text" value="${tienda.getCodigoEmpleado()}" name="txtCodigoEmpleado" class="form-control form-control-ls">
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
                <div class="col-md-9">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-2"> 
                            <div class="table-responsive">
                                <table class="table table-hover table-sm fs-6 mb-0">
                                    <thead class="bg-info text-white">
                                        <tr>
                                            <th>CÓDIGO</th>
                                            <th>NÚMERO</th>
                                            <th>DIRECCIÓN</th>
                                            <th>TELÉFONO</th>
                                            <th>CORREO</th>
                                            <th>HORARIO APERTURA</th>
                                            <th>HORARIO CIERRE</th>
                                            <th>ESTADO</th>
                                            <th>CÓDIGO EMPLEADO</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="tienda" items="${tiendas}">
                                            <tr>
                                                <td>${tienda.codigoTienda}</td>
                                                <td>${tienda.numeroTienda}</td>
                                                <td>${tienda.direccion}</td>
                                                <td>${tienda.telefonoTienda}</td>
                                                <td>${tienda.correoTienda}</td>
                                                <td>${tienda.horarioApertura}</td>
                                                <td>${tienda.horarioCierre}</td>
                                                <td>${tienda.estado}</td>
                                                <td>${tienda.codigoEmpleado}</td>
                                                <td>
                                                    <div class="d-flex flex-column align-items-center gap-1">
                                                        <a class="btn btn-warning btn-sm" 
                                                           href="ControladorTiendas?menu=Tiendas&accion=Editar&codigoTienda=${tienda.codigoTienda}">
                                                            Editar
                                                        </a>   
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
