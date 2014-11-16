/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*Fecha : 2041114
 *Autor : Antonio Jose Paternina  
 *Descripción : Nota :Se quita este elemento porque los lectores de pantalla leen lo que esta dentro de la etiqueta noscript  
 */
function quitarNoScriptNavbar(){
    try {
        $(function(){
            $("#li_popupAyuda a").attr('tabindex','');    
            $("#li_popupAyuda noscript").html('');
	});
    } catch (e) {
     //   alert('¡Ha ocurrido un error en la función quitarNoScript '+e.message);
    }
}

/*Fecha : 2041114
 *Autor : Antonio Jose Paternina  
 *Descripción : Nota :Se quita este elemento porque los lectores de pantalla leen lo que esta dentro de la etiqueta noscript  
 */
function quitarNoScript(){
    try {
        $(function(){
            $("noscript").html('');
            $("noscript").text('');
	});
    } catch (e) {
     //   alert('¡Ha ocurrido un error en la función quitarNoScript '+e.message);
    }
}

/*Fecha : 2041114
 *Autor : Antonio Jose Paternina  
 *Descripción : Muestra los mensajes de alertas las paginas de dspace
 *              Nota :Se quita este elemento porque los lectores de pantalla leen lo que esta dentro de la etiqueta noscript  
 */
function mostraAlerta(){
        try {
         $(function(){
           // $('input[class*="keyboard"]').keyboard();
           
           if($('.alertMensaje').html()!=undefined){
                alert($('.alertMensaje').html());        
           }
	});
    } catch (e) {
        //alert('¡Ha ocurrido un error en la función quitarNoScript '+e.message);
    }
   
}




