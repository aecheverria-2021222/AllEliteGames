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

/**
 *
 * @author gonze
 */
public class GeneroDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    //Listar
    public List listar() {
        String sql = "select * from Generos";
        List<Genero> listarGenero = new ArrayList<>();
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
                listarGenero.add(gen);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listarGenero;
    }
    
    //Agregar
    public int agregar(Genero gen){
        String sql = "insert into Genero (genero, edadRecomendable, popularidad, publicoObjetivo, estado)values(?,?,?,?,?)";
        try{
            con =cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, gen.getGenero());
            ps.setString(2, gen.getEdadRecomendable());
            ps.setString(3, gen.getPopularidad());
            ps.setString(4, gen.getPublicoObjetivo());
            ps.executeUpdate();
        }catch(Exception e){    
            e.printStackTrace();
        }
        return resp;
    }
    
    //Buscar
     public Genero listarCodigoGenero(int id){
        //instanciar un objeto de tipo genero
        Genero gen = new Genero();
        String sql = "Select * from Genero where codigoGenero ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                gen.setGenero(rs.getString(2));
                gen.setEdadRecomendable(rs.getString(3));
                gen.setPopularidad(rs.getString(4));
                gen.setPublicoObjetivo(rs.getString(5));
                gen.setEstado(rs.getString(6));
                }
        }catch(Exception e){
            e.printStackTrace();
        }
        return gen;
    }
     
     //Actualizar
      public int actualizar(Genero gen){
        String sql = "Update Genero set codigoGenero = ?, genero = ?, edadRecomendable = ?, popularidad = ?, publicObjetivo = ? where codigoGenero = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, gen.getGenero());
            ps.setString(2, gen.getEdadRecomendable());
            ps.setString(3, gen.getPopularidad());
            ps.setString(4, gen.getPublicoObjetivo());
            ps.setString(5, gen.getEstado());
            ps.executeUpdate(); 
        }catch(Exception e){    
            e.printStackTrace();
        }
        return resp;
    }
    
      //Eliminar
        public void eliminar(int id){
        String sql = "Delete from genero where codigoGenero ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
               e.printStackTrace();
        }
    }
}
