package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDao {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // ---- Agregar nuevo proveedor ----
    public int agregar(Proveedor prov) {
        String sql = "INSERT INTO Proveedores (nombresProveedor, telefonoProveedor, correoProveedor, direccion, estado) VALUES (?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, prov.getNombresProveedor());
            ps.setString(2, prov.getTelefonoProveedor());
            ps.setString(3, prov.getCorreoProveedor());
            ps.setString(4, prov.getDireccion());
            ps.setString(5, prov.getEstado());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ---- Buscar proveedor por código ----
    public Proveedor buscar(int cod) {
        Proveedor prov = null;
        String sql = "SELECT * FROM Proveedores WHERE codigoProveedor = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cod);
            rs = ps.executeQuery();
            if (rs.next()) {
                prov = new Proveedor();
                prov.setCodigoProveedor(rs.getInt("codigoProveedor"));
                prov.setNombresProveedor(rs.getString("nombresProveedor"));
                prov.setTelefonoProveedor(rs.getString("telefonoProveedor"));
                prov.setCorreoProveedor(rs.getString("correoProveedor"));
                prov.setDireccion(rs.getString("direccion"));
                prov.setEstado(rs.getString("estado"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prov;
    }

    // ---- Listar todos los proveedores ----
    public List<Proveedor> listar() {
        String sql = "SELECT * FROM Proveedores";
        List<Proveedor> listaProveedor = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor prov = new Proveedor();
                prov.setCodigoProveedor(rs.getInt("codigoProveedor"));
                prov.setNombresProveedor(rs.getString("nombresProveedor"));
                prov.setTelefonoProveedor(rs.getString("telefonoProveedor"));
                prov.setCorreoProveedor(rs.getString("correoProveedor"));
                prov.setDireccion(rs.getString("direccion"));
                prov.setEstado(rs.getString("estado"));
                listaProveedor.add(prov);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProveedor;
    }

    // ---- Actualizar proveedor ----
    public int actualizar(Proveedor prov) {
        String sql = "UPDATE Proveedores SET nombresProveedor = ?, telefonoProveedor = ?, correoProveedor = ?, direccion = ?, estado = ? WHERE codigoProveedor = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, prov.getNombresProveedor());
            ps.setString(2, prov.getTelefonoProveedor());
            ps.setString(3, prov.getCorreoProveedor());
            ps.setString(4, prov.getDireccion());
            ps.setString(5, prov.getEstado());
            ps.setInt(6, prov.getCodigoProveedor());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ---- Eliminar proveedor ----
    public void eliminar(int id) {
        String sql = "DELETE FROM Proveedores WHERE codigoProveedor = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
