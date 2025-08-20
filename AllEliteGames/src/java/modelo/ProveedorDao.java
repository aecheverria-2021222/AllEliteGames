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

    // ---- Validar correo básico ----
    private boolean validarCorreo(String correo) {
        return correo != null && correo.matches("^(.+)@(.+)\\.(.+)$");
    }

    // ---- Validar teléfono ----
    private boolean validarTelefono(String telefono) {
        return telefono != null && telefono.matches("\\d{1,8}");
    }

    // ---- Agregar nuevo proveedor ----
    public String agregar(Proveedor prov) {
        if (prov.getNombresProveedor() == null || prov.getNombresProveedor().isEmpty())
            return "El nombre del proveedor es obligatorio.";
        if (!validarTelefono(prov.getTelefonoProveedor()))
            return "El teléfono debe contener máximo 8 números.";
        if (!validarCorreo(prov.getCorreoProveedor()))
            return "El correo electrónico no es válido.";
        if (prov.getDireccion() == null || prov.getDireccion().isEmpty())
            return "La dirección es obligatoria.";
        if (prov.getEstado() == null || prov.getEstado().isEmpty())
            return "El estado es obligatorio.";

        String sql = "insert into Proveedor (nombresProveedor, telefonoProveedor, correoProveedor, direccion, estado) VALUES (?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, prov.getNombresProveedor());
            ps.setString(2, prov.getTelefonoProveedor());
            ps.setString(3, prov.getCorreoProveedor());
            ps.setString(4, prov.getDireccion());
            ps.setString(5, prov.getEstado());
            int resp = ps.executeUpdate();
            return (resp > 0) ? "Proveedor agregado correctamente." : "No se pudo agregar el proveedor.";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error al agregar el proveedor: " + e.getMessage();
        }
    }

    // ---- Buscar proveedor por código ----
    public Proveedor buscar(int cod) {
        Proveedor prov = null;
        String sql = "select * from Proveedor WHERE codigoProveedor = ?";
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
        String sql = "select * from Proveedor";
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
    public String actualizar(Proveedor prov) {
        if (prov.getCodigoProveedor() <= 0) return "Código de proveedor inválido.";
        if (prov.getNombresProveedor() == null || prov.getNombresProveedor().isEmpty())
            return "El nombre del proveedor es obligatorio.";
        if (!validarTelefono(prov.getTelefonoProveedor()))
            return "El teléfono debe contener máximo 8 números.";
        if (!validarCorreo(prov.getCorreoProveedor()))
            return "El correo electrónico no es válido.";
        if (prov.getDireccion() == null || prov.getDireccion().isEmpty())
            return "La dirección es obligatoria.";
        if (prov.getEstado() == null || prov.getEstado().isEmpty())
            return "El estado es obligatorio.";

        String sql = "update Proveedor set nombresProveedor = ?, telefonoProveedor = ?, correoProveedor = ?, direccion = ?, estado = ? WHERE codigoProveedor = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, prov.getNombresProveedor());
            ps.setString(2, prov.getTelefonoProveedor());
            ps.setString(3, prov.getCorreoProveedor());
            ps.setString(4, prov.getDireccion());
            ps.setString(5, prov.getEstado());
            ps.setInt(6, prov.getCodigoProveedor());
            int resp = ps.executeUpdate();
            return (resp > 0) ? "Proveedor actualizado correctamente." : "No se pudo actualizar el proveedor.";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error al actualizar el proveedor: " + e.getMessage();
        }
    }

    // ---- Eliminar proveedor ----
    public String eliminar(int id) {
        if (id <= 0) return "Código de proveedor inválido.";
        String sql = "DELETE FROM Proveedor WHERE codigoProveedor = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int resp = ps.executeUpdate();
            return (resp > 0) ? "Proveedor eliminado correctamente." : "No se pudo eliminar el proveedor.";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error al eliminar el proveedor: " + e.getMessage();
        }
    }
}
