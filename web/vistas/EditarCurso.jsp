<%-- 
    Document   : EditarCurso
    Created on : 17/08/2020, 12:55:04 AM
    Author     : CHRISTIAN
--%>

<%@page import="Modelo.Curso"%>
<%@page import="ModeloDAO.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Curso</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                CursoDAO cursoDAO = new CursoDAO();
                int s_idcurso = Integer.valueOf(request.getParameter("f_idcurso"));
                Curso curso = (Curso)cursoDAO.buscarcurso(s_idcurso);
            %>
            <form name="EditarCursoForm" action="ControladorCurso" method="get">
                <table  class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Editar Curso</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-right">Nombre</td>
                            <td><input class="form-horizontal" type="text" name="f_nombre" value="<% out.println(curso.getNombre()); %>" maxlength="50" size="50" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Horas</td>
                            <td><input class="form-horizontal" type="text" name="f_horas" value="<% out.println(curso.getHoras()); %>" maxlength="11" size="11" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Creditos</td>
                            <td><input class="form-horizontal" type="text" name="f_creditos" value="<% out.println(curso.getCreditos()); %>" maxlength="11" size="11" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Estado</td>
                            <td><select class="dropdown-toggle" name="f_estado">
                                    <option value="A">Activo</option>
                                    <option value="I">Inacctivo</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <input class="btn btn-primary" type="submit" value="Editar Curso" name="editar" />
                                <input type="hidden" value="editarcurso02" name="f_accion"/>
                                <input type="hidden" value="<% out.print(curso.getIdcurso()); %>" name="f_idcurso">

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