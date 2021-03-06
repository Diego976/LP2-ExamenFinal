<%-- 
    Document   : EditarEstudiante
    Created on : 16/08/2020, 01:07:27 PM
    Author     : HBRT
--%>

<%@page import="Modelo.Estudiante"%>
<%@page import="ModeloDAO.EstudianteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Estudiante</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                EstudianteDAO estudianteDAO = new EstudianteDAO();
                int s_idestudiante = Integer.valueOf(request.getParameter("f_idestudiante"));
                Estudiante estudiante = (Estudiante)estudianteDAO.buscarestudiante(s_idestudiante);
            %>
            <form name="EditarEstudianteForm" action="ControladorEstudiante" method="get">
                <table  class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Editar Estudiante</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-right">Nombre</td>
                            <td><input class="form-horizontal" type="text" name="f_nombre" value="<% out.println(estudiante.getNombre()); %>" maxlength="30" size="30" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">"Apellido</td>
                            <td><input class="form-horizontal" type="text" name="f_apellidos" value="<% out.println(estudiante.getApellidos()); %>" maxlength="50" size="50" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">DNI</td>
                            <td><input class="form-horizontal" type="text" name="f_dni" value="<% out.println(estudiante.getDni()); %>" maxlength="8" size="8" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Codigo</td>
                            <td><input class="form-horizontal" type="text" name="f_codigo" value="<% out.println(estudiante.getCodigo()); %>" maxlength="9" size="9" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Direccion</td>
                            <td><input class="form-horizontal" type="text" name="f_direccion" value="<% out.println(estudiante.getDireccion()); %>" maxlength="50" size="50" /></td>
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
                                <input class="btn btn-primary" type="submit" value="Editar Estudiante" name="editar" />
                                <input type="hidden" value="editarestudiante02" name="f_accion"/>
                                <input type="hidden" value="<% out.print(estudiante.getIdestudiante()); %>" name="f_idestudiante">

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
