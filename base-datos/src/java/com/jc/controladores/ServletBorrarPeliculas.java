/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jc.controladores;

import com.jc.model.DAOPelicula;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;

/**
 *
 * @author T-102
 */
public class ServletBorrarPeliculas extends HttpServlet {

    protected void doDelete(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //PEDIMOS DATOS AL CLIENTE
        String id=request.getParameter("id-pelicula");
        int idPelicula=Integer.parseInt(id);

        Estatus estatus = new Estatus();

        try {
            //Se invoca el procedimiento
            estatus = DAOPelicula.borrarPelicula(idPelicula);

        } catch (Exception ex) {
            estatus.setSuccess(false);
            estatus.setMensaje("Error al borrar: " + ex.getMessage());

        }
        ObjectMapper maper = new ObjectMapper();
        out.print(maper.writeValueAsString(estatus));

    }

}
