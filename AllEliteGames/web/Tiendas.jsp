<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tiendas</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="ControladorTiendas?menu=Tiendas" method="POST">
                        <div class="form-group">
                            <label><strong>Número de Tienda:</strong></label>
                            <input type="text" value="${tienda.getNumeroTienda()}" 
                                   name="txtNumeroTienda" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label><strong>Dirección:</strong></label>
                            <input type="text" value="${tienda.getDireccion()}" 
                                   name="txtDireccion" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label><strong>Teléfono:</strong></label>
                            <input type="text" value="${tienda.getTelefonoTienda()}" 
                                   name="txtTelefonoTienda" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label><strong>Correo:</strong></label>
                            <input type="text" value="${tienda.getCorreoTienda()}" 
                                   name="txtCorreoTienda" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label><strong>Horario Apertura:</strong></label>
                            <input type="text" value="${tienda.getHorarioApertura()}" 
                                   name="txtHorarioApertura" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label><strong>Horario Cierre:</strong></label>
                            <input type="text" value="${tienda.getHorarioCierre()}" 
                                   name="txtHorarioCierre" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${tienda.getEstado()}" 
                                   name="txtEstado" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label><strong>Código Empleado:</strong></label>
                            <input type="text" value="${tienda.getCodigoEmpleado()}" 
                                   name="txtCodigoEmpleado" class="form-control">
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
                            <th>NÚMERO</th>
                            <th>DIRECCIÓN</th>
                            <th>TELÉFONO</th>
                            <th>CORREO</th>
                            <th>HORARIO APERTURA</th>
                            <th>HORARIO CIERRE</th>
                            <th>ESTADO</th>
                            <th>CÓDIGO EMPLEADO</th>
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
                                    <a class="btn btn-warning" href="ControladorTiendas?menu=Tiendas&accion=Editar&codigoTienda=${tienda.codigoTienda}">Editar</a>
                                    <a class="btn btn-danger" href="ControladorTiendas?menu=Tiendas&accion=Eliminar&codigoTienda=${tienda.codigoTienda}">Eliminar</a>
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
