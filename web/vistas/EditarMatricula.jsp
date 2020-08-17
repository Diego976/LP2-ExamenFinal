<%-- 
    Document   : EditarMatricula
    Created on : 17/08/2020, 01:06:49 AM
    Author     : DIEGO ALONSO
--%>

<%@page import="Modelo.Matricula"%>
<%@page import="ModeloDAO.MatriculaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Matricula</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                MatriculaDAO matriculaDAO = new MatriculaDAO();
                int s_idmatricula = Integer.valueOf(request.getParameter("f_idmatricula"));
                Matricula matricula = (Matricula)matriculaDAO.buscarmatricula(s_idmatricula);
            %>
            <form name="EditarMatriculaForm" action="ControladorMatricula" method="get">
                <table  class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Editar Matricula</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-right">Semestre</td>
                            <td><input class="form-control" type="text" name="f_semestre" value="<% out.println(matricula.getSemestre()); %>" maxlength="30" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">"Ciclo</td>
                            <td><input class="form-control" type="text" name="f_ciclo" value="<% out.println(matricula.getCiclo()); %>" maxlength="40" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Estado</td>
                            <td><select class="dropdown-toggle" name="f_estado">
                                    <option value="A">Activo</option>
                                    <option value="I">Inacctivo</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td class="text-right">IDCurso</td>
                            <td><input class="form-control" type="text" name="f_idcurso" value="<% out.println(matricula.getIdcurso()); %>" maxlength="9" size="12" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">IDEstudiante</td>
                            <td><input class="form-control" type="text" name="f_idestudiante" value="<% out.println(matricula.getIdestudiante()); %>" maxlength="40" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">IDCarrera</td>
                            <td><input class="form-control" type="text" name="f_idcarrera" value="<% out.println(matricula.getIdcarrera()); %>" maxlength="9" size="12" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <input class="btn btn-primary" type="submit" value="Editar Matricula" name="editar" />
                                <input type="hidden" value="editarmatricula02" name="f_accion"/>
                                <input type="hidden" value="<% out.print(matricula.getIdmatricula()); %>" name="f_idmatricula">

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <a class="btn btn-success" href="index.html">Volver</a>      
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
