/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class TiendasDAO {
  Conexion cn = new Conexion();
  Connection con;
  PreparedStatement ps;
  ResultSet rs;
  int resp;
  
  //CRUD METODOS
  
  //-------LISTAR----------
  public List listar(){
      String sql = "select * from Tiendas";
      List<Tiendas> listaTiendas = new ArrayList<>();
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();
          
          while(rs.next()){
              Tiendas tnd = new Tiendas();
              tnd.setCodigoTienda(rs.getInt(1));
              tnd.setNumeroTienda(rs.getInt(2));
              tnd.setDireccion(rs.getString(3));
              tnd.setTelefonoTienda(rs.getString(4));
              tnd.setCorreoTienda(rs.getString(5));
              tnd.setHorarioApertura(rs.getString(6));
              tnd.setHorarioCierre(rs.getString(7));
              tnd.setEstado(rs.getString(8));
              tnd.setCodigoEmpleado(rs.getInt(9));
              listaTiendas.add(tnd);
         }
      }catch(Exception e){
          e.printStackTrace();}
  
  
      return listaTiendas;
  }
  
  
  //--------------Agregar--------------
  public int agregar(Tiendas tnd){
      String sql = "Insert into Tiendas (numeroTienda, direccion, telefonoTienda, correoTienda, horarioApertura, horarioCierre, estado, codigoEmpleado ) values (?,?,?,?,?,?,?,?)";
      try{
          con = cn.Conexion();
          ps = con.prepareStatement(sql);
          ps.setInt(1, tnd.getNumeroTienda());
          ps.setString(2,tnd.getDireccion());
          ps.setString(3, tnd.getTelefonoTienda());
          ps.setString(4, tnd.getCorreoTienda());
          ps.setString(5, tnd.getHorarioApertura());
          ps.setString(6, tnd.getHorarioCierre());
          ps.setString(7, tnd.getEstado());
          ps.setInt(8, tnd.getCodigoEmpleado());
          resp = ps.executeUpdate();
      }catch(Exception e){
          e.printStackTrace();
      }
  
  
    return resp;
  }
  
  //----------------BUSCAR POR CÓDIGO------------------
    public Tiendas listarCodigoTienda(int id) {
            Tiendas tnd = new Tiendas();
            String sql = "SELECT * FROM Tiendas WHERE codigoTienda = " + id;

            try {
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    tnd.setCodigoTienda(rs.getInt(1));          
                    tnd.setNumeroTienda(rs.getInt(2));
                    tnd.setDireccion(rs.getString(3));
                    tnd.setTelefonoTienda(rs.getString(4));
                    tnd.setCorreoTienda(rs.getString(5));
                    tnd.setHorarioApertura(rs.getString(6));
                    tnd.setHorarioCierre(rs.getString(7));
                    tnd.setEstado(rs.getString(8));
                    tnd.setCodigoEmpleado(rs.getInt(9));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return tnd;
        }

    
    public int actualizar(Tiendas tnd){
        String sql= "Update Tiendas set numeroTienda = ?, direccion = ?, telefonoTienda = ?, correoTienda = ?, horarioApertura = ?, horarioCierre = ?, estado = ? where codigoTienda = ?";
        try{
         con = cn.Conexion();
          ps = con.prepareStatement(sql);
          ps.setInt(1, tnd.getNumeroTienda());
          ps.setString(2,tnd.getDireccion());
          ps.setString(3, tnd.getTelefonoTienda());
          ps.setString(4, tnd.getCorreoTienda());
          ps.setString(5, tnd.getHorarioApertura());
          ps.setString(6, tnd.getHorarioCierre());
          ps.setString(7, tnd.getEstado());
          ps.setInt(8, tnd.getCodigoTienda());
          resp = ps.executeUpdate();
          
      }catch(Exception e){
          e.printStackTrace();
      }
        return resp;
    }

    public void eliminar(int id){
        String sql = "Delete from tiendas where codigoTienda ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

  
  
  
  
  
  
  
  
  
  
  
  
  
}

