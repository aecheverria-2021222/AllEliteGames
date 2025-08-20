<%-- 
    Document   : Cliente
    Created on : 20/08/2025, 02:36:41
    Author     : aleja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <c:if test="${not empty vacio}">
                        <div class="alert alert-danger" role="alert">${vacio}</div>
                    </c:if>
                    <c:if test="${not empty lleno}">
                        <div class="alert alert-danger" role="alert">${lleno}</div>
                    </c:if>
                    <form action="Controlador?menu=Cliente" method="POST">
                        <div class="form-group">
                            <label><strong>DPI:</strong></label>
                            <input type="text" value="${cliente.getDPICliente()}" name="txtDPICliente" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Nombres:</strong></label>
                            <input type="text" value="${cliente.getNombresCliente()}" name="txtNombresCliente" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Correo:</strong></label>
                            <input type="text" value="${cliente.getCorreoCliente()}" name="txtCorreoCliente" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Direccion:</strong></label>
                            <input type="text" value="${cliente.getDireccionCliente()}" name="txtDireccionCliente" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <select name="cmbEstado" class="form-control">
                                <option value="Activo">Activo</option>
                                <option value="Inactivo">Inactivo</option>
                            </select>
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>CÓDIGO</th>
                            <th>DPI</th>
                            <th>NOMBRES</th>
                            <th>CORREO</th>
                            <th>DIRECCION</th>
                            <th>ESTADO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cliente" items="${clientes}">
                            <tr>
                                <td>${cliente.getCodigoCliente()}</td>
                                <td>${cliente.getDPICliente()}</td>
                                <td>${cliente.getNombresCliente()}</td>
                                <td>${cliente.getCorreoCliente()}</td>
                                <td>${cliente.getDireccionCliente()}</td>
                                <td>${cliente.getEstado()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Cliente&accion=Editar&codigoCliente=${cliente.getCodigoCliente()}">Editar</a>

                                    <a class="btn btn-danger" href="Controlador?menu=Cliente&accion=Eliminar&codigoCliente=${cliente.getCodigoCliente()}"  onclick="return confirm('¿Seguro que desea eliminar este Cliente?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


            </div>


        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
