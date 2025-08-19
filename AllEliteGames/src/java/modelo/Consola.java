package modelo;

import java.sql.Date;

public class Consola {
    private int codigoConsola;
    private String nombreConsola;
    private Double precioConsola;
    private int stockConsola;
    private String marca;
    private Date fechaLanzamiento;
    private String estado;
    private int codigoProveedor;

    public Consola() {
    }

    public Consola(int codigoConsola, String nombreConsola, Double precioConsola, int stockConsola, String marca, Date fechaLanzamiento, String estado, int codigoProveedor) {
        this.codigoConsola = codigoConsola;
        this.nombreConsola = nombreConsola;
        this.precioConsola = precioConsola;
        this.stockConsola = stockConsola;
        this.marca = marca;
        this.fechaLanzamiento = fechaLanzamiento;
        this.estado = estado;
        this.codigoProveedor = codigoProveedor;
    }

    public int getCodigoConsola() {
        return codigoConsola;
    }

    public void setCodigoConsola(int codigoConsola) {
        this.codigoConsola = codigoConsola;
    }

    public String getNombreConsola() {
        return nombreConsola;
    }

    public void setNombreConsola(String nombreConsola) {
        this.nombreConsola = nombreConsola;
    }

    public Double getPrecioConsola() {
        return precioConsola;
    }

    public void setPrecioConsola(Double precioConsola) {
        this.precioConsola = precioConsola;
    }

    public int getStockConsola() {
        return stockConsola;
    }

    public void setStockConsola(int stockConsola) {
        this.stockConsola = stockConsola;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Date getFechaLanzamiento() {
        return fechaLanzamiento;
    }

    public void setFechaLanzamiento(Date fechaLanzamiento) {
        this.fechaLanzamiento = fechaLanzamiento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }
    
}
