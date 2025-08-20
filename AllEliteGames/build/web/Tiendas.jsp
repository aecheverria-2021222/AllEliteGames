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
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 105vh; margin-top: 0;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-3">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <form action="ControladorTiendas?menu=Tiendas" method="POST">
                                <div class="form-group mb-2">
                                    <label class="fs-3"><strong>Número de Tienda:</strong></label>
                                    <input type="text" value="${tienda.getNumeroTienda()}" name="txtNumeroTienda" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-3"><strong>Dirección:</strong></label>
                                    <input type="text" value="${tienda.getDireccion()}" name="txtDireccion" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-3"><strong>Teléfono:</strong></label>
                                    <input type="text" value="${tienda.getTelefonoTienda()}"name="txtTelefonoTienda" class="form-control  form-control-lg">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-3"><strong>Correo:</strong></label>
                                    <input type="text" value="${tienda.getCorreoTienda()}" name="txtCorreoTienda" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-3"><strong>Horario Apertura:</strong></label>
                                    <input type="text" value="${tienda.getHorarioApertura()}" name="txtHorarioApertura" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-3"><strong>Horario Cierre:</strong></label>
                                    <input type="text" value="${tienda.getHorarioCierre()}" name="txtHorarioCierre" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-3"><strong>Estado:</strong></label>
                                    <input type="text" value="${tienda.getEstado()}" name="txtEstado" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-3"><strong>Código Empleado:</strong></label>
                                    <input type="text" value="${tienda.getCodigoEmpleado()}" name="txtCodigoEmpleado" class="form-control form-control-lg">
                                </div>
                                <div class="d-flex gap-2">
                                    <input type="submit" name="accion" value="Agregar" class="btn btn-info  btn-lg">
                                    <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-0"> 
                            <table class="table table-hover table-lg fs-4 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                        <th style="text-align: center; vertical-align: middle;">CÓDIGO</th>
                                        <th style="text-align: center; vertical-align: middle;">NÚMERO</th>
                                        <th style="text-align: center; vertical-align: middle;">DIRECCIÓN</th>
                                        <th style="text-align: center; vertical-align: middle;">TELÉFONO</th>
                                        <th style="text-align: center; vertical-align: middle;">CORREO</th>
                                        <th style="text-align: center; vertical-align: middle;">HORARIO APERTURA</th>
                                        <th style="text-align: center; vertical-align: middle;">HORARIO CIERRE</th>
                                        <th style="text-align: center; vertical-align: middle;">ESTADO</th>
                                        <th style="text-align: center; vertical-align: middle;">CÓDIGO EMPLEADO</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="tienda" items="${tiendas}">
                                        <tr>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.codigoTienda}</td>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.numeroTienda}</td>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.direccion}</td>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.telefonoTienda}</td>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.correoTienda}</td>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.horarioApertura}</td>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.horarioCierre}</td>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.estado}</td>
                                            <td style="text-align: center; vertical-align: middle;">${tienda.codigoEmpleado}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-2">
                                                    <a class="btn btn-warning btn-lg mb-2"href="ControladorTiendas?menu=Tiendas&accion=Editar&codigoTienda=${tienda.codigoTienda}">Editar</a>   
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
