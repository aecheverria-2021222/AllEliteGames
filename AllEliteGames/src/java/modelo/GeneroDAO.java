package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GeneroDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // Listar
    public List listar() {
        String sql = "select * from Generos";
        List<Genero> listaGenero = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Genero gen = new Genero();
                gen.setCodigoGenero(rs.getInt(1));
                gen.setGenero(rs.getString(2));
                gen.setEdadRecomendable(rs.getString(3));
                gen.setPopularidad(rs.getString(4));
                gen.setPublicoObjetivo(rs.getString(5));
                gen.setEstado(rs.getString(6));
                listaGenero.add(gen);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaGenero;
    }

    // Agregar
    public int agregar(Genero ge) {
        String sql = "insert into Generos (genero, edadRecomendable, popularidad, publicoObjetivo, estado) values (?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setString(1, ge.getGenero());
            ps.setString(2, ge.getEdadRecomendable());
            ps.setString(3, ge.getPopularidad());
            ps.setString(4, ge.getPublicoObjetivo());
            ps.setString(5, ge.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // Buscar
    public Genero listarCodigoGenero(int id) {
        Genero ge = new Genero();
        String sql = "Select * from Generos where codigoGenero =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ge.setGenero(rs.getString(2));
                ge.setEdadRecomendable(rs.getString(3));
                ge.setPopularidad(rs.getString(4));
                ge.setPublicoObjetivo(rs.getString(5));
                ge.setEstado(rs.getString(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ge;
    }

    // Actualizar
    public int actualizar(Genero ge) {
         String sql = "Update Generos set genero = ?, edadRecomendable = ?, popularidad = ?, publicoObjetivo = ?, estado = ? where codigoGenero = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, ge.getGenero());
            ps.setString(2, ge.getEdadRecomendable());
            ps.setString(3, ge.getPopularidad());
            ps.setString(4, ge.getPublicoObjetivo());
            ps.setString(5, ge.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // Eliminar
    public void eliminar(int id) {
        String sql = "Delete from Generos where codigoGenero =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}