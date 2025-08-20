package modelo;

public class Membresia {
    private int codigoMembresia;
    private String numeroMembresia;
    private String tipoMembresia;
    private String precioMembresia;
    private String beneficios;
    private String estado;
    private int codigoCliente;
    
    public Membresia() {
    }
    
    public Membresia(int codigoMembresia, String numeroMembresia, String tipoMembresia, String precioMembresia, String beneficios, String estado, int codigoCliente){
        this.codigoMembresia = codigoMembresia;
        this.numeroMembresia = numeroMembresia;
        this.tipoMembresia = tipoMembresia;
        this.precioMembresia = precioMembresia;
        this.beneficios = beneficios;
        this.estado = estado;
        this.codigoCliente = codigoCliente;
    }

    public int getCodigoMembresia() {
        return codigoMembresia;
    }

    public void setCodigoMembresia(int codigoMembresia) {
        this.codigoMembresia = codigoMembresia;
    }

    public String getNumeroMembresia() {
        return numeroMembresia;
    }

    public void setNumeroMembresia(String numeroMembresia) {
        this.numeroMembresia = numeroMembresia;
    }

    public String getTipoMembresia() {
        return tipoMembresia;
    }

    public void setTipoMembresia(String tipoMembresia) {
        this.tipoMembresia = tipoMembresia;
    }

    public String getPrecioMembresia() {
        return precioMembresia;
    }

    public void setPrecioMembresia(String precioMembresia) {
        this.precioMembresia = precioMembresia;
    }

    public String getBeneficios() {
        return beneficios;
    }

    public void setBeneficios(String beneficios) {
        this.beneficios = beneficios;
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
}