/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Hola

//Manejamos el evento del boton cuyo id es guardar-pelicula

$("#guardar-pelicula").click(function () {
    //alert("Probando el click del botón");
     //activamos ajax
    console.log("El titulo es"+$('#titulo').val())
    $.ajax('insertar-pelicula',{
        type:'post',
     
        data:{
            titulo:$("#titulo").val(),
            sinopsis:$('#sinopsis').val()
        },
    
        success:function(datos){
           $("#resultado").html(datos.mensaje); 
           console.log(datos.mensaje);
        }
        
    });
});

/*
 * Hacemos una llamad de AJAX para borrar peliculas
 */
$("#borrar-pelicula").click(function () {
    //alert("Probando el click del botón");
     //activamos ajax
    console.log("valor de id: "+$("#id-pelicula").val())
    $.ajax('borrar-pelicula',{
        type:'delete',
     
        data:{
            id:$("#id-pelicula").val()
            
        },
    
        success:function(estatus){
            alert(estatus.mensaje)
           
        }
        
    });
});

/*
 *Hacemos una llamada de AJAX para buscar las peliculas 
 */

$.ajax('buscar-peliculas',{
   type:'get',
   dataType:'json',
   success:function(datos){
       for(i=0; i<datos.length; i++){
           $("#tablita").append('<tr><td>'+datos[i].id+'</td><td>'+datos[i].titulo+'</td><td>'+datos[i].sinopsis+'</td></tr>')
       }
   }
});

