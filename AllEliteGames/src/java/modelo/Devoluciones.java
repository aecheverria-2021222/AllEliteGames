package modelo;

import java.util.Date;

public class Devoluciones {
    private int codigoDevolucion;
    private Date fechaSolicitud;
    private Date fechaDevolucion;
    private String motivo;
    private String estado;
    private int codigoVenta;

    public Devoluciones() {
    }

    public Devoluciones(int codigoDevolucion, Date fechaSolicitud, Date fechaDevolucion, String motivo, String estado, int codigoVenta) {
        this.codigoDevolucion = codigoDevolucion;
        this.fechaSolicitud = fechaSolicitud;
        this.fechaDevolucion = fechaDevolucion;
        this.motivo = motivo;
        this.estado = estado;
        this.codigoVenta = codigoVenta;
    }

    public int getCodigoDevolucion() {
        return codigoDevolucion;
    }

    public void setCodigoDevolucion(int codigoDevolucion) {
        this.codigoDevolucion = codigoDevolucion;
    }

    public Date getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Date fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public Date getFechaDevolucion() {
        return fechaDevolucion;
    }

    public void setFechaDevolucion(Date fechaDevolucion) {
        this.fechaDevolucion = fechaDevolucion;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }
}
