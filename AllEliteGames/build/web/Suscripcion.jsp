
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                    <form action="Controlador?menu=Suscripcion" method="POST">
                        <div class="form-group">
                            <label><strong> Fecha Suscripción: </strong></label>
                            <input type="date" value="${suscripcion.getFechaSuscripcion()}" name="dtFechaSuscripcion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong> Fecha Fin: </strong></label>
                            <input type="date" value="${suscripcion.getFechaFin()}" name="dtFechaFin" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong> Tipo de Suscripción: </strong></label>
                            <input type="text" value="${suscripcion.getTipoSuscripcion()}" name="txtTipoSuscripcion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong> Estado: </strong></label>
                            <select name="cmbEstado" class="form-control">
                                <option value="Activo">Activo</option>
                                <option value="Inactivo">Inactivo</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label><strong> Código Cliente: </strong></label>
                            <input type="text" value="${suscripcion.getCodigoCliente()}" name="txtCodigoCliente" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label><strong> Código Videojuego: </strong></label>
                            <input type="text" value="${suscripcion.getCodigoVideojuego()}" name="txtCodigoVideojuego" class="form-control" >
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>

            <!-- Tabla de suscripciones -->
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>CODIGO</th>
                            <th>FECHA SUSCRIPCION</th>
                            <th style="width: 350px;">FECHA FIN</th>
                            <th>TIPO SUSCRIPCION</th>
                            <th>ESTADO</th>
                            <th>CODIGO CLIENTE</th>
                            <th>CODIGO VIDEOJUEGO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="suscripcion" items="${suscripciones}">
                        <tr>
                            <td>${suscripcion.getCodigoSuscripcion()}</td>
                            <td>${suscripcion.getFechaSuscripcion()}</td>
                            <td>${suscripcion.getFechaFin()}</td>
                            <td>${suscripcion.getTipoSuscripcion()}</td>
                            <td>${suscripcion.getEstado()}</td>
                            <td>${suscripcion.getCodigoCliente()}</td>
                            <td>${suscripcion.getCodigoVideojuego()}</td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?menu=Suscripcion&accion=Editar&codigoSuscripcion=${suscripcion.getCodigoSuscripcion()}">Editar</a>
                                <a class="btn btn-danger" href="Controlador?menu=Suscripcion&accion=Eliminar&codigoSuscripcion=${suscripcion.getCodigoSuscripcion()}" onclick="return confirm('¿Está seguro de eliminar esta suscripción?');">Eliminar</a>
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