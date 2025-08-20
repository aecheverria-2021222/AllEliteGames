package modelo;

public class Videojuego {
    private int codigoVideojuego;
    private String nombreVideojuego;
    private double precioVideojuego;
    private int stockVideojuego;
    private String desarrollador;
    private String estado;
    private int codigoGenero;
    private int codigoProveedor;

    public Videojuego() {
    }

    public Videojuego(int codigoVideojuego, String nombreVideojuego, double precioVideojuego, int stockVideojuego,
                      String desarrollador, String estado, int codigoGenero, int codigoProveedor) {
        this.codigoVideojuego = codigoVideojuego;
        this.nombreVideojuego = nombreVideojuego;
        this.precioVideojuego = precioVideojuego;
        this.stockVideojuego = stockVideojuego;
        this.desarrollador = desarrollador;
        this.estado = estado;
        this.codigoGenero = codigoGenero;
        this.codigoProveedor = codigoProveedor;
    }

    public int getCodigoVideojuego() {
        return codigoVideojuego;
    }

    public void setCodigoVideojuego(int codigoVideojuego) {
        this.codigoVideojuego = codigoVideojuego;
    }

    public String getNombreVideojuego() {
        return nombreVideojuego;
    }

    public void setNombreVideojuego(String nombreVideojuego) {
        this.nombreVideojuego = nombreVideojuego;
    }

    public double getPrecioVideojuego() {
        return precioVideojuego;
    }

    public void setPrecioVideojuego(double precioVideojuego) {
        this.precioVideojuego = precioVideojuego;
    }

    public int getStockVideojuego() {
        return stockVideojuego;
    }

    public void setStockVideojuego(int stockVideojuego) {
        this.stockVideojuego = stockVideojuego;
    }

    public String getDesarrollador() {
        return desarrollador;
    }

    public void setDesarrollador(String desarrollador) {
        this.desarrollador = desarrollador;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCodigoGenero() {
        return codigoGenero;
    }

    public void setCodigoGenero(int codigoGenero) {
        this.codigoGenero = codigoGenero;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }
}
