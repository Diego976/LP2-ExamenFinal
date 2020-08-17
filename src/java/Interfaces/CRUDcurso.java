package Interfaces;

import Modelo.Curso;
import java.util.List;
        
/**
 *
 * @author HBRT
 */
public interface CRUDcurso {
    public List listarcurso(); // listar
    public Curso buscarcurso(int idcurso); // buscar
    public boolean agregarcurso(Curso curso); // agregar
    public boolean editarcurso(Curso curso); // editar
    public boolean eliminarcurso(int idcurso); // eliminar
}