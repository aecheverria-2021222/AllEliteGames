package modelo;


public class MetodoPago {
    private int codigoMetodoPago;
    private String nombreMetodo;
    private String descripcionMetodo;
    private double comision;
    private String estado;

    public MetodoPago() {
    }

    public MetodoPago(int codigoMetodoPago, String nombreMetodo, String descripcionMetodo, double comision, String estado) {
        this.codigoMetodoPago = codigoMetodoPago;
        this.nombreMetodo = nombreMetodo;
        this.descripcionMetodo = descripcionMetodo;
        this.comision = comision;
        this.estado = estado;
    }

    public int getCodigoMetodoPago() {
        return codigoMetodoPago;
    }

    public void setCodigoMetodoPago(int codigoMetodoPago) {
        this.codigoMetodoPago = codigoMetodoPago;
    }

    public String getNombreMetodo() {
        return nombreMetodo;
    }

    public void setNombreMetodo(String nombreMetodo) {
        this.nombreMetodo = nombreMetodo;
    }

    public String getDescripcionMetodo() {
        return descripcionMetodo;
    }

    public void setDescripcionMetodo(String descripcionMetodo) {
        this.descripcionMetodo = descripcionMetodo;
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
