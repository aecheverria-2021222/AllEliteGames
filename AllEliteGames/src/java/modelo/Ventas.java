package modelo;

import java.sql.Date;

public class Ventas {
    private int codigoVenta;
    private String tipoProducto;
    private String numeroSerie;
    private Date fechaVenta;
    private double monto;
    private String estado;
    private int codigoCliente;
    private int codigoEmpleado;
    private int codigoMetodoPago;

    public Ventas() {
    }

    public Ventas(int codigoVenta, String tipoProducto, String numeroSerie, Date fechaVenta, double monto, String estado, int codigoCliente, int codigoEmpleado, int codigoMetodoPago) {
        this.codigoVenta = codigoVenta;
        this.tipoProducto = tipoProducto;
        this.numeroSerie = numeroSerie;
        this.fechaVenta = fechaVenta;
        this.monto = monto;
        this.estado = estado;
        this.codigoCliente = codigoCliente;
        this.codigoEmpleado = codigoEmpleado;
        this.codigoMetodoPago = codigoMetodoPago;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public String getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(String tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
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

    public int getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(int codigoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
    }

    public int getCodigoMetodoPago() {
        return codigoMetodoPago;
    }

    public void setCodigoMetodoPago(int codigoMetodoPago) {
        this.codigoMetodoPago = codigoMetodoPago;
    }
    
    
}
