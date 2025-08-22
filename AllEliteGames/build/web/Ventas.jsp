<%-- 
    Document   : Ventas
    Created on : 20/08/2025, 09:18:22
    Author     : Mauricio Xocoxic
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AllEliteGames - Ventas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
    <style>
        input[type="date"]:hover, select:hover {
            border-color: #023059;
        }
    </style>
    <script>
    function validarForm() {
        const productos = document.getElementById("txtTipoProducto").value.trim();
        const numeroSerie = document.getElementById("txtNumeroSerie").value.trim();
        const fechaVenta = document.getElementById("txtFechaVenta").value.trim();
        const monto = document.getElementById("txtMonto").value.trim();
        const estado = document.getElementById("txtEstado").value.trim();
        if (productos === "" || numeroSerie === "" || fechaVenta === "" || monto === "" || estado === "") {
            alert("Por favor completa los campos obligatorios: Productos, Numero de serie, Fecha de venta, Monto y Estado");
            return false;
        }
        return true;
    }

    function confirmarEliminar() {
        alert("No se puede eliminar ninguna venta.");
        return false; // Evita que se siga con la acción
    }
</script>

</head>
<body>
<div class="d-flex">
    <!-- Formulario para agregar/editar ventas -->
    <div class="card col-sm-4">
        <div class="card-body">
            <form action="Controlador?menu=Ventas" method="POST" onsubmit="return validarForm()">
                <input type="hidden" name="txtCodigoVenta" value="${ventaEdit.codigoVenta != null ? ventaEdit.codigoVenta : ''}">
                
                <div class="form-group">
                    <label><strong>Producto: </strong></label>
                    <input type="text" id="txtTipoProducto" value="${ventaEdit.tipoProducto}" 
                           name="txtTipoProducto" class="form-control" required>
                </div>
                <div class="form-group">
                    <label><strong>Numero de Serie: </strong></label>
                    <input type="text" id="txtNumeroSerie" value="${ventaEdit.numeroSerie}" 
                           name="txtNumeroSerie" class="form-control" required>
                </div>
                <div class="form-group">
                    <label><strong>Fecha de venta: </strong></label>
                    <input type="date" id="txtFechaVenta" value="${ventaEdit.fechaVenta}" 
                           name="dtFechaVenta" class="form-control" required>
                </div>
                <div class="form-group">
                    <label><strong>Monto: </strong></label>
                    <input type="text" id="txtMonto" value="${ventaEdit.monto}" 
                           name="txtMonto" class="form-control" required>
                </div>
                <div class="form-group">
                    <label><strong>Estado: </strong></label>
                    <input type="text" id="txtEstado" value="${ventaEdit.estado}" 
                           name="txtEstado" class="form-control" required>
                </div>
                <div class="form-group">
                    <label><strong>Cod Cliente: </strong></label>
                    <input type="text" value="${ventaEdit.codigoCliente}" name="txtCodigoCliente" class="form-control" required>
                </div>
                <div class="form-group">
                    <label><strong>Cod Empleado: </strong></label>
                    <input type="text" value="${ventaEdit.codigoEmpleado}" name="txtCodigoEmpleado" class="form-control" required>
                </div>
                <div class="form-group">
                    <label><strong>Cod Metodo de pago: </strong></label>
                    <input type="text" value="${ventaEdit.codigoMetodoPago}" name="txtCodigoMetodoPago" class="form-control" required>
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
                    <th>CODIGO</th>
                    <th>PRODUCTOS</th>
                    <th>NUM.SERIE</th>
                    <th>FECHA DE VENTA</th>
                    <th>MONTO</th>
                    <th>ESTADO</th>
                    <th>COD.CLIENTE</th>
                    <th>COD.EMPLEADO</th>
                    <th>COD.METODOPAGO</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="venta" items="${ventasList}">
                    <tr>
                        <td>${venta.codigoVenta}</td>
                        <td>${venta.tipoProducto}</td>
                        <td>${venta.numeroSerie}</td>
                        <td>${venta.fechaVenta}</td>
                        <td>${venta.monto}</td>
                        <td>${venta.estado}</td>
                        <td>${venta.codigoCliente}</td>
                        <td>${venta.codigoEmpleado}</td>
                        <td>${venta.codigoMetodoPago}</td>
                        <td>
                            <a class="btn btn-warning" 
                               href="Controlador?menu=Ventas&accion=Editar&codigoVenta=${venta.codigoVenta}">Editar</a>
                            <a class="btn btn-dark" 
                               href="Controlador?menu=Ventas&accion=Eliminar&codigoVenta=${venta.codigoVenta}" 
                               onclick="return confirmarEliminar();">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>
</html>
