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

                            <form action="Controlador?menu=Devoluciones" method="POST" name="addForm">
                                <div id="alerta"></div>

                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Fecha Solicitud:</strong></label>
                                    <input type="date" value="${devolucion.getFechaSolicitud()}" name="dtFechaSolicitud" id="dtFechaSolicitud" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Fecha Devolución:</strong></label>
                                    <input type="date" value="${devolucion.getFechaDevolucion()}" name="dtFechaDevolucion" id="dtFechaDevolucion" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Motivo de Devolución:</strong></label>
                                    <input type="text" value="${devolucion.getMotivo()}" name="txtMotivo" id="txtMotivo" class="form-control form-control-lg">
                                    <div id="errorMotivo" style="color:red; font-size:14px;"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Estado:</strong></label>
                                    <input type="text" value="${devolucion.getEstado()}" name="txtEstado" id="txtEstado" class="form-control form-control-lg">
                                    <div id="errorEstado" style="color:red; font-size:14px;"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Código Venta:</strong></label>
                                    <input type="text" value="${devolucion.getCodigoVenta()}" name="txtCodigoVenta" id="txtCodigoVenta" class="form-control form-control-lg">
                                </div>
                                <div class="d-flex gap-3">
                                    <input type="submit" name="accion" value="Agregar" onclick="return validarFormu();" class="btn btn-info btn-lg">
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
                                                    <a class="btn btn-warning btn-lg mb-2" href="Controlador?menu=Devoluciones&accion=Editar&codigoDevolucion=${devolucion.getCodigoDevolucion()}">Editar</a>
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
        <script>
            var form = document.querySelector("form");
            var motivo = document.querySelector("input[name='txtMotivo']");
            var estado = document.querySelector("input[name='txtEstado']");
            var errorMotivo = document.getElementById("errorMotivo");
            var errorEstado = document.getElementById("errorEstado");
            form.addEventListener("submit", function (e) {
                if (motivo.value.length > 15) {
                    e.preventDefault();
                    errorMotivo.innerText = "El motivo debe ser de 15 caracteres o menos";
                } else {
                    errorMotivo.innerText = "";
                }
                if (estado.value.length > 15) {
                    e.preventDefault();
                    errorEstado.innerText = "El estado debe ser de 15 caracteres o menos";
                } else {
                    errorEstado.innerText = "";
                }
           });
        </script>
        <script>
            function validarFormu() {
                var formu = document.addForm;
                var fechaSolicitud = formu.dtFechaSolicitud.value;
                var fechaDevolucion = formu.dtFechaDevolucion.value;
                var motivo = formu.txtMotivo.value;
                var estado = formu.txtEstado.value;
                var codigoVenta = formu.txtCodigoVenta.value;
                var alertaDiv = document.getElementById("alerta");

                alertaDiv.innerHTML = "";

                if (fechaSolicitud === "") {
                    alertaDiv.innerHTML = '<div class="alert alert-danger" role="alert">La fecha de solicitud no puede estar vacía.</div>';
                    return false;
                }

                if (fechaDevolucion === "") {
                    alertaDiv.innerHTML = '<div class="alert alert-danger" role="alert">La fecha de devolución no puede estar vacía.</div>';
                    return false;
                }

                if (motivo === "") {
                    alertaDiv.innerHTML = '<div class="alert alert-danger" role="alert">El motivo de devolución no puede estar vacío.</div>';
                    return false;
                }

                if (estado === "") {
                    alertaDiv.innerHTML = '<div class="alert alert-danger" role="alert">El estado no puede estar vacío.</div>';
                    return false;
                }
                
                if (codigoVenta === "") {
                    alertaDiv.innerHTML = '<div class="alert alert-danger" role="alert">El código de venta no puede estar vacío.</div>';
                return false;
                }
                
                if (!validarInt(codigoVenta, alertaDiv)){
                    return false;
                }
                
                return true;
            }
        </script>
        <script>
            function validarInt(parametro, alertaDiv) {
                if (!/^([0-9])*$/.test(parametro)) {
                    alertaDiv.innerHTML = '<div class="alert alert-danger" role="alert">El codigo de venta debe contener solo números.</div>';
                    return false;
                }else{
                    return true;
                }
            }
        </script>
    </body>
</html>