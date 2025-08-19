package modelo;


public class Cliente {
    private int codigoCliente;
    private String DPICliente;
    private String nombresCliente;
    private String correoCliente;
    private String direccionCliente;
    private String estado;
    
    public Cliente() {
    }

    public Cliente (int codigoCliente, String DPICliente, String nombresCliente, String correoCliente,String direccionCliente, String estado) {
        this.codigoCliente = codigoCliente;
        this.DPICliente = DPICliente;
        this.nombresCliente = nombresCliente;
        this.correoCliente = correoCliente;
        this.direccionCliente = direccionCliente;
        this.estado = estado;
    }

    public int getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(int codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public String getDPICliente() {
        return DPICliente;
    }

    public void setDPICliente(String DPICliente) {
        this.DPICliente = DPICliente;
    }

    public String getNombresCliente() {
        return nombresCliente;
    }

    public void setNombresCliente(String nombresCliente) {
        this.nombresCliente = nombresCliente;
    }
    
    public String getCorreoCliente() {
        return correoCliente;
    }

    public void setCorreoCliente(String correoCliente) {
        this.correoCliente = correoCliente;
    }
    
    

    public String getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(String direccionCliente) {
        this.direccionCliente = direccionCliente;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
