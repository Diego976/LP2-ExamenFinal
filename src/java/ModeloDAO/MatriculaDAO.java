/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.bd.ConectaBd;
import Interfaces.CRUDmatricula;
import Modelo.Matricula;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author HBRT
 */
public class MatriculaDAO implements CRUDmatricula{
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Matricula m = new Matricula();

    @Override
    public List listarmatricula() {
        ArrayList<Matricula> matriculas = new ArrayList<>();
        String consulta = " select * from matricula ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Matricula matricula = new Matricula();
                matricula.setIdmatricula(rs.getInt("idmatricula"));
                matricula.setSemestre(rs.getString("semestre"));
                matricula.setCiclo(rs.getInt("ciclo"));
                matricula.setEstado(rs.getString("estado"));
                matricula.setIdcurso(rs.getInt("idcurso"));
                matricula.setIdestudiante(rs.getInt("idestudiante"));
                matricula.setIdcarrera(rs.getInt("idcarrera"));
                matriculas.add(matricula);
            }
        } catch (Exception e) {
            
        }
        return matriculas;
    }

    @Override
    public Matricula buscarmatricula(int idmatricula) {
        String consulta = " select *  "
                        + " from matricula  "
                        + " where idmatricula = " + idmatricula + " ;";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                m.setIdmatricula(rs.getInt("idmatricula"));
                m.setSemestre(rs.getString("semestre"));
                m.setCiclo(rs.getInt("ciclo"));
                m.setEstado(rs.getString("estado"));
                m.setIdcurso(rs.getInt("idcurso"));
                m.setIdestudiante(rs.getInt("idestudiante"));
                m.setIdcarrera(rs.getInt("idcarrera"));
            }
        } catch (Exception e) {
        }
        
        return m;
    }

    @Override
    public boolean agregarmatricula(Matricula matricula) {
        String consulta = "INSERT INTO `matricula` (`semestre`, `ciclo`, `estado`, `idcurso`, `idestudiante`, `idcarrera`) VALUES ( '"+ matricula.getSemestre()+"', '"+ matricula.getCiclo()+"', '"+ matricula.getEstado()+"', '"+ matricula.getIdcurso()+"', '"+ matricula.getIdestudiante()+"', '"+ matricula.getIdcarrera()+"') ";
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
    public boolean editarmatricula(Matricula matricula) {
        String consulta = " update matricula "
                        + " set "
                        + " semestre = '"+ matricula.getSemestre()+"', "
                        + " ciclo = '"+ matricula.getCiclo() +"', "
                        + " estado = '"+ matricula.getEstado() +"', "
                        + " idcurso = '"+ matricula.getIdcurso() +"', "
                        + " idestudiante = '"+ matricula.getIdestudiante() +"',"
                        + " idcarrera = '"+ matricula.getIdcarrera() +"' "
                        + " where "
                        + " idmatricula = " + matricula.getIdmatricula() + "; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarmatricula(int idmatricula) {
        String consulta = " delete from matricula where idmatricula = " + idmatricula + " ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}