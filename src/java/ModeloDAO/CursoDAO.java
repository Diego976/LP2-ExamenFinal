package ModeloDAO;

import Config.bd.ConectaBd;
import Interfaces.CRUDcurso;
import Modelo.Curso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author HBRT
 */
public class CursoDAO implements CRUDcurso{
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Curso e = new Curso();

    @Override
    public List listarcurso() {
        ArrayList<Curso> cursos = new ArrayList<>();
        String consulta = " select * from curso ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setIdcurso(rs.getInt("idcurso"));
                curso.setNombre(rs.getString("nombre"));
                curso.setHoras(rs.getInt("horas"));
                curso.setCreditos(rs.getInt("creditos"));
                curso.setEstado(rs.getString("estado"));
                cursos.add(curso);
            }
        } catch (Exception e) {
            
        }
        return cursos;
    }

    @Override
    public Curso buscarcurso(int idcurso) {
        String consulta = " select *  "
                        + " from curso  "
                        + " where idcurso = " + idcurso + " ;";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                e.setIdcurso(rs.getInt("idcurso"));
                e.setNombre(rs.getString("nombre"));
                e.setHoras(rs.getInt("horas"));
                e.setCreditos(rs.getInt("creditos"));
                e.setEstado(rs.getString("estado"));
            }
        } catch (Exception e) {
        }
        
        return e;
    }

    @Override
    public boolean agregarcurso(Curso curso) {
        String consulta = "INSERT INTO `academico`.`curso` (`nombre`, `horas`, `creditos`, `estado`) VALUES ( '"+ curso.getNombre() +"', '"+ curso.getHoras() +"', '"+ curso.getCreditos() +"', '"+ curso.getEstado() +"') ";
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
    public boolean editarcurso(Curso curso) {
        String consulta = " update curso "
                        + " set "
                        + " nombre = '"+ curso.getNombre() +"', "
                        + " horas = '"+ curso.getHoras() +"', "
                        + " creditos = '"+ curso.getCreditos() +"', "
                        + " estado = '"+ curso.getEstado() +"' "
                        + " where "
                        + " idcurso = " + curso.getIdcurso() + "; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarcurso(int idcurso) {
        String consulta = " delete from curso where idcurso = " + idcurso + " ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}