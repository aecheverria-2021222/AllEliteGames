<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consolas</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <link rel="stylesheet" href="<c:url value='/resources/general.css' />">
    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-center" style=" margin-top: 75PX;">
            <div class="row w-100 align-items-stretch" style="max-width: 1600px;"> 
                <div class="col-md-4">
                    <div class="card shadow-lg h-100">
                        <div class="card-body">
                            <form id="formConsola" action="Controlador?menu=Consolas" method="POST">
                                <div class="form-group">
                                    <label><strong>Nombre Consola:</strong></label>
                                    <input type="text" value="${consola != null && consola.getCodigoConsola() != null ? consola.getNombreConsola() : ''}" name="txtNombreConsola" class="form-control form-control-ls" required>
                                </div>
                                <div class="form-group">
                                    <label><strong>Precio Consola:</strong></label>
                                    <input type="number" step="0.01" min="0" value="${consola != null && consola.getCodigoConsola() != null ? consola.getPrecioConsola() : ''}" name="txtPrecioConsola" class="form-control form-control-ls" required>
                                </div>
                                <div class="form-group">
                                    <label><strong>Stock Consola:</strong></label>
                                    <input type="number" step="1" min="0" value="${consola != null && consola.getCodigoConsola() != null ? consola.getStockConsola() : ''}" name="txtStockConsola" class="form-control form-control-ls" required>
                                </div>
                                <div class="form-group">
                                    <label><strong>Marca:</strong></label>
                                    <input type="text" value="${consola != null && consola.getCodigoConsola() != null ? consola.getMarca() : ''}" name="txtMarca" class="form-control form-control-ls" required>
                                </div>
                                <div class="form-group">
                                    <label><strong>Fecha Lanzamiento:</strong></label>
                                    <input type="date" value="${consola.getFechaLanzamiento()}" name="dtFechaLanzamiento" class="form-control form-control-ls" required>
                                </div>
                                <div class="form-group">
                                    <label><strong>Estado:</strong></label>
                                    <select name="cmbEstado" class="form-control form-control-ls" value="${consola != null && consola.getCodigoConsola() != null ? consola.getFechaLanzamiento() : ''}" required>
                                        <option value="" ${consola == null ? "selected" : ""}>Seleccione</option>
                                        <option value="Activo" ${consola != null && consola.getEstado() == "Activo" ? "selected" : ""}>Activo</option>
                                        <option value="Inactivo" ${consola != null && consola.getEstado() == "Inactivo" ? "selected" : ""}>Inactivo</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label><strong>Codigo Proveedor:</strong></label>
                                    <select name="txtCodigoProveedor" class="form-control form-control-ls" required
                                            <c:if test="${consola != null && consola.codigoProveedor != 0}">disabled</c:if>>
                                        <option value="" disabled <c:if test="${consola == null || consola.getCodigoConsola() == null}">selected</c:if>>
                                                Seleccione un proveedor
                                            </option>
                                        <c:forEach var="p" items="${proveedores}">
                                            <option value="${p.codigoProveedor}" <c:if test="${consola != null && consola.codigoProveedor == p.codigoProveedor}">selected</c:if>>
                                                ${p.codigoProveedor} - ${p.nombresProveedor}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="d-flex gap-3">
                                    <input type="submit" id="btnAgregar" name="accion" value="Agregar" class="btn btn-info btn-lg" ${consola != null && consola.getCodigoConsola() != null ? "disabled" : ""}>
                                    <input type="submit" id="btnActualizar" name="accion" value="Actualizar" class="btn btn-success btn-lg" ${consola == null || consola.getCodigoConsola() == null ? "disabled" : ""}>
                                    <c:if test="${consola != null && consola.getCodigoConsola() != null}">
                                        <a href="#" id="btnCancelar" class="btn btn-secondary btn-lg">Cancelar</a>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card shadow-lg h-100">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover table-lg fs-5 mb-0">
                                    <thead class="bg-info text-white">
                                        <tr>
                                            <th>CODIGO</th>
                                            <th>NOMBRE CONSOLA</th>
                                            <th>PRECIO CONSOLA</th>
                                            <th>STOCK CONSOLA</th>
                                            <th>MARCA</th>
                                            <th>FECHA LANZAMIENTO</th>
                                            <th>ESTADO</th>
                                            <th>CODIGO PROVEEDOR</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="consola" items="${consolas}">
                                            <tr>
                                                <td>${consola.getCodigoConsola()}</td>
                                                <td>${consola.getNombreConsola()}</td>
                                                <td>${consola.getPrecioConsola()}</td>
                                                <td>${consola.getStockConsola()}</td>
                                                <td>${consola.getMarca()}</td>
                                                <td>${consola.getFechaLanzamiento()}</td>
                                                <td>${consola.getEstado()}</td>
                                                <td>${consola.getCodigoProveedor()}</td>
                                                <td>
                                                    <div class="d-flex flex-column align-items-center gap-2">
                                                        <a class="btn btn-warning btn-lg mb-2" href="Controlador?menu=Consolas&accion=Editar&codigoConsola=${consola.codigoConsola}">Editar</a>
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


                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
                 </body>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        const btnCancelar = document.getElementById("btnCancelar");
                        const form = document.getElementById("formConsola");
                        const btnAgregar = document.getElementById("btnAgregar");
                        const btnActualizar = document.getElementById("btnActualizar");

                        if (btnCancelar) {
                            btnCancelar.addEventListener("click", function (e) {
                                e.preventDefault();

                                // Limpiar todos los campos
                                Array.from(form.elements).forEach(el => {
                                    if (el.tagName === "INPUT" && el.type !== "submit")
                                        el.value = "";
                                    if (el.tagName === "SELECT") {
                                        el.selectedIndex = 0;
                                        el.disabled = false;
                                    }
                                });

                                // Ajustar botones
                                btnAgregar.disabled = false;
                                btnActualizar.disabled = true;
                                btnCancelar.style.display = "none";
                            });
                        }
                    });
                </script>
                </html>
