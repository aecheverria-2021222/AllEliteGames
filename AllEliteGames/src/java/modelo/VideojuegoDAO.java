package modelo;
 
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
 
public class VideojuegoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    // METODOS DEL CRUD
    // LISTAR
    public List listar(){
        String sql = "select * from videojuego";
        List<Videojuego> listaVideojuego = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Videojuego vd = new Videojuego();
                vd.setCodigoVideojuego(rs.getInt(1));
                vd.setNombreVideojuego(rs.getString(2));
                vd.setPrecioVideojuego(rs.getDouble(3));
                vd.setStockVideojuego(rs.getInt(4));
                vd.setDesarrollador(rs.getString(5));
                vd.setCodigoGenero(rs.getInt(6));
                vd.setCodigoProveedor(rs.getInt(7));
                vd.setEstado(rs.getString(8));
                listaVideojuego.add(vd);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaVideojuego;
    }
    //AGREGAR
    public int agregar(Videojuego vid){
        String sql = "Insert into Videojuego (nombreVideojuego, precioVideojugo, stockVideojuego, desarrollador, codigoGenero, codigoProveedor, estado) values (?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(2, vid.getNombreVideojuego());
            ps.setDouble(3, vid.getPrecioVideojuego());
            ps.setInt(4, vid.getStockVideojuego());
            ps.setString(5, vid.getDesarrollador());
            ps.setString(6, vid.getEstado());
            ps.setInt(7, vid.getCodigoGenero());
            ps.setInt(8, vid.getCodigoProveedor());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp; 
    }

    //BUSCAR POR CODIGO
    public Videojuego listarCodigoVideojuego(int cd){
        //Instanciar un objeto de tipo empleado
        Videojuego vid = new Videojuego();
        String sql = "select * from Videojuego where Videojuego = "+cd;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                vid.setNombreVideojuego(rs.getString(2));
                vid.setPrecioVideojuego(rs.getDouble(3));
                vid.setStockVideojuego(rs.getInt(4));
                vid.setDesarrollador(rs.getString(5));
                vid.setEstado(rs.getString(6));
                vid.setCodigoGenero(rs.getInt(7));
                vid.setCodigoProveedor(rs.getInt(8));

            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return vid;
    }
    //ACTUALIZAR - funcion
    public int actualizar(Videojuego vid){
        String sql = "Update Videojuego set nombresVideojuego = ?, precioVideojuego = ?, stockVideojuego = ?, desarrollador = ?, codigoGenero = ?, codigoProveedor = ?, estado = ? where codigoVideojuego = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, vid.getNombreVideojuego());
            ps.setDouble(2, vid.getPrecioVideojuego());
            ps.setInt(3, vid.getStockVideojuego());
            ps.setString(4, vid.getDesarrollador());
            ps.setString(5, vid.getEstado());
            ps.setInt(7, vid.getCodigoVideojuego());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }

    //ELIMINAR - metodo
    public void eliminar(int id){
        String sql = "Delete from videojuego where codigoVideojuego = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}