
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MetodoPagoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public MetodoPago buscar(String codigoPago){
        MetodoPago mt = new MetodoPago();
        String sql = "Select * from MetodosPago where codigoMetodoPago ="+codigoPago;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                mt.setCodigoMetodoPago(rs.getInt(1));
                mt.setNombreMetodo(rs.getString(2));
                mt.setDescripcionMetodo(rs.getString(3));
                mt.setComision(rs.getDouble(4));
                mt.setEstado(rs.getString(5));
            
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mt;
    }
    
    //METODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql ="select*from metodosPago";
        List<MetodoPago> listaMetodoPago = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                MetodoPago mt = new MetodoPago();
                mt.setCodigoMetodoPago(rs.getInt(1));
                mt.setNombreMetodo(rs.getString(2));
                mt.setDescripcionMetodo(rs.getString(3));
                mt.setComision(rs.getDouble(4));
                mt.setEstado(rs.getString(5));
                listaMetodoPago.add(mt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaMetodoPago;
    }
    
    //AGREGAR
    public int agregar(MetodoPago mt){
        String sql = "insert into MetodosPago (nombreMetodo, descripcionMetodo, comision ,estado) values (?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, mt.getNombreMetodo());
            ps.setString(2, mt.getDescripcionMetodo());
            ps.setDouble(3, mt.getComision());
            ps.setString(4, mt.getEstado());
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    //BUSCAR POR CODIGO
    public MetodoPago listarCodigoMetodoPago(int codigoMetodo){
        //Instanciar un objeto de tipo Cliente
        MetodoPago mt = new MetodoPago();
        String sql = "Select * from MetodosPago where codigoMetodoPago ="+codigoMetodo;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                mt.setNombreMetodo(rs.getString(2));
                mt.setDescripcionMetodo(rs.getString(3));
                mt.setComision(rs.getDouble(4));
                mt.setEstado(rs.getString(5));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return mt;
    }
    
    //ACTUALIZAR
    public int actualizar(MetodoPago mt){
        String sql = "Update MetodosPago set nombreMetodo = ?, descripcionMetodo = ?, comision = ?, estado = ? where codigoMetodoPago = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, mt.getNombreMetodo());
            ps.setString(2, mt.getDescripcionMetodo());
            ps.setDouble(3, mt.getComision());
            ps.setString(4, mt.getEstado());
            ps.setInt(5, mt.getCodigoMetodoPago());
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    //ELIMINAR
    public void eliminar(int codigoMetodo){
        String sql = "delete from metodosPago where codigoMetodoPago = "+codigoMetodo;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
