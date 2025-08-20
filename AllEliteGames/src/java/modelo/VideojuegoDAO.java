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

    // LISTAR
    public List<Videojuego> listar() {
        String sql = "SELECT * FROM videojuegos";
        List<Videojuego> listaVideojuego = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Videojuego vd = new Videojuego();
                vd.setCodigoVideojuego(rs.getInt(1));
                vd.setNombreVideojuego(rs.getString(2));
                vd.setPrecioVideojuego(rs.getDouble(3));
                vd.setStockVideojuego(rs.getInt(4));
                vd.setDesarrollador(rs.getString(5));
                vd.setEstado(rs.getString(6));
                vd.setCodigoGenero(rs.getInt(7));
                vd.setCodigoProveedor(rs.getInt(8));
                listaVideojuego.add(vd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaVideojuego;
    }

    // AGREGAR
    public int agregar(Videojuego vid) {
        String sql = "INSERT INTO videojuegos (nombreVideojuego, precioVideojuego, stockVideojuego, desarrollador, estado, codigoGenero, codigoProveedor) VALUES (?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, vid.getNombreVideojuego());
            ps.setDouble(2, vid.getPrecioVideojuego());
            ps.setInt(3, vid.getStockVideojuego());
            ps.setString(4, vid.getDesarrollador());
            ps.setString(5, vid.getEstado());
            ps.setInt(6, vid.getCodigoGenero());
            ps.setInt(7, vid.getCodigoProveedor());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // BUSCAR POR CODIGO
    public Videojuego listarCodigoVideojuego(int cd) {
        Videojuego vid = new Videojuego();
        String sql = "SELECT * FROM videojuegos WHERE codigoVideojuego = " + cd;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                vid.setCodigoVideojuego(rs.getInt(1));
                vid.setNombreVideojuego(rs.getString(2));
                vid.setPrecioVideojuego(rs.getDouble(3));
                vid.setStockVideojuego(rs.getInt(4));
                vid.setDesarrollador(rs.getString(5));
                vid.setEstado(rs.getString(6));
                vid.setCodigoGenero(rs.getInt(7));
                vid.setCodigoProveedor(rs.getInt(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vid;
    }

    // ACTUALIZAR
    public int actualizar(Videojuego vid) {
        String sql = "UPDATE videojuegos SET nombreVideojuego = ?, precioVideojuego = ?, stockVideojuego = ?, desarrollador = ?, estado = ?, codigoGenero = ?, codigoProveedor = ? WHERE codigoVideojuego = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, vid.getNombreVideojuego());
            ps.setDouble(2, vid.getPrecioVideojuego());
            ps.setInt(3, vid.getStockVideojuego());
            ps.setString(4, vid.getDesarrollador());
            ps.setString(5, vid.getEstado());
            ps.setInt(6, vid.getCodigoGenero());
            ps.setInt(7, vid.getCodigoProveedor());
            ps.setInt(8, vid.getCodigoVideojuego());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ELIMINAR
    public void eliminar(int id) {
        String sql = "DELETE FROM videojuegos WHERE codigoVideojuego = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
