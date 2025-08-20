/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Genero;
import modelo.GeneroDAO;
import modelo.Suscripcion;
import modelo.SuscripcionDAO;
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
    Videojuego videojuego = new Videojuego();
    VideojuegoDAO videojuegoDao = new VideojuegoDAO();
    Suscripcion suscripcion = new Suscripcion();
    SuscripcionDAO suscripcionDao = new SuscripcionDAO();
    int codVideojuego;
    int codEmpleado;
    int codSuscripcion;

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
        if (menu != null && menu.equals("Principal")) {
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        } else if (menu != null && menu.equals("Clientes")) {
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);
        }else if (menu.equals("Empleado")){
            switch(accion){
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
        } else if (menu != null && menu.equals("genero")) {
            switch (accion) {
                case "Listar":
                    List listaGeneros = generoDao.listar();
                    request.setAttribute("generos", listaGeneros);
                    break;
                case "Agregar":
                    String genero = request.getParameter("txtGenero");
                    String edadRecomendable = request.getParameter("txtEdadRecomendable");
                    String popularidad = request.getParameter("txtPopularidad");
                    String publicoObjetivo = request.getParameter("txtPublicoObjetivo");
                    String Estado = request.getParameter("txtEstado");
                    break;
               
            }
        request.getRequestDispatcher("Genero.jsp").forward(request, response);
        
        }else if (menu.equals("Videojuego")){
            
        switch(accion){
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
        }else if(menu.equals("Suscripcion")){
            switch(accion){
                case "Listar":
                    List listaSuscripciones = suscripcionDao.listarSuscripcion();
                    request.setAttribute("suscripciones", listaSuscripciones);
                break;
                
                case "Agregar":                  
                        String fechaSus = request.getParameter("dtFechaSuscripcion");
                        String fechaFi = request.getParameter("dtFechaFin");
                        String tipoSus = request.getParameter("txtTipoSuscripcion");
                        String est = request.getParameter("cmbEstado");
                        String codClient = request.getParameter("txtCodigoCliente");
                        String codVideoj = request.getParameter("txtCodigoVideojuego");
                        
                        if(fechaSus.isEmpty()|| fechaFi.isEmpty() || tipoSus.isEmpty() || est.isEmpty() ||
                                codClient.isEmpty()|| codVideoj.isEmpty()){
                            
                            request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                            request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                            
                            request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);   
                            return;
                         }//if de campos vacíos
                        
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
                   
                    if(fechaSuscri.isEmpty()|| fecFin.isEmpty() || tipSuscri.isEmpty() || esta.isEmpty()){
                            
                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("suscripciones", suscripcionDao.listarSuscripcion());
                        request.getRequestDispatcher("Suscripcion.jsp").forward(request, response);
                        return;
                    }//if de campos vacíos
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
