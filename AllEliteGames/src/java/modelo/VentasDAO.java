package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VentasDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<Ventas> listar() {
        List<Ventas> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            String sql = "select * from Ventas";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ventas v = new Ventas();
                v.setCodigoVenta(rs.getInt("codigoVenta"));
                v.setTipoProducto(rs.getString("tipoProducto"));
                v.setNumeroSerie(rs.getString("numeroSerie"));
                v.setFechaVenta(rs.getDate("fechaVenta"));
                v.setMonto(rs.getDouble("monto"));
                v.setEstado(rs.getString("estado"));
                v.setCodigoCliente(rs.getInt("codigoCliente"));
                v.setCodigoEmpleado(rs.getInt("codigoEmpleado"));
                v.setCodigoMetodoPago(rs.getInt("codigoMetodoPago"));
                lista.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public int agregar(Ventas ven) {
        resp = 0;
        String sql = "insert into Ventas (tipoProducto, numeroSerie, fechaVenta, monto, estado, codigoCliente, codigoEmpleado, codigoMetodoPago) VALUES (?,?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, ven.getTipoProducto());
            ps.setString(2, ven.getNumeroSerie());
            ps.setDate(3, ven.getFechaVenta());
            ps.setDouble(4, ven.getMonto());
            ps.setString(5, ven.getEstado());
            ps.setInt(6, ven.getCodigoCliente());
            ps.setInt(7, ven.getCodigoEmpleado());
            ps.setInt(8, ven.getCodigoMetodoPago());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public Ventas listaCodigoVenta(int id) {
        Ventas vent = new Ventas();
        String sql = "select * from Ventas where codigoVenta=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                vent.setCodigoVenta(rs.getInt("codigoVenta"));
                vent.setTipoProducto(rs.getString("tipoProducto"));
                vent.setNumeroSerie(rs.getString("numeroSerie"));
                vent.setFechaVenta(rs.getDate("fechaVenta"));
                vent.setMonto(rs.getDouble("monto"));
                vent.setEstado(rs.getString("estado"));
                vent.setCodigoCliente(rs.getInt("codigoCliente"));
                vent.setCodigoEmpleado(rs.getInt("codigoEmpleado"));
                vent.setCodigoMetodoPago(rs.getInt("codigoMetodoPago"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vent;
    }

    public int actualizar(Ventas vent) {
        resp = 0;
        String sql = "update Ventas set tipoProducto=?, numeroSerie=?, fechaVenta=?, monto=?, estado=?, codigoCliente=?, codigoEmpleado=?, codigoMetodoPago=? WHERE codigoVenta=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, vent.getTipoProducto());
            ps.setString(2, vent.getNumeroSerie());
            ps.setDate(3, vent.getFechaVenta());
            ps.setDouble(4, vent.getMonto());
            ps.setString(5, vent.getEstado());
            ps.setInt(6, vent.getCodigoCliente());
            ps.setInt(7, vent.getCodigoEmpleado());
            ps.setInt(8, vent.getCodigoMetodoPago());
            ps.setInt(9, vent.getCodigoVenta());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public void eliminar(int id) {
    System.out.println("Eliminación de ventas está deshabilitada. No se puede eliminar el registro con id: " + id);
    }

}
