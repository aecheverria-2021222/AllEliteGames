package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public Empleado Validar(String usuario, String contrasena) {
    Empleado empleado = new Empleado();
    String sql = "select * from Empleado where usuario = ? and contrasena = ?";
    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        ps.setString(1, usuario);
        ps.setString(2, contrasena);
        rs = ps.executeQuery(); 
        while (rs.next()) {
            empleado.setCodigoEmpleado(rs.getInt("codigoEmpleado"));
            empleado.setUsuario(rs.getString("usuario"));
            empleado.setContrasena(rs.getString("contrasena")); 
            empleado.setNombresEmpleado(rs.getString("nombresEmpleado"));
            empleado.setCorreoEmpleado(rs.getString("correoEmpleado"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return empleado;
}
}
