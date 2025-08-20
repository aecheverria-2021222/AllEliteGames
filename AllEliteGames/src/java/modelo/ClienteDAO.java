package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ClienteDAO {
Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public Cliente buscar(String dpi){
        Cliente cl = new Cliente();
        String sql = "Select * from Cliente where DPICliente ="+dpi;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cl.setCodigoCliente(rs.getInt(1));
                cl.setDPICliente(rs.getString(2));
                cl.setNombresCliente(rs.getString(3));
                cl.setCorreoCliente(rs.getString(4));
                cl.setDireccionCliente(rs.getString(5));
                cl.setEstado(rs.getString(6));
            
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cl;
    }
    
    //METODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql ="select*from cliente";
        List<Cliente> listaCliente = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Cliente cl = new Cliente();
                cl.setCodigoCliente(rs.getInt(1));
                cl.setDPICliente(rs.getString(2));
                cl.setNombresCliente(rs.getString(3));
                cl.setCorreoCliente(rs.getString(4));
                cl.setDireccionCliente(rs.getString(5));
                cl.setEstado(rs.getString(6));
                listaCliente.add(cl);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaCliente;
    }
    
    //AGREGAR
    public int agregar(Cliente cl){
        String sql = "insert into Cliente (DPICliente, nombresCliente, correoCliente ,direccionCliente,estado) values (?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getDPICliente());
            ps.setString(2, cl.getNombresCliente());
            ps.setString(3, cl.getCorreoCliente());
            ps.setString(4, cl.getDireccionCliente());
            ps.setString(5, cl.getEstado());
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    //BUSCAR POR CODIGO
    public Cliente listarCodigoCliente(int id){
        //Instanciar un objeto de tipo Cliente
        Cliente cl = new Cliente();
        String sql = "Select * from Cliente where codigoCliente ="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cl.setDPICliente(rs.getString(2));
                cl.setNombresCliente(rs.getString(3));
                cl.setCorreoCliente(rs.getString(4));
                cl.setDireccionCliente(rs.getString(5));
                cl.setEstado(rs.getString(6));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return cl;
    }
    
    //ACTUALIZAR
    public int actualizar(Cliente cl){
        String sql = "Update Cliente set DPICliente = ?, nombresCliente = ?, correoCliente = ?, direccionCliente = ?, estado = ? where codigoCliente = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getDPICliente());
            ps.setString(2, cl.getNombresCliente());
            ps.setString(3, cl.getCorreoCliente());
            ps.setString(4, cl.getDireccionCliente());
            ps.setString(5, cl.getEstado());
            ps.setInt(6, cl.getCodigoCliente());
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    
    //ELIMINAR
    public void eliminar(int id){
        String sql = "delete from cliente where codigoCliente = "+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
