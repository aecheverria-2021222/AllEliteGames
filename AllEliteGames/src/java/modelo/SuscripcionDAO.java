package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class SuscripcionDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    
    //CRUD
    
    //LISTAR
    public List listarSuscripcion(){
        String sql = "select * from Suscripciones";
        List<Suscripcion> listaSuscripcion = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Suscripcion sus = new Suscripcion();
                sus.setCodigoSuscripcion(rs.getInt(1));
                sus.setFechaSuscripcion(rs.getDate(2));
                sus.setFechaFin(rs.getDate(3));
                sus.setTipoSuscripcion(rs.getString(4));
                sus.setEstado(rs.getString(5));
                sus.setCodigoCliente(rs.getInt(6));
                sus.setCodigoVideojuego(rs.getInt(7));
                listaSuscripcion.add(sus);
            }//while Listar Suscripciones
        }catch(Exception e){
            e.printStackTrace();
        }//try-catch
        
        return listaSuscripcion;
        
    }//listarSuscripcion
    
    
    //AGREGAR
    public int agregar(Suscripcion sus){
        String sql = "insert into Suscripciones(fechaSuscripcion, fechaFin, tipoSuscripcion, estado, codigoCliente, codigoVideojuego) values(?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(sus.getFechaSuscripcion().getTime()));
            ps.setDate(2, new java.sql.Date(sus.getFechaFin().getTime()));
            ps.setString(3, sus.getTipoSuscripcion());
            ps.setString(4, sus.getEstado());
            ps.setInt(5,sus.getCodigoCliente());
            ps.setInt(6, sus.getCodigoVideojuego());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }//try-catch
         return resp;
    }//agregar
    
    
    //BUSCAR
    public Suscripcion buscar(int id){
        Suscripcion sus = new Suscripcion();
        String sql = "select * from Suscripciones where codigoSuscripcion ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                sus.setCodigoSuscripcion(rs.getInt(1));
                sus.setFechaSuscripcion(rs.getDate(2));
                sus.setFechaFin(rs.getDate(3));
                sus.setTipoSuscripcion(rs.getString(4));
                sus.setEstado(rs.getString(5));
                sus.setCodigoCliente(rs.getInt(6));
                sus.setCodigoVideojuego(rs.getInt(7));
            }//while de buscar suscripcion por código
        }catch(Exception e){
            e.printStackTrace();
        }//try-catch
        
        return sus;
    }//buscar
    
    
    //ACTUALIZAR
    public int actualizar(Suscripcion sus){
        String sql = "update Suscripciones set fechaSuscripcion = ?, fechaFin = ?, tipoSuscripcion = ?, estado = ? where codigoSuscripcion = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(sus.getFechaSuscripcion().getTime()));
            ps.setDate(2, new java.sql.Date(sus.getFechaFin().getTime()));
            ps.setString(3, sus.getTipoSuscripcion());
            ps.setString(4, sus.getEstado());
            ps.setInt(5, sus.getCodigoSuscripcion());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }//try-catch
        return resp;
    }//actualizar
    
    
    //ELIMINAR
    public void eliminar(int id){
        String sql = "delete from Suscripciones where codigoSuscripcion ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }//try-catch
    }//eliminar
    
}//SuscripcionDAO

