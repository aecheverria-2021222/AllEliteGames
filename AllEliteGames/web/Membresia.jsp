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
                            <form action="Controlador?menu=Membresia" method="POST">
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Numero Membresia:</strong></label>
                                    <input type="text" value="${membresia.getNumeroMembresia()}" name="txtNumeroMembresia" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Tipo:</strong></label>
                                    <input type="text" value="${membresia.getTipoMembresia()}" name="txtTipoMembresia" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Precio:</strong></label>
                                    <input type="text" value="${membresia.getPrecioMembresia()}" name="txtPrecioMembresia" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Beneficios:</strong></label>
                                    <input type="text" value="${membresia.getBeneficios()}" name="txtBeneficios" class="form-control form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Estado:</strong></label>
                                    <select name="txtEstado" class="form-control form-control-lg">
                               
                                <option value="Activo">Activo</option>
                                <option value="Inactivo">Inactivo</option>
                            </select>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="fs-5"><strong>Codigo Cliente:</strong></label>
                                    <select name="txtCodigoCliente" class="form-control form-control-ls"
                                    <c:if test="${membresia != null && membresia.codigoCliente != 0}">disabled</c:if>>
                                <option value="" disabled <c:if test="${membresia == null}">selected</c:if>>
                                        -- Seleccione un cliente --
                                    </option>
                                <c:forEach var="c" items="${clientes}">
                                    <option value="${c.codigoCliente}"
                                            <c:if test="${membresia != null && membresia.codigoCliente == c.codigoCliente}">selected</c:if>>
                                        ${c.codigoCliente} - ${c.nombresCliente}
                                    </option>
                                </c:forEach>
                                 </select>   
                                    
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
                                    <c:forEach var="membresia" items="${membresias}">
                                        <tr>
                                            <td>${membresia.getCodigoMembresia()}</td>
                                            <td>${membresia.getNumeroMembresia()}</td>
                                            <td>${membresia.getTipoMembresia()}</td>
                                            <td>${membresia.getPrecioMembresia()}</td>
                                            <td>${membresia.getBeneficios()}</td>
                                            <td>${membresia.getEstado()}</td>
                                            <td>${membresia.getCodigoCliente()}</td>
                                            <td>
                                                <div class="d-flex flex-column align-items-center gap-2">
                                                    <a class="btn btn-warning btn-lg mb-2" href="Controlador?menu=Membresia&accion=Editar&codigoMembresia=${membresia.codigoMembresia}">Editar</a>
               
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