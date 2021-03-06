/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jc.model;

import com.jc.controladores.Estatus;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import oracle.jdbc.internal.OracleTypes;

/**
 *
 * @author campitos
 */
public class DAOPelicula {

    public static String guardarPelicula(String titulo, String sinopsis) throws Exception {
        Conexion c = new Conexion();
        Connection con = c.conectarse();
        CallableStatement callate = con.prepareCall("{call guardar_pelicula(?,?,?)}");
        callate.registerOutParameter(1, java.sql.Types.INTEGER);
        callate.setString(2, titulo);
        callate.setString(3, sinopsis);

        callate.execute();
        int pk = callate.getInt(1);
        return "SE guardo la pelicula con id:" + pk;
    }

    public static ArrayList<Pelicula> buscarTodasPeliculas() {
        //primero nos conectamos a Oracle
        String resultado = "no hay nada";
        ArrayList<Pelicula> peliculas = new ArrayList<Pelicula>();
        try {
            Connection con = Conexion.conectarse();
            Statement st = con.createStatement();
            //Con el statement realizamos los cueris
            // ResultSet res= st.executeQuery("select * from pelicula");
            //Iterar ek resulset para ver los resultados de mi cueri
            CallableStatement callate = con.prepareCall("{call buscar_peliculas(?)}");
            callate.registerOutParameter(1, OracleTypes.CURSOR);

            callate.execute();
            ResultSet res = (ResultSet) callate.getObject(1);
            int contador = 0;

            while (res.next()) {
                Pelicula p = new Pelicula();
                p.setId(res.getInt(1));
                p.setTitulo(res.getString(2));
                p.setSinopsis(res.getString(3));
                peliculas.add(p);
            }

            resultado = "encontramos " + peliculas.toString() + " registros";

        } catch (Exception e) {
            resultado = e.getMessage();
        }
        return peliculas;
    }
    
    public static Estatus borrarPelicula(int idPelicula) throws Exception{
        Conexion c = new Conexion();
        Connection con = c.conectarse();
        CallableStatement callate = con.prepareCall("{call borrar_pelicula(?)}");
        callate.setInt(1, idPelicula);
        callate.execute();
        Estatus es=new Estatus();
        es.setMensaje("Borrado con exito");
        es.setSuccess(true);
        
        return es;
    }

}
