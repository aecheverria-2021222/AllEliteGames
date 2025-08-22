/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Consola;
import modelo.ConsolaDAO;
import modelo.Devoluciones;
import modelo.DevolucionesDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Genero;
import modelo.GeneroDAO;
import modelo.Membresia;
import modelo.MembresiasDAO;
import modelo.Proveedor;
import modelo.ProveedorDao;
import modelo.Suscripcion;
import modelo.SuscripcionDAO;
import modelo.Tiendas;
import modelo.TiendasDAO;
import modelo.Ventas;
import modelo.VentasDAO;
import modelo.Videojuego;
import modelo.VideojuegoDAO;

/**
 *
 * @author gonze
 */
public class Controlador extends HttpServlet {

    Empleado empleado = new Empleado();
    EmpleadoDAO empleadoDao = new EmpleadoDAO();
    Genero genero = new Genero();
    GeneroDAO generoDao = new GeneroDAO();
    Tiendas tienda = new Tiendas();
    TiendasDAO tiendasDAO = new TiendasDAO();
    Videojuego videojuego = new Videojuego();
    VideojuegoDAO videojuegoDao = new VideojuegoDAO();
    Suscripcion suscripcion = new Suscripcion();
    SuscripcionDAO suscripcionDao = new SuscripcionDAO();
    Consola consola = new Consola();
    ConsolaDAO consolaDao = new ConsolaDAO();
    Cliente cliente = new Cliente();
    ClienteDAO clienteDao = new ClienteDAO();
    Devoluciones devolucion = new Devoluciones();
    DevolucionesDAO devolucionDao = new DevolucionesDAO();
    Proveedor proveedor = new Proveedor();
    ProveedorDao proveedorDao = new ProveedorDao();
    MembresiasDAO membresiasDao = new MembresiasDAO();
    VentasDAO ventasDao = new VentasDAO();
    int codDevolucion;
    int codVideojuego;
    int codEmpleado;
    int codSuscripcion;
    int codConsola;
    int codCliente;
    int codTienda;
    int codGenero;
    int codProveedor;
    int codMembresias;
    int codVentas;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        } else if (menu.equals("Cliente")) {
            switch (accion) {
                case "Listar":
                    List listaClientes = clienteDao.listar();
                    request.setAttribute("clientes", listaClientes);

                    break;
                case "Agregar":
                    String DPI = request.getParameter("txtDPICliente");
                    String nombres = request.getParameter("txtNombresCliente");
                    String correo = request.getParameter("txtCorreoCliente");
                    String direccion = request.getParameter("txtDireccionCliente");
                    String est = request.getParameter("cmbEstado");

                    if (DPI.isEmpty() || nombres.isEmpty() || correo.isEmpty() || direccion.isEmpty() || est.isEmpty()) {

                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("clientes", clienteDao.listar());
                        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
                        return;
                    } else if (DPI.trim().length() > 5 || nombres.trim().length() > 200 || correo.trim().length() > 150 || direccion.trim().length() > 150 || est.trim().length() > 15) {
                        request.setAttribute("lleno", "Número de caracteres superado en un campo. Inténtelo de nuevo.");
                        request.setAttribute("clientes", clienteDao.listar());
                        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
                        return;
                    }

                    cliente.setDPICliente(DPI);
                    cliente.setNombresCliente(nombres);
                    cliente.setCorreoCliente(correo);
                    cliente.setDireccionCliente(direccion);
                    cliente.setEstado(est);
                    clienteDao.agregar(cliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    Cliente c = clienteDao.listarCodigoCliente(codCliente);
                    request.setAttribute("cliente", c);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String DPICli = request.getParameter("txtDPICliente");
                    String nombreCli = request.getParameter("txtNombresCliente");
                    String correoCli = request.getParameter("txtCorreoCliente");
                    String direccionCli = request.getParameter("txtDireccionCliente");
                    String estCli = request.getParameter("cmbEstado");

                    if (DPICli.isEmpty() || nombreCli.isEmpty() || correoCli.isEmpty() || direccionCli.isEmpty() || estCli.isEmpty()) {

                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("clientes", clienteDao.listar());
                        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
                        return;
                    } else if (DPICli.trim().length() > 5 || nombreCli.trim().length() > 200 || correoCli.trim().length() > 150 || direccionCli.trim().length() > 150 || estCli.trim().length() > 15) {
                        request.setAttribute("lleno", "Número de caracteres superado en un campo. Inténtelo de nuevo.");
                        request.setAttribute("clientes", clienteDao.listar());
                        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
                        return;
                    }

                    cliente.setDPICliente(DPICli);
                    cliente.setNombresCliente(nombreCli);
                    cliente.setCorreoCliente(correoCli);
                    cliente.setDireccionCliente(direccionCli);
                    cliente.setEstado(estCli);
                    cliente.setCodigoCliente(codCliente);
                    clienteDao.actualizar(cliente);

                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    clienteDao.eliminar(codCliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("Cliente.jsp").forward(request, response);
        } else if (menu.equals("Empleado")) {
            switch (accion) {
                case "Listar":
                    List listaEmpleados = empleadoDao.listar();
                    request.setAttribute("empleados", listaEmpleados);
                    break;

                case "Agregar":
                    String DPI = request.getParameter("txtDPIEmpleado");
                    String nombres = request.getParameter("txtNombresEmpleado");
                    String telefono = request.getParameter("txtTelefonoEmpleado");
                    String est = request.getParameter("txtEstadoEmpleado");
                    String user = request.getParameter("txtUsuarioEmpleado");
                    empleado.setDPIEmpleado(DPI);
                    empleado.setNombresEmpleado(nombres);
                    empleado.setTelefonoEmpleado(telefono);
                    empleado.setEstado(est);
                    empleado.setUsuario(user);
                    empleadoDao.agregar(empleado);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    codEmpleado = Integer.parseInt(request.getParameter("codigoEmpleado"));
                    Empleado e = empleadoDao.listarCodigoEmpleado(codEmpleado);
                    request.setAttribute("empleado", e);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    int codEmp = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));
                    String DPIEmp = request.getParameter("txtDPIEmpleado");
                    String nombreEmp = request.getParameter("txtNombresEmpleado");
                    String telefonoEmp = request.getParameter("txtTelefonoEmpleado");
                    String estEmp = request.getParameter("txtEstadoEmpleado");
                    String userEmp = request.getParameter("txtUsuarioEmpleado");
                    empleado.setCodigoEmpleado(codEmp);
                    empleado.setDPIEmpleado(DPIEmp);
                    empleado.setNombresEmpleado(nombreEmp);
                    empleado.setTelefonoEmpleado(telefonoEmp);
                    empleado.setEstado(estEmp);
                    empleado.setUsuario(userEmp);
                    empleadoDao.actualizar(empleado);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    codEmpleado = Integer.parseInt(request.getParameter("codigoEmpleado"));
                    empleadoDao.eliminar(codEmpleado);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
            }

            request.getRequestDispatcher("Empleado.jsp").forward(request, response);
        } else if (menu.equals("genero")) {
            switch (accion) {
                case "Listar":
                    List listaGeneros = generoDao.listar();
                    request.setAttribute("generos", listaGeneros);
                    request.getRequestDispatcher("Genero.jsp").forward(request, response);
                    break;

                case "Agregar":
                    String nombreGenero = request.getParameter("txtGenero");
                    String edad = request.getParameter("txtEdadRecomendable");
                    String popularidad = request.getParameter("txtPopularidad");
                    String publico = request.getParameter("txtPublicoObjetivo");
                    String estado = request.getParameter("txtEstado");
                    genero.setGenero(nombreGenero);
                    genero.setEdadRecomendable(edad);
                    genero.setPopularidad(popularidad);
                    genero.setPublicoObjetivo(publico);
                    genero.setEstado(estado);
                    generoDao.agregar(genero);
                    request.getRequestDispatcher("Controlador?menu=genero&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    codGenero = Integer.parseInt(request.getParameter("codigoGenero"));
                    Genero g = generoDao.listarCodigoGenero(codGenero);
                    request.setAttribute("genero", g);
                    request.getRequestDispatcher("Controlador?menu=genero&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    String nombreGen = request.getParameter("txtGenero");
                    String edadRec = request.getParameter("txtEdadRecomendable");
                    String popu = request.getParameter("txtPopularidad");
                    String publicoObj = request.getParameter("txtPublicoObjetivo");
                    String estadoGen = request.getParameter("txtEstado");
                    genero.setGenero(nombreGen);
                    genero.setEdadRecomendable(edadRec);
                    genero.setPopularidad(popu);
                    genero.setPublicoObjetivo(publicoObj);
                    genero.setEstado(estadoGen);
                    generoDao.actualizar(genero);
                    request.getRequestDispatcher("Controlador?menu=genero&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    codGenero = Integer.parseInt(request.getParameter("codigoGenero"));
                    generoDao.eliminar(codGenero);
                    request.getRequestDispatcher("Controlador?menu=genero&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Genero.jsp").forward(request, response);

        } else if (menu.equals("Tiendas")) {
            switch (accion) {
                case "Listar":
                    List listaTiendas = tiendasDAO.listar();
                    request.setAttribute("tiendas", listaTiendas);
                    break;

                case "Agregar":
                    int numTienda = Integer.parseInt(request.getParameter("txtNumeroTienda"));
                    String direcc = request.getParameter("txtDireccion");
                    String teleTienda = request.getParameter("txtTelefonoTienda");
                    String correTienda = request.getParameter("txtCorreoTienda");
                    String horarAper = request.getParameter("txtHorarioApertura");
                    String horarCerr = request.getParameter("txtHorarioCierre");
                    String est = request.getParameter("txtEstado");
                    int codEmp = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));

                    tienda.setNumeroTienda(numTienda);
                    tienda.setDireccion(direcc);
                    tienda.setTelefonoTienda(teleTienda);
                    tienda.setCorreoTienda(correTienda);
                    tienda.setHorarioApertura(horarAper);
                    tienda.setHorarioCierre(horarCerr);
                    tienda.setEstado(est);
                    tienda.setCodigoEmpleado(codEmp);

                    tiendasDAO.agregar(tienda);
                    request.getRequestDispatcher("ControladorTiendas?menu=Tiendas&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    codTienda = Integer.parseInt(request.getParameter("codigoTienda"));
                    Tiendas t = tiendasDAO.listarCodigoTienda(codTienda);
                    request.setAttribute("tienda", t);
                    request.getRequestDispatcher("ControladorTiendas?menu=Tiendas&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    int numeTienda = Integer.parseInt(request.getParameter("txtNumeroTienda"));
                    String direcci = request.getParameter("txtDireccion");
                    String telefTienda = request.getParameter("txtTelefonoTienda");
                    String corrTienda = request.getParameter("txtCorreoTienda");
                    String horaAper = request.getParameter("txtHorarioApertura");
                    String horaCerr = request.getParameter("txtHorarioCierre"); // corregido
                    String estad = request.getParameter("txtEstado");
                    int codEmplea = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));

                    tienda.setNumeroTienda(numeTienda);
                    tienda.setDireccion(direcci);
                    tienda.setTelefonoTienda(telefTienda);
                    tienda.setCorreoTienda(corrTienda);
                    tienda.setHorarioApertura(horaAper);
                    tienda.setHorarioCierre(horaCerr);
                    tienda.setEstado(estad);
                    tienda.setCodigoEmpleado(codEmplea);
                    tienda.setCodigoTienda(codTienda);

                    tiendasDAO.actualizar(tienda);
                    request.getRequestDispatcher("ControladorTiendas?menu=Tiendas&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    codTienda = Integer.parseInt(request.getParameter("codigoTienda"));
                    tiendasDAO.eliminar(codTienda);
                    request.getRequestDispatcher("ControladorTiendas?menu=Tiendas&accion=Listar").forward(request, response);
            }

            request.getRequestDispatcher("Tiendas.jsp").forward(request, response);

        } else if (menu.equals("Videojuego")) {

            switch (accion) {
                case "Listar":
                    List listaVideojuego = videojuegoDao.listar();
                    request.setAttribute("videojuego", listaVideojuego);
                    break;
                case "Agregar":
                    String nombres = request.getParameter("txtNombreVideojuego");
                    Double precio = Double.valueOf(request.getParameter("txtPrecioVideojuego"));
                    int stock = Integer.parseInt(request.getParameter("txtStockVideojuego"));
                    String des = request.getParameter("txtDesarrollador");
                    String est = request.getParameter("txtEstado");
                    videojuego.setNombreVideojuego(nombres);
                    videojuego.setPrecioVideojuego(precio);
                    videojuego.setStockVideojuego(stock);
                    videojuego.setDesarrollador(des);
                    videojuego.setEstado(est);
                    videojuegoDao.agregar(videojuego);
                    request.getRequestDispatcher("Controlador?menu=Videojuego&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codVideojuego = Integer.parseInt(request.getParameter("codigoVideojuego"));
                    Videojuego v = videojuegoDao.listarCodigoVideojuego(codVideojuego);
                    request.setAttribute("videojuego", v);
                    request.getRequestDispatcher("Controlador?menu=Videojuego&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombreVid = request.getParameter("txtNombreVideojuego");
                    Double precioVid = Double.valueOf(request.getParameter("txtPrecioVideojuego"));
                    int stockVid = Integer.parseInt(request.getParameter("txtStockVideojuego"));
                    String desaVid = request.getParameter("txtDesarrollador");
                    String estaVid = request.getParameter("txtEstado");
                    videojuego.setNombreVideojuego(nombreVid);
                    videojuego.setPrecioVideojuego(precioVid);
                    videojuego.setStockVideojuego(stockVid);
                    videojuego.setDesarrollador(desaVid);
                    videojuego.setEstado(estaVid);
                    videojuegoDao.agregar(videojuego);
                    request.getRequestDispatcher("Controlador?menu=Videojuego&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codVideojuego = Integer.parseInt(request.getParameter("codigoVideojuego"));
                    videojuegoDao.eliminar(codVideojuego);
                    request.getRequestDispatcher("Controlador?menu=Videojuego&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Videojuego.jsp").forward(request, response);
        } else if (menu.equals("Suscripcion")) {
            switch (accion) {
                case "Listar":
                    List listaSuscripciones = suscripcionDao.listarSuscripcion();
                    request.setAttribute("suscripciones", listaSuscripciones);
                    break;

                case "Agregar":
                    request.setAttribute("deshabilitar", false);
                    String fechaSus = request.getParameter("dtFechaSuscripcion");
                    String fechaFi = request.getParameter("dtFechaFin");
                    String tipoSus = request.getParameter("txtTipoSuscripcion");
                    String est = request.getParameter("cmbEstado");
                    String codClient = request.getParameter("txtCodigoCliente");
                    String codVideoj = request.getParameter("txtCodigoVideojuego");

                    if (fechaSus.isEmpty() || fechaFi.isEmpty() || tipoSus.isEmpty() || est.isEmpty()
                            || codClient.isEmpty() || codVideoj.isEmpty()) {

                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());

                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//if de campos vacíos

                    if (java.sql.Date.valueOf(fechaSus).after(java.sql.Date.valueOf(fechaFi))) {
                        request.setAttribute("mayor", "La Fecha Suscripción no puede ser mayor que la Fecha Fin. Por favor inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//if de que la fecha suscripcion no puede ser mayor a la fecha fin

                    if (!tipoSus.matches("^[A-Za-z0-9 ]+$")) {
                        request.setAttribute("texto", "El Tipo de Suscripción solo puede contener letras, números o espacios. Por favor inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//if de validar que solo se puedan ingresar números o letras en tipo Suscripcion.

                    if (!codClient.matches("^[0-9]+$") || Integer.parseInt(codClient) <= 0) {
                        request.setAttribute("codigoC", "Código Cliente inválido. Por favor inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//If de que el código de cliente sea un número entero mayor que 0

                    if (!codVideoj.matches("^[0-9]+$") || Integer.parseInt(codVideoj) <= 0) {
                        request.setAttribute("codigoV", "Código Videojuego inválido. Por favor inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//if de que el codigo de videojuego sea un numero entero mayor que 0

                    suscripcion.setFechaSuscripcion(java.sql.Date.valueOf(fechaSus));
                    suscripcion.setFechaFin(java.sql.Date.valueOf(fechaFi));
                    suscripcion.setTipoSuscripcion(tipoSus);
                    suscripcion.setEstado(est);
                    suscripcion.setCodigoCliente(Integer.parseInt(codClient));
                    suscripcion.setCodigoVideojuego(Integer.parseInt(codVideoj));
                    suscripcionDao.agregar(suscripcion);
                    request.getRequestDispatcher("Controlador?menu=Suscripcion&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    request.setAttribute("deshabilitar", true);
                    codSuscripcion = Integer.parseInt(request.getParameter("codigoSuscripcion"));
                    Suscripcion s = suscripcionDao.buscar(codSuscripcion);
                    request.setAttribute("suscripcion", s);
                    request.getRequestDispatcher("Controlador?menu=Suscripcion&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    String fechaSuscri = request.getParameter("dtFechaSuscripcion");
                    String fecFin = request.getParameter("dtFechaFin");
                    String tipSuscri = request.getParameter("txtTipoSuscripcion");
                    String esta = request.getParameter("cmbEstado");

                    if (fechaSuscri.isEmpty() || fecFin.isEmpty() || tipSuscri.isEmpty() || esta.isEmpty()) {

                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//if de campos vacíos
                    if (java.sql.Date.valueOf(fechaSuscri).after(java.sql.Date.valueOf(fecFin))) {
                        request.setAttribute("mayor", "La Fecha Suscripción no puede ser mayor que la Fecha Fin. Por favor inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//if de que la fecha suscripcion no puede ser mayor a la fecha fin

                    if (!tipSuscri.matches("^[A-Za-z0-9 ]+$")) {
                        request.setAttribute("texto", "El Tipo de Suscripción solo puede contener letras, números o espacios. Por favor inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//if de validar que solo se puedan ingresar números o letras en tipo Suscripcion.
                    
                    suscripcion.setFechaSuscripcion(java.sql.Date.valueOf(fechaSuscri));
                    suscripcion.setFechaFin(java.sql.Date.valueOf(fecFin));
                    suscripcion.setTipoSuscripcion(tipSuscri);
                    suscripcion.setEstado(esta);
                    suscripcion.setCodigoSuscripcion(codSuscripcion);
                    suscripcionDao.actualizar(suscripcion);
                    request.getRequestDispatcher("Controlador?menu=Suscripcion&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    codSuscripcion = Integer.parseInt(request.getParameter("codigoSuscripcion"));
                    suscripcionDao.eliminar(codSuscripcion);
                    request.getRequestDispatcher("Controlador?menu=Suscripcion&accion=Listar").forward(request, response);
                    break;
            }//switch de acciones del CRUD de Suscripciones
            request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
        }//else if Suscripcion.
        else if (menu.equals("Consolas")) {
            switch (accion) {
                case "Listar":
                    List listaConsolas = consolaDao.listar();
                    request.setAttribute("consolas", listaConsolas);
                    List proveedoresCon = proveedorDao.listar();
                    request.setAttribute("proveedores", proveedoresCon);
                    break;
                case "Agregar":
                    String nombreConsola = request.getParameter("txtNombreConsola");
                    Double precioConsola = Double.parseDouble(request.getParameter("txtPrecioConsola"));
                    int stockConsola = Integer.parseInt(request.getParameter("txtStockConsola"));
                    String marca = request.getParameter("txtMarca");
                    Date fechaLanzamiento = java.sql.Date.valueOf(request.getParameter("dtFechaLanzamiento"));
                    String estado = request.getParameter("cmbEstado");
                    int codigoProveedor = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    consola.setNombreConsola(nombreConsola);
                    consola.setPrecioConsola(precioConsola);
                    consola.setStockConsola(stockConsola);
                    consola.setMarca(marca);
                    consola.setFechaLanzamiento(fechaLanzamiento);
                    consola.setEstado(estado);
                    consola.setCodigoProveedor(codigoProveedor);
                    consolaDao.agregar(consola);
                    request.getRequestDispatcher("Controlador?menu=Consolas&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codConsola = Integer.parseInt(request.getParameter("codigoConsola"));
                    Consola c = consolaDao.listarCodigoConsola(codConsola);
                    request.setAttribute("consola", c);
                    List proveedoresEdiCon = proveedorDao.listar();
                    request.setAttribute("proveedores", proveedoresEdiCon);
                    request.getRequestDispatcher("Controlador?menu=Consolas&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombreCon = request.getParameter("txtNombreConsola");
                    Double precioCon = Double.parseDouble(request.getParameter("txtPrecioConsola"));
                    int stockCon = Integer.parseInt(request.getParameter("txtStockConsola"));
                    String marCon = request.getParameter("txtMarca");
                    Date fechaLanCon = java.sql.Date.valueOf(request.getParameter("dtFechaLanzamiento"));
                    String estCon = request.getParameter("cmbEstado");
                    consola.setNombreConsola(nombreCon);
                    consola.setPrecioConsola(precioCon);
                    consola.setStockConsola(stockCon);
                    consola.setMarca(marCon);
                    consola.setFechaLanzamiento(fechaLanCon);
                    consola.setEstado(estCon);
                    consola.setCodigoConsola(codConsola);
                    consolaDao.actualizar(consola);
                    request.getRequestDispatcher("Controlador?menu=Consolas&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codConsola = Integer.parseInt(request.getParameter("codigoConsola"));
                    consolaDao.eliminar(codConsola);
                    request.getRequestDispatcher("Controlador?menu=Consolas&accion=Listar").forward(request, response);
                    break;
            }//switch de acciones del CRUD de Consolas
            request.getRequestDispatcher("Consolas.jsp").forward(request, response);
        } else if (menu.equals("Devoluciones")) {
            switch (accion) {
                case "Listar":
                    List listaDevolucion = devolucionDao.listar();
                    request.setAttribute("devoluciones", listaDevolucion);
                    break;

                case "Agregar":
                    String fechaSol = request.getParameter("dtFechaSolicitud");
                    String fechaDev = request.getParameter("dtFechaDevolucion");
                    String moti = request.getParameter("txtMotivo");
                    String est = request.getParameter("txtEstado");
                    String codVent = request.getParameter("txtCodigoVenta");

                    if (fechaSol.isEmpty() || fechaDev.isEmpty() || moti.isEmpty() || est.isEmpty() || codVent.isEmpty()) {
                        request.setAttribute("ERROR", "No se pueden dejar campos vacíos.");
                    } else {
                        devolucion.setFechaSolicitud(java.sql.Date.valueOf(fechaSol));
                        devolucion.setFechaDevolucion(java.sql.Date.valueOf(fechaDev));
                        devolucion.setMotivo(moti);
                        devolucion.setEstado(est);
                        devolucion.setCodigoVenta(Integer.parseInt(codVent));
                        devolucionDao.agregar(devolucion);
                    }
                    listaDevolucion = devolucionDao.listar();
                    request.setAttribute("devoluciones", listaDevolucion);
                    break;

                case "Editar":
                    codDevolucion = Integer.parseInt(request.getParameter("codigoDevolucion"));
                    Devoluciones de = devolucionDao.buscar(codDevolucion);
                    request.setAttribute("devolucion", de);
                    listaDevolucion = devolucionDao.listar();
                    request.setAttribute("devoluciones", listaDevolucion);
                    break;

                case "Actualizar":
                    String fechaSoli = request.getParameter("dtFechaSolicitud");
                    String fecDevo = request.getParameter("dtFechaDevolucion");
                    String motiv = request.getParameter("txtMotivo");
                    String esta = request.getParameter("txtEstado");

                    if (fechaSoli.isEmpty() || fecDevo.isEmpty() || motiv.isEmpty() || esta.isEmpty()) {
                        request.setAttribute("ERROR", "No se pueden dejar campos vacíos.");
                    } else {
                        devolucion.setFechaSolicitud(java.sql.Date.valueOf(fechaSoli));
                        devolucion.setFechaDevolucion(java.sql.Date.valueOf(fecDevo));
                        devolucion.setMotivo(motiv);
                        devolucion.setEstado(esta);
                        devolucion.setCodigoDevolucion(codDevolucion);
                        devolucionDao.actualizar(devolucion);
                    }
                    listaDevolucion = devolucionDao.listar();
                    request.setAttribute("devoluciones", listaDevolucion);
                    break;

                case "Eliminar":
                    codDevolucion = Integer.parseInt(request.getParameter("codigoDevolucion"));
                    devolucionDao.eliminar(codDevolucion);
                    listaDevolucion = devolucionDao.listar();
                    request.setAttribute("devoluciones", listaDevolucion);
                    break;
            }
            request.getRequestDispatcher("Devoluciones.jsp").forward(request, response);
        } else if ("Proveedor".equals(menu)) {
            switch (accion) {
                case "Listar":
                    List<Proveedor> listaProveedores = proveedorDao.listar();
                    request.setAttribute("proveedores", listaProveedores);
                    request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                    return;
                case "Agregar":
                    String nombres = request.getParameter("txtNombresProveedor");
                    String telefono = request.getParameter("txtTelefonoProveedor");
                    String correo = request.getParameter("txtCorreoProveedor");
                    String direccion = request.getParameter("txtDireccion");
                    String estado = request.getParameter("txtEstado");
                    proveedor.setNombresProveedor(nombres);
                    proveedor.setTelefonoProveedor(telefono);
                    proveedor.setCorreoProveedor(correo);
                    proveedor.setDireccion(direccion);
                    proveedor.setEstado(estado);
                    proveedorDao.agregar(proveedor);
                    List<Proveedor> listaProveedores2 = proveedorDao.listar();
                    request.setAttribute("proveedores", listaProveedores2);
                    request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                    return;
                case "Editar":
                    codProveedor = Integer.parseInt(request.getParameter("codigoProveedor"));
                    Proveedor p = proveedorDao.buscar(codProveedor);
                    request.setAttribute("proveedor", p);
                    List<Proveedor> listaProveedorEditar = proveedorDao.listar();
                    request.setAttribute("proveedores", listaProveedorEditar);
                    request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                    return;
                case "Actualizar":
                    String nombreProv = request.getParameter("txtNombresProveedor");
                    String telefonoProv = request.getParameter("txtTelefonoProveedor");
                    String correoProv = request.getParameter("txtCorreoProveedor");
                    String direccionProv = request.getParameter("txtDireccion");
                    String estadoProv = request.getParameter("txtEstado");
                    proveedor.setNombresProveedor(nombreProv);
                    proveedor.setTelefonoProveedor(telefonoProv);
                    proveedor.setCorreoProveedor(correoProv);
                    proveedor.setDireccion(direccionProv);
                    proveedor.setEstado(estadoProv);
                    proveedor.setCodigoProveedor(codProveedor);
                    proveedorDao.actualizar(proveedor);
                    List<Proveedor> listaProveedores3 = proveedorDao.listar();
                    request.setAttribute("proveedores", listaProveedores3);
                    request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                    return;
                case "Eliminar":
                    codProveedor = Integer.parseInt(request.getParameter("codigoProveedor"));
                    proveedorDao.eliminar(codProveedor);
                    List<Proveedor> listaProveedores4 = proveedorDao.listar();
                    request.setAttribute("proveedores", listaProveedores4);
                    request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                    return;
            }

            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
            return;
        } else if (menu.equals("Membresias")) {   
    switch (accion) {

        case "Listar":
            List<Membresia> listaMembresias = membresiasDao.listar();
            request.setAttribute("listaMembresias", listaMembresias);
            break;

        case "Agregar":
            try {
                String numero = request.getParameter("txtNumeroMembresia");
                String tipo = request.getParameter("txtTipoMembresia");
                String precio = request.getParameter("txtPrecioMembresia");
                String bene = request.getParameter("txtBeneficios");
                String est = request.getParameter("txtEstado");
                String codClient = request.getParameter("txtCodigoCliente");
                if (numero == null || numero.trim().isEmpty() ||
                    tipo == null || tipo.trim().isEmpty() ||
                    precio == null || precio.trim().isEmpty() ||
                    codClient == null || codClient.trim().isEmpty()) {
                    request.setAttribute("mensaje", " Todos los campos obligatorios deben completarse ");
                } else {
                    Membresia nueva = new Membresia();
                    nueva.setNumeroMembresia(numero);
                    nueva.setTipoMembresia(tipo);
                    nueva.setPrecioMembresia(precio);
                    nueva.setBeneficios(bene);
                    nueva.setEstado(est);
                    nueva.setCodigoCliente(Integer.parseInt(codClient));
                    int resp = membresiasDao.agregar(nueva);
                    if (resp > 0) {
                        request.setAttribute("mensaje", " Membresía agregada correctamente.");
                    } else {
                        request.setAttribute("mensaje", " No se pudo agregar la membresía.");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("mensaje", "Error al agregar la membresía");
            }
            request.getRequestDispatcher("Controlador?menu=Membresias&accion=Listar").forward(request, response);
            break;

        case "Editar":
            try {
                codMembresias = Integer.parseInt(request.getParameter("codigoMembresia"));
                Membresia e = membresiasDao.listarCodigoMembresia(codMembresias);
                request.setAttribute("membresia", e); 
            } catch (Exception ex) {
                ex.printStackTrace();
                request.setAttribute("mensaje", "Error al cargar la membresía para editar.");
            }
            request.getRequestDispatcher("Controlador?menu=Membresias&accion=Listar").forward(request, response);
            break;

        case "Actualizar":
            try {
                String NumMem = request.getParameter("txtNumeroMembresia");
                String TipoMem = request.getParameter("txtTipoMembresia");
                String PrecMem = request.getParameter("txtPrecioMembresia");
                String BeneMem = request.getParameter("txtBeneficios");
                String EstMem = request.getParameter("txtEstado");
                Membresia actualizado = new Membresia();
                actualizado.setCodigoMembresia(codMembresias);
                actualizado.setNumeroMembresia(NumMem);
                actualizado.setTipoMembresia(TipoMem);
                actualizado.setPrecioMembresia(PrecMem);
                actualizado.setBeneficios(BeneMem);
                actualizado.setEstado(EstMem);
                int resp = membresiasDao.actualizar(actualizado);
                if (resp > 0) {
                    request.setAttribute("mensaje", "Membresía actualizada correctamente.");
                } else {
                    request.setAttribute("mensaje", "No se pudo actualizar la membresía.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("mensaje", "Error al actualizar la membresía.");
            }
            request.getRequestDispatcher("Controlador?menu=Membresias&accion=Listar").forward(request, response);                   
            break;
        case "Eliminar":
            try {
                codMembresias = Integer.parseInt(request.getParameter("codigoMembresia"));
                membresiasDao.eliminar(codMembresias);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("Controlador?menu=Membresias&accion=Listar").forward(request, response);
            break;

            }
    request.getRequestDispatcher("Membresias.jsp").forward(request, response);
          }else if (menu.equals("Ventas")) {
            switch (accion) {
                case "Listar":
                    List<Ventas> listaVentas = ventasDao.listar();
                    request.setAttribute("ventasList", listaVentas); 
                    break;
                case "Agregar":
                    try {
                        Ventas nuevaVenta = new Ventas();
                        nuevaVenta.setTipoProducto(request.getParameter("txtTipoProducto"));
                        nuevaVenta.setNumeroSerie(request.getParameter("txtNumeroSerie"));
                        nuevaVenta.setFechaVenta(Date.valueOf(request.getParameter("dtFechaVenta")));
                        nuevaVenta.setMonto(Double.parseDouble(request.getParameter("txtMonto")));
                        nuevaVenta.setEstado(request.getParameter("txtEstado"));
//                        nuevaVenta.setCodigoCliente(parseIntSafe(request.getParameter("txtCodigoCliente")));
//                        nuevaVenta.setCodigoEmpleado(parseIntSafe(request.getParameter("txtCodigoEmpleado")));
//                        nuevaVenta.setCodigoMetodoPago(parseIntSafe(request.getParameter("txtCodigoMetodoPago")));
                        ventasDao.agregar(nuevaVenta);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                    return;

                case "Editar":
                    //codVentas = parseIntSafe(request.getParameter("codigoVenta"));
                    Ventas v = ventasDao.listaCodigoVenta(codVentas);
                    request.setAttribute("ventaEdit", v); 
                    break;

                case "Actualizar":
                    try {
                        Ventas actualizarVenta = new Ventas();
                        actualizarVenta.setCodigoVenta(codVentas);
                        actualizarVenta.setTipoProducto(request.getParameter("txtTipoProducto"));
                        actualizarVenta.setNumeroSerie(request.getParameter("txtNumeroSerie"));
                        actualizarVenta.setFechaVenta(Date.valueOf(request.getParameter("dtFechaVenta")));
                        actualizarVenta.setMonto(Double.parseDouble(request.getParameter("txtMonto")));
                        actualizarVenta.setEstado(request.getParameter("txtEstado"));
//                        actualizarVenta.setCodigoCliente(parseIntsafe(request.getParameter("txtCodigoCliente")));
//                        actualizarVenta.setCodigoEmpleado(parseIntSafe(request.getParameter("txtCodigoEmpleado")));
//                        actualizarVenta.setCodigoMetodoPago(parseIntSafe(request.getParameter("txtCodigoMetodoPago")));
                        ventasDao.actualizar(actualizarVenta);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                    return;

                case "Eliminar":
                   //codVentas = parseIntSafe(request.getParameter("codigoVenta"));
                    ventasDao.eliminar(codVentas);
                    response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                    return;
            }

            request.getRequestDispatcher("Ventas.jsp").forward(request, response);
        }
        

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
