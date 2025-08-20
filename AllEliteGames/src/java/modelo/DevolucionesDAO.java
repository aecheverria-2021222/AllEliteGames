package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DevolucionesDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List listar() {
        String sql = "select * from Devolucion";
        List<Devoluciones> listaDevolucion = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Devoluciones dev = new Devoluciones();
                dev.setCodigoDevolucion(rs.getInt(1));
                dev.setFechaSolicitud(rs.getDate(2));
                dev.setFechaDevolucion(rs.getDate(3));
                dev.setMotivo(rs.getString(4));
                dev.setEstado(rs.getString(5));
                dev.setCodigoVenta(rs.getInt(6));
                listaDevolucion.add(dev);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaDevolucion;
    }

    public int agregar(Devoluciones de) {
        String sql = "insert into Devolucion(fechaSolicitud, fechaDevolucion, motivo, estado, codigoVenta) values(?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(de.getFechaSolicitud().getTime()));
            ps.setDate(2, new java.sql.Date(de.getFechaDevolucion().getTime()));
            ps.setString(3, de.getMotivo());
            ps.setString(4, de.getEstado());
            ps.setInt(5, de.getCodigoVenta());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public Devoluciones buscar(int id) {
        Devoluciones dev = new Devoluciones();
        String sql = "select * from Devolucion where codigoDevolucion =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                dev.setCodigoDevolucion(rs.getInt(1));
                dev.setFechaSolicitud(rs.getDate(2));
                dev.setFechaDevolucion(rs.getDate(3));
                dev.setMotivo(rs.getString(4));
                dev.setEstado(rs.getString(5));
                dev.setCodigoVenta(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dev;
    }

    public int actualizar(Devoluciones dev) {
        String sql = "update Devolucion set fechaSolicitud = ?, fechaDevolucion = ?, motivo = ?, estado = ? where codigoDevolucion = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(dev.getFechaSolicitud().getTime()));
            ps.setDate(2, new java.sql.Date(dev.getFechaDevolucion().getTime()));
            ps.setString(3, dev.getMotivo());
            ps.setString(4, dev.getEstado());
            ps.setInt(5, dev.getCodigoDevolucion());
            // Asigna el resultado a la variable resp
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public void eliminar(int id) {
        String sql = "delete from Devolucion where codigoDevolucion =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
