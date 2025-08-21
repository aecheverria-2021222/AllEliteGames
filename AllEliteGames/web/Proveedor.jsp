<%-- 
    Document   : Principal
    Created on : 9/07/2025, 20:15:02
    Author     : Julian Robles
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllEliteGames - Proveedores</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
        <style>
            input[type="date"]:hover, select:hover {
                border-color: #023059;
            }
        </style>
        <script>
            // Validamos cada campo correspondiente para que no se quede ninguno vacio 
            function validarForm() {
                const nombres = document.getElementById("txtNombresProveedor").value.trim();
                const telefono = document.getElementById("txtTelefonoProveedor").value.trim();
                if (nombres === "" || telefono === "") {
                    alert("Por favor completa los campos obligatorios: Nombres y Teléfono");
                    return false;
                }
                return true;
            }

            // Confirmamos que el usuario si quisiera eliminar un registro de un Proveedor
            function confirmarEliminar() {
                return confirm("¿Estás seguro de que deseas eliminar este proveedor?");
            }
        </script>
    </head>
    <body>
        < <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 75vh; margin-top: 0; ">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px; margin-left: 0;."> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card fixed-card shadow-lg">
                        <div class="card-body">
                            <form action="Controlador?menu=Proveedor" method="POST" onsubmit="return validarForm()">
                                <div class="form-group mb-3">
                                    <label><strong>Nombres: </strong></label>
                                    <input type="text" id="txtNombresProveedor" value="${proveedor.nombresProveedor}" name="txtNombresProveedor" class="form-control form-control-sm" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Telefono: </strong></label>
                                    <input type="text" id="txtTelefonoProveedor" value="${proveedor.telefonoProveedor}" name="txtTelefonoProveedor" class="form-control form-control-sm" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Correo: </strong></label>
                                    <input type="text" value="${proveedor.correoProveedor}" name="txtCorreoProveedor" class="form-control form-control-sm">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Direccion: </strong></label>
                                    <input type="text" value="${proveedor.direccion}" name="txtDireccion" class="form-control form-control-sm">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="fs-6"><strong>Estado: </strong></label>
                                    <input type="text" value="${proveedor.estado}" name="txtEstado" class="form-control form-control-sm">
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
                    <div class="card fixed-card shadow-lg h-100">
                        <div class="card-body p-0"> 
                            <table class="table table-hover table-sm fs-6 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                        <th>CODIGO</th>
                                        <th>NOMBRES</th>
                                        <th>TELEFONO</th>
                                        <th>CORREO</th>
                                        <th>DIRECCION</th>
                                        <th>ESTADO</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="proveedor" items ="${proveedores}">
                                        <tr>
                                            <td>${proveedor.codigoProveedor}</td>
                                            <td>${proveedor.nombresProveedor}</td>
                                            <td>${proveedor.telefonoProveedor}</td>
                                            <td>${proveedor.correoProveedor}</td>
                                            <td>${proveedor.direccion}</td>
                                            <td>${proveedor.estado}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-1">
                                                    <a class="btn btn-warning btn-sm" href="Controlador?menu=Proveedor&accion=Editar&codigoProveedor=${proveedor.codigoProveedor}">Editar</a>
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
