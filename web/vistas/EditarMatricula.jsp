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
                            <td><input class="form-horizontal" type="text" name="f_semestre" value="<% out.println(matricula.getSemestre()); %>" maxlength="6" size="6" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Ciclo</td>
                            <td><input class="form-horizontal" type="text" name="f_ciclo" value="<% out.println(matricula.getCiclo()); %>" maxlength="11" size="11" /></td>
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
                            <td><select class="dropdown-toggle" name="f_idcurso">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    
                                </select></td>
                        </tr>
                        <tr>
                            <td class="text-right">IDEstudiante</td>
                            <td><select class="dropdown-toggle" name="f_idestudiante">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    </select></td>
                        </tr>
                        <tr>
                            <td class="text-right">IDCarrera</td>
                            <td><select class="dropdown-toggle" name="f_idcarrera">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    </select></td>
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
