<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tiendas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
</head>
<body>

<div class="container-fluid d-flex justify-content-center align-items-center" style="margin-top: 75px;">
    <div class="row w-100 align-items-stretch" style="max-width: 1400px;">

        <!-- Columna izquierda: formulario -->
        <div class="col-md-3">
            <div class="card shadow-lg h-100">
                <div class="card-body p-3">

                    <!-- Mensajes -->
                    <c:if test="${not empty vacio}">
                        <div class="alert alert-danger" role="alert">${vacio}</div>
                    </c:if>
                    <c:if test="${not empty lleno}">
                        <div class="alert alert-danger" role="alert">${lleno}</div>
                    </c:if>

                    <!-- FORMULARIO (validaciones añadidas) -->
                    <form action="Controlador?menu=Tiendas" method="POST">

                        <!-- Código visible (solo mostrar) -->
                        <div class="form-group mb-2">
                            <label class="fs-6"><strong>Código de Tienda:</strong></label>
                            <input type="text" value="${tienda.codigoTienda}" class="form-control" disabled>
                        </div>
                        <!-- Código oculto (se envía) -->
                        <input type="hidden" name="txtCodigoTienda" value="${tienda.codigoTienda}">

                        <div class="form-group mb-2">
                            <label class="fs-6"><strong>Número de Tienda:</strong></label>
                            <input type="number" value="${tienda.numeroTienda}" name="txtNumeroTienda" class="form-control form-control-ls" pattern="\d+" title="Solo se permiten números" required>
                        </div>

                        <div class="form-group mb-2">
                            <label class="fs-6"><strong>Dirección:</strong></label>
                            <input type="text" value="${tienda.direccion}" name="txtDireccion" class="form-control form-control-ls" required>
                        </div>

                        <div class="form-group mb-2">
                            <label class="fs-6"><strong>Teléfono:</strong></label>
                            <input type="text" value="${tienda.telefonoTienda}" name="txtTelefonoTienda" class="form-control form-control-ls" pattern="\d{8}" title="Debe tener 8 dígitos" required>
                        </div>

                        <div class="form-group mb-2">
                            <label class="fs-6"><strong>Correo:</strong></label>
                            <input type="email" value="${tienda.correoTienda}" name="txtCorreoTienda" class="form-control form-control-ls" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" title="Ingresa un correo electrónico válido. Ejemplo: usuario@dominio.com" required>
                        </div>

                        <div class="form-group mb-2">
                            <label class="fs-6"><strong>Horario Apertura:</strong></label>
                            <input type="text" value="${tienda.horarioApertura}" name="txtHorarioApertura" class="form-control form-control-ls" pattern="^(?:[01]\d|2[0-3]):[0-5]\dhrs$" title="Ingresa un horario válido en formato HH:MMhrs. Ejemplo: 08:30hrs o 23:15hrs" required>
                        </div>

                        <div class="form-group mb-2">
                            <label class="fs-6"><strong>Horario Cierre:</strong></label>
                            <input type="text" value="${tienda.horarioCierre}" name="txtHorarioCierre" class="form-control form-control-ls" pattern="^(?:[01]\d|2[0-3]):[0-5]\dhrs$" title="Ingresa un horario válido en formato HH:MMhrs. Ejemplo: 08:30hrs o 23:15hrs"required>
                        </div>

                        <div class="form-group mb-2">
                            <label class="fs-6"><strong>Estado:</strong></label>
                            <select name="cmbEstado" class="form-control form-control-ls">
                                        <option value="Activo">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </select>
                        </div>

                        <div class="form-group mb-3">
                            <label class="fs-6"><strong>Código Empleado:</strong></label>
                            <select name="txtCodigoEmpleado" class="form-control form-control-ls"
                                    <c:if test="${tienda != null && tienda.codigoEmpleado != 0}">disabled</c:if>>
                                <option value="" disabled <c:if test="${tiendas == null}">selected</c:if>>
                                        -- Seleccione un empleado --
                                    </option>
                                <c:forEach var="e" items="${empleados}">
                                    <option value="${e.codigoEmpleado}"
                                            <c:if test="${tienda != null && tienda.codigoEmpleado == e.codigoEmpleado}">selected</c:if>>
                                        ${e.codigoEmpleado} - ${e.nombresEmpleado}
                                    </option>
                                </c:forEach>
                            </select>
                            
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
                                               href="Controlador?menu=Tiendas&accion=Editar&codigoTienda=${tienda.codigoTienda}">
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

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html>
