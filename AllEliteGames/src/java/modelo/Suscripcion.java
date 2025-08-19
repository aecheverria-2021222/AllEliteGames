package modelo;

import java.util.Date;


public class Suscripcion {
    private int codigoSuscripcion;
    private Date fechaSuscripcion;
    private Date fechaFin;
    private String tipoSuscripcion;
    private String estado;
    private int codigoCliente;
    private int codigoVideojuego;

    public Suscripcion() {
    }

    public Suscripcion(int codigoSuscripcion, Date fechaSuscripcion, Date fechaFin, String tipoSuscripcion, String estado, int codigoCliente, int codigoVideojuego) {
        this.codigoSuscripcion = codigoSuscripcion;
        this.fechaSuscripcion = fechaSuscripcion;
        this.fechaFin = fechaFin;
        this.tipoSuscripcion = tipoSuscripcion;
        this.estado = estado;
        this.codigoCliente = codigoCliente;
        this.codigoVideojuego = codigoVideojuego;
    }

    public int getCodigoSuscripcion() {
        return codigoSuscripcion;
    }

    public void setCodigoSuscripcion(int codigoSuscripcion) {
        this.codigoSuscripcion = codigoSuscripcion;
    }

    public Date getFechaSuscripcion() {
        return fechaSuscripcion;
    }

    public void setFechaSuscripcion(Date fechaSuscripcion) {
        this.fechaSuscripcion = fechaSuscripcion;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getTipoSuscripcion() {
        return tipoSuscripcion;
    }

    public void setTipoSuscripcion(String tipoSuscripcion) {
        this.tipoSuscripcion = tipoSuscripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(int codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public int getCodigoVideojuego() {
        return codigoVideojuego;
    }

    public void setCodigoVideojuego(int codigoVideojuego) {
        this.codigoVideojuego = codigoVideojuego;
    }
    
    
}
