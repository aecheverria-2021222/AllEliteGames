/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author carlo
 */
public class Tiendas {
    private int codigoTienda;
    private int numeroTienda;
    private String direccion;
    private String telefonoTienda;
    private String correoTienda;
    private String horarioApertura;
    private String horarioCierre;
    private String estado;
    private int codigoEmpleado;

    public Tiendas() {
    }

    public Tiendas(int codigoTienda, int numeroTienda, String direccion, String telefonoTienda, String correoTienda, String horarioApertura, String horarioCierre, String estado, int codigoEmpleado) {
        this.codigoTienda = codigoTienda;
        this.numeroTienda = numeroTienda;
        this.direccion = direccion;
        this.telefonoTienda = telefonoTienda;
        this.correoTienda = correoTienda;
        this.horarioApertura = horarioApertura;
        this.horarioCierre = horarioCierre;
        this.estado = estado;
        this.codigoEmpleado = codigoEmpleado;
    }

    public int getCodigoTienda() {
        return codigoTienda;
    }

    public void setCodigoTienda(int codigoTienda) {
        this.codigoTienda = codigoTienda;
    }

    public int getNumeroTienda() {
        return numeroTienda;
    }

    public void setNumeroTienda(int numeroTienda) {
        this.numeroTienda = numeroTienda;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefonoTienda() {
        return telefonoTienda;
    }

    public void setTelefonoTienda(String telefonoTienda) {
        this.telefonoTienda = telefonoTienda;
    }

    public String getCorreoTienda() {
        return correoTienda;
    }

    public void setCorreoTienda(String correoTienda) {
        this.correoTienda = correoTienda;
    }

    public String getHorarioApertura() {
        return horarioApertura;
    }

    public void setHorarioApertura(String horarioApertura) {
        this.horarioApertura = horarioApertura;
    }

    public String getHorarioCierre() {
        return horarioCierre;
    }

    public void setHorarioCierre(String horarioCierre) {
        this.horarioCierre = horarioCierre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(int codigoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
    }

   
}
