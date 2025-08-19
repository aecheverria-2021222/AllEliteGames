package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ConsolaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    //MÉTODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql ="select * from Consolas";
        List<Consola> listaConsola = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Consola co = new Consola();
                co.setCodigoConsola(rs.getInt(1));
                co.setNombreConsola(rs.getString(2));
                co.setPrecioConsola(rs.getDouble(3));
                co.setStockConsola(rs.getInt(4));
                co.setMarca(rs.getString(5));
                co.setFechaLanzamiento(rs.getDate(6));
                co.setEstado(rs.getString(7));
                co.setCodigoProveedor(rs.getInt(8));
                listaConsola.add(co);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaConsola;
    }
    
    //AGREGAR
    public int agregar(Consola co){
        String sql = "insert into Consolas (nombreConsola, precioConsola, stockConsola, marca, fechaLanzamiento, estado, codigoProveedor) values (?, ?, ?, ?, ?, ?, ?)";
        try{
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setString(1, co.getNombreConsola());
            ps.setDouble(2, co.getPrecioConsola());
            ps.setInt(3, co.getStockConsola());
            ps.setString(4, co.getMarca());
            ps.setDate(5, co.getFechaLanzamiento());
            ps.setString(6, co.getEstado());
            ps.setInt(7, co.getCodigoProveedor());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return resp;
    }

    //BUSCAR POR CÓDIGO
    public Consola listarCodigoConsola(int id){
        //Instanciar un objeto de tipo Consola
        Consola co = new Consola();
        String sql = "Select * from Consolas where codigoConsola ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                co.setNombreConsola(rs.getString(2));
                co.setPrecioConsola(rs.getDouble(3));
                co.setStockConsola(rs.getInt(4));
                co.setMarca(rs.getString(5));
                co.setFechaLanzamiento(rs.getDate(6));
                co.setEstado(rs.getString(7));
                co.setCodigoProveedor(rs.getInt(8));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return co;
    }
    //ACTUALIZAR
    public int actualizar(Consola co){
        String sql = "Update Consolas set nombreConsola = ?, precioConsola = ?, stockConsola = ?,  marca = ?, fechaLanzamiento = ?, estado = ? where codigoConsola = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, co.getNombreConsola());
            ps.setDouble(2, co.getPrecioConsola());
            ps.setInt(3, co.getStockConsola());
            ps.setString(4, co.getMarca());
            ps.setDate(5, co.getFechaLanzamiento());
            ps.setString(6, co.getEstado());
            ps.setInt(7, co.getCodigoConsola());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return resp;
    }

    //ELIMINAR
    public void eliminar(int id){
        String sql = "delete from Consolas where codigoConsola = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
