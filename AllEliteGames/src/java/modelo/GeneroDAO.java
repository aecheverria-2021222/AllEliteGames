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
    int respo;
    
    public List listar(){
        String sql = "select * from Generos";
        List<Genero> listaGenero = new ArrayList<>();
     try{
            con = cn.Conexion(); 
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Genero gen = new Genero();
                gen.setCodigoGenero(rs.getInt(1));
                gen.setEdadRecomendable(rs.getString(2));
                gen.setPopularidad(rs.getString(3));
                gen.setPublicoObjetivo(rs.getString(4));
                listaGenero.add(gen);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaGenero;   
        
    }
}
