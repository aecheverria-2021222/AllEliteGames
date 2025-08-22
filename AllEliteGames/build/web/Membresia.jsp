<%-- 
    Document   : Membresias
    Created on : 19 agosto 2025, 07:47:12
    Author     : sebastian mendez barillas
--%>

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
        <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 100vh; margin-top: 0;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <!-- Columna izquierda: formulario -->
                <div class="col-md-4">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <form action="Controlador?menu=Membresias" method="POST">
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Membresias:</strong></label>
                                    <input type="text" value="${membresia.numeroMembresia()}" name="txtNumeroMembresia" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Tipo:</strong></label>
                                    <input type="text" value="${membresia.tipoMembresia()}" name="txtTipoMembresia" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Precio:</strong></label>
                                    <input type="text" value="${membresia.precioMembresia()}" name="txtPrecioMembresia" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Beneficios:</strong></label>
                                    <input type="text" value="${membresia.beneficios()}" name="txtBeneficios" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Estado:</strong></label>
                                    <input type="text" value="${membresia.estado()}" name="txtEstado" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Codigo Cliente:</strong></label>
                                    <input type="text" value="${membresia.codigoCliente()}" name="txtCodigoCliente" class="form-control form-control-lg">
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
                                        <th>CODIGO</th>
                                        <th>NUMERO</th>
                                        <th>TIPO</th>
                                        <th>PRECIO</th>
                                        <th>BENEFICIOS</th>
                                        <th>ESTADO</th>
                                        <th>CODIGO CLIENTE</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="membresia" items="${membresia}">
                                        <tr>
                                            <td>${m.codigoMembresia}</td>
                                            <td>${m.numeroMembresia}</td>
                                            <td>${m.tipoMembresia}</td>
                                            <td>${m.precioMembresia}</td>
                                            <td>${m.beneficios}</td>
                                            <td>${m.estado}</td>
                                            <td>${m.codigoCliente}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-2">
                                                    <a class="btn btn-warning btn-lg mb-2" href="Controlador?menu=Membresias&accion=Editar&codigoMembresia=${membresia.codigoMembresia}">Editar</a>   
                                                    <a class="btn btn-warning btn-sm" 
                                                   href="Controlador?menu=Membresias&accion=Editar&codigoMembresia=${m.codigoMembresia}">
                                                    Editar
                                                </a>
                                                <a class="btn btn-danger btn-sm" 
                                                   href="Controlador?menu=Membresias&accion=Eliminar&codigoMembresia=${m.getCodigoMembresia()}" 
                                                   onclick="return confirm('¿Estas seguro de que quieres eliminar esta membresia?');">
                                                    Eliminar
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>