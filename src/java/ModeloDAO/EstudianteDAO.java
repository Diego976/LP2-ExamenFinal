/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.bd.ConectaBd;
import Interfaces.CRUDestudiante;
import Modelo.Estudiante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author HBRT
 */
public class EstudianteDAO implements CRUDestudiante{
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Estudiante e = new Estudiante();

    @Override
    public List listarestudiante() {
        ArrayList<Estudiante> estudiantes = new ArrayList<>();
        String consulta = " select * from estudiante ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Estudiante estudiante = new Estudiante();
                estudiante.setIdestudiante(rs.getInt("idestudiante"));
                estudiante.setNombre(rs.getString("nombre"));
                estudiante.setApellidos(rs.getString("apellidos"));
                estudiante.setDni(rs.getString("dni"));
                estudiante.setCodigo(rs.getString("codigo"));
                estudiante.setDireccion(rs.getString("direccion"));
                estudiante.setEstado(rs.getString("estado"));
                estudiantes.add(estudiante);
            }
        } catch (Exception e) {
            
        }
        return estudiantes;
    }

    @Override
    public Estudiante buscarestudiante(int idestudiante) {
        String consulta = " select *  "
                        + " from estudiante  "
                        + " where idestudiante = " + idestudiante + " ;";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                e.setIdestudiante(rs.getInt("idestudiante"));
                e.setNombre(rs.getString("nombre"));
                e.setApellidos(rs.getString("apellidos"));
                e.setDni(rs.getString("dni"));
                e.setCodigo(rs.getString("codigo"));
                e.setDireccion(rs.getString("direccion"));
                e.setEstado(rs.getString("estado"));
            }
        } catch (Exception e) {
        }
        
        return e;
    }

    @Override
    public boolean agregarestudiante(Estudiante estudiante) {
        String consulta = "INSERT INTO `academico`.`estudiante` (`nombre`, `apellidos`, `dni`, `codigo`,`direccion`, `estado`) VALUES ( '"+ estudiante.getNombre() +"', '"+ estudiante.getApellidos() +"', '"+ estudiante.getDni() +"', '"+ estudiante.getCodigo() +"', '"+ estudiante.getDireccion()+"', '"+ estudiante.getEstado() +"') ";
        //String consulta = "INSERT INTO estudiante (idestudiante, nombre, apellidos, dni, codigo, direccion, estado) VALUES (NULL, '"+estudiante.getNombre()+"', '"+estudiante.getApellidos()+"', '"+estudiante.getDni()+"', '"+estudiante.getCodigo()+"', '', '"+estudiante.getEstado()+"')";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editarestudiante(Estudiante estudiante) {
        String consulta = " update estudiante "
                        + " set "
                        + " nombre = '"+ estudiante.getNombre() +"', "
                        + " apellidos = '"+ estudiante.getApellidos() +"', "
                        + " dni = '"+ estudiante.getDni() +"', "
                        + " codigo = '"+ estudiante.getCodigo() +"', "
                        + " direccion = '"+ estudiante.getDireccion() +"',"
                        + " estado = '"+ estudiante.getEstado() +"' "
                        + " where "
                        + " idestudiante = " + estudiante.getIdestudiante() + "; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarestudiante(int idestudiante) {
        String consulta = " delete from estudiante where idestudiante = " + idestudiante + " ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
