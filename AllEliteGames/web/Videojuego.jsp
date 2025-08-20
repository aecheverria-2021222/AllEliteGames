<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AllEliteGames</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
    <style>
        input, select {
            border-radius: 5px;
            padding: 4px 6px;
            box-sizing: border-box;
        }
        input:hover, select:hover {
            border-color: #023059;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Formulario -->
        <div class="card col-sm-4">
            <div class="card-body">

                <!-- Alert de validación -->
                <c:if test="${not empty vacio}">
                    <div class="alert alert-danger" role="alert">${vacio}</div>
                </c:if>

                <form action="Controlador?menu=Videojuego" method="POST">
                    <div class="form-group">
                        <label><strong>Videojuego:</strong></label>
                        <input type="text" value="${videojuegoSeleccionado.nombreVideojuego}" 
                               name="txtNombreVideojuego" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label><strong>Precio:</strong></label>
                        <input type="number" step="0.01" value="${videojuegoSeleccionado.precioVideojuego}" 
                               name="txtPrecioVideojuego" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label><strong>Stock:</strong></label>
                        <input type="number" value="${videojuegoSeleccionado.stockVideojuego}" 
                               name="txtStockVideojuego" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label><strong>Desarrollador:</strong></label>
                        <input type="text" value="${videojuegoSeleccionado.desarrollador}" 
                               name="txtDesarrollador" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label><strong>Estado:</strong></label>
                        <select name="txtEstado" class="form-control" required>
                            <option value="Activo" <c:if test="${videojuegoSeleccionado.estado eq 'Activo'}">selected</c:if>>Activo</option>
                            <option value="Inactivo" <c:if test="${videojuegoSeleccionado.estado eq 'Inactivo'}">selected</c:if>>Inactivo</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label><strong>Código Género:</strong></label>
                        <input type="number" value="${videojuegoSeleccionado.codigoGenero}" 
                               name="txtCodigoGenero" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label><strong>Código Proveedor:</strong></label>
                        <input type="number" value="${videojuegoSeleccionado.codigoProveedor}" 
                               name="txtCodigoProveedor" class="form-control" required>
                    </div>                    

                    <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                    <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                </form>
            </div>
        </div>

        <!-- Tabla de videojuegos -->
        <div class="col-sm-8">
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>CÓDIGO</th>
                        <th>VIDEOJUEGO</th>
                        <th>PRECIO</th>
                        <th>STOCK</th>
                        <th>DESARROLLADOR</th>
                        <th>ESTADO</th>
                        <th>CÓDIGO GÉNERO</th>
                        <th>CÓDIGO PROVEEDOR</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="videojuego" items="${videojuegos}">
                        <tr>
                            <td>${videojuego.codigoVideojuego}</td>
                            <td>${videojuego.nombreVideojuego}</td>
                            <td>${videojuego.precioVideojuego}</td>
                            <td>${videojuego.stockVideojuego}</td>
                            <td>${videojuego.desarrollador}</td>
                            <td>${videojuego.estado}</td>
                            <td>${videojuego.codigoGenero}</td>
                            <td>${videojuego.codigoProveedor}</td>
                            <td>
                                <a class="btn btn-warning" 
                                   href="Controlador?menu=Videojuego&accion=Editar&codigoVideojuego=${videojuego.codigoVideojuego}">Editar</a>
                                <a class="btn btn-danger" 
                                   href="Controlador?menu=Videojuego&accion=Eliminar&codigoVideojuego=${videojuego.codigoVideojuego}" 
                                   onclick="return confirm('¿Estás seguro de que deseas eliminar este videojuego?');">
                                   Eliminar
                                </a>
                            </td>
                        </tr>
                    </c:forEach>    
                </tbody>
            </table>
        </div>
    </div>

    <!-- Scripts de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
