<%-- 
    Document   : EditarCarrera
    Created on : 16/08/2020, 11:19:13 PM
    Author     : DIEGO VASQUEZ
--%>

<%@page import="Modelo.Carrera"%>
<%@page import="ModeloDAO.CarreraDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Carrera</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                CarreraDAO carreraDAO = new CarreraDAO();
                int s_idcarrera = Integer.valueOf(request.getParameter("f_idcarrera"));
                Carrera carrera = (Carrera)carreraDAO.buscarcarrera(s_idcarrera);
            %>
            <form name="EditarCarreraForm" action="ControladorCarrera" method="get">
                <table  class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Editar Carrera</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-right">Nombre</td>
                            <td><input class="form-horizontal" type="text" name="f_nombre" value="<% out.println(carrera.getNombre()); %>" maxlength="50" size="50" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Estado</td>
                            <td><select class="dropdown-toggle" name="f_estado">
                                    <option value="A">Activo</option>
                                    <option value="I">Inactivo</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <input class="btn btn-primary" type="submit" value="Editar Carrera" name="editar" />
                                <input type="hidden" value="editarcarrera02" name="f_accion"/>
                                <input type="hidden" value="<% out.print(carrera.getIdcarrera()); %>" name="f_idcarrera">

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
