package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MembresiaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // LISTAR TODAS
    public List<Membresia> listar() {
        String sql = "select * from Membresias";
        List<Membresia> listaMembresias = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Membresia mem = new Membresia();
                mem.setCodigoMembresia(rs.getInt("codigoMembresia"));
                mem.setNumeroMembresia(rs.getString("numeroMembresia"));
                mem.setTipoMembresia(rs.getString("tipoMembresia"));
                mem.setPrecioMembresia(rs.getString("precioMembresia"));
                mem.setBeneficios(rs.getString("beneficios"));
                mem.setEstado(rs.getString("estado"));
                mem.setCodigoCliente(rs.getInt("codigoCliente"));
                listaMembresias.add(mem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaMembresias;
    }

    // AGREGAR NUEVA
    public int agregar(Membresia mem) {
        // Validaciones básicas
        if (mem.getNumeroMembresia() == null || mem.getNumeroMembresia().trim().isEmpty()) {
            System.out.println(" Número de membresía vacío.");
            return 0;
        }
        if (mem.getTipoMembresia() == null || mem.getTipoMembresia().trim().isEmpty()) {
            System.out.println(" Tipo de membresía vacío.");
            return 0;
        }
        // aqui hacemos que no se acepte las letras ya que lo tenemos como string entonces solo hacemos una validacion
        // que permita que solo agarre numeros y decimales 
        try {
            Double.parseDouble(mem.getPrecioMembresia()); // Validación numérica
        } catch (NumberFormatException e) {
            System.out.println(" Precio inválido.");
            return 0;
        }
        if (mem.getCodigoCliente() <= 0) {
            System.out.println(" Código de cliente inválido.");
            return 0;
        }

        String sql = "insert into Membresias (numeroMembresia, tipoMembresia, precioMembresia, beneficios, estado, codigoCliente) values (?, ?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, mem.getNumeroMembresia());
            ps.setString(2, mem.getTipoMembresia());
            ps.setString(3, mem.getPrecioMembresia());
            ps.setString(4, mem.getBeneficios());
            ps.setString(5, mem.getEstado());
            ps.setInt(6, mem.getCodigoCliente());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // BUSCAR POR CÓDIGO
    public Membresia listarCodigoMembresia(int id) {
        Membresia mem = new Membresia();
        String sql = "select * from Membresias where codigoMembresia = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                mem.setCodigoMembresia(rs.getInt("codigoMembresia"));
                mem.setNumeroMembresia(rs.getString("numeroMembresia"));
                mem.setTipoMembresia(rs.getString("tipoMembresia"));
                mem.setPrecioMembresia(rs.getString("precioMembresia"));
                mem.setBeneficios(rs.getString("beneficios"));
                mem.setEstado(rs.getString("estado"));
                mem.setCodigoCliente(rs.getInt("codigoCliente"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mem;
    }

    // ACTUALIZAR
    public int actualizar(Membresia mem) {
        if (mem.getCodigoMembresia() <= 0) {
            System.out.println(" Código de membresía inválido para actualizar ");
            return 0;
        }
        String sql = "update Membresias set numeroMembresia=?, tipoMembresia=?, precioMembresia=?, beneficios=?, estado=? WHERE codigoMembresia=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, mem.getNumeroMembresia());
            ps.setString(2, mem.getTipoMembresia());
            ps.setString(3, mem.getPrecioMembresia());
            ps.setString(4, mem.getBeneficios());
            ps.setString(5, mem.getEstado());
            ps.setInt(6, mem.getCodigoMembresia());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ELIMINAR
    public int eliminar(int id) {
        if (id <= 0) {
            System.out.println(" id inválido para eliminar ");
            return 0;
        }
        String sql = "delete from Membresias where codigoMembresia = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
}