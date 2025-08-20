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
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 100vh; margin-top: 0;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <form action="Controlador?menu=Proveedor" method="POST" onsubmit="return validarForm()">
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Nombres: </strong></label>
                                    <input type="text" id="txtNombresProveedor" value="${proveedor.nombresProveedor}"  name="txtNombresProveedor" class="form-control form-control-lg" required>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Telefono: </strong></label>
                                    <input type="text" id="txtTelefonoProveedor" value="${proveedor.telefonoProveedor}" name="txtTelefonoProveedor" class="form-control form-control-lg" required>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Correo: </strong></label>
                                    <input type="text" value="${proveedor.correoProveedor}" name="txtCorreoProveedor" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Direccion: </strong></label>
                                    <input type="text" value="${proveedor.direccion}" name="txtDireccion" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Estado: </strong></label>
                                    <input type="text" value="${proveedor.estado}" name="txtEstado" class="form-control form-control-lg">
                                </div>
                                <div class="d-flex gap-3">
                                    <input type="submit" name="accion" value="Agregar" class="btn btn-info btn-lg">
                                    <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-lg">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-0"> 
                            <table class="table table-hover table-lg fs-3 mb-0">
                                <thead class="bg-info text-white">
                                    <tr>
                                        <th style="text-align: center; vertical-align: middle;">CODIGO</th>
                                        <th style="text-align: center; vertical-align: middle;">NOMBRES</th>
                                        <th style="text-align: center; vertical-align: middle;">TELEFONO</th>
                                        <th style="text-align: center; vertical-align: middle;">CORREO</th>
                                        <th style="text-align: center; vertical-align: middle;">DIRECCION</th>
                                        <th style="text-align: center; vertical-align: middle;">ESTADO</th>
                                        <th style="text-align: center; vertical-align: middle;">ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="proveedor" items ="${proveedores}">
                                        <tr>
                                            <td style="text-align: center; vertical-align: middle;">${proveedor.codigoProveedor}</td>
                                            <td style="text-align: center; vertical-align: middle;">${proveedor.nombresProveedor}</td>
                                            <td style="text-align: center; vertical-align: middle;">${proveedor.telefonoProveedor}</td>
                                            <td style="text-align: center; vertical-align: middle;">${proveedor.correoProveedor}</td>
                                            <td style="text-align: center; vertical-align: middle;">${proveedor.direccion}</td>
                                            <td style="text-align: center; vertical-align: middle;">${proveedor.estado}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-2" >
                                                    <a class="btn btn-warning btn-lg mb-2" href="Controlador?menu=Proveedor&accion=Editar&codigoProveedor=${proveedor.codigoProveedor}">Editar</a>   
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
