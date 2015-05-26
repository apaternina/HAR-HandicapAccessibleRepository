/*    
    Version: Accessible Space 1.0
    Fecha : 14-nov-2014, 22:36:21
    Author  : Antonio Paternina - apaternina
    Descripciòn : Se crea el archivo, que contiene las funciones js, para personalizar 
                  componente JSPUI
*/

/*Fecha : 14-nov-2014, 22:36:21
 *Autor : Antonio Jose Paternina  
 *Descripción : función que quita los elementos noscript,
 *              porque los lectores de pantalla leen lo que esta dentro de la etiqueta noscript 
 *              en la página navbar y leen el código literalmete.  
 */
function quitarNoScriptNavbar(){
    try {
        $(function(){
            if($("#li_popupAyuda a")!=null){
             $("#li_popupAyuda a").attr('tabindex','');      
             $("#li_popupAyuda noscript").html('');
            }
	});
    } catch (e) {
     //alert('¡Ha ocurrido un error en la función quitarNoScript '+e.message);
    }
}

/*Fecha : 14-nov-2014, 22:36:21
 *Autor : Antonio Jose Paternina  
 *Descripción : función que quita los elementos noscript,
 *              porque los lectores de pantalla leen lo que esta dentro de la etiqueta noscript 
 *              en la pàgina principal y leen el código literalmete.  
 */
function quitarNoScript(){
    try {
        $(function(){
            var sNoscripts = $("noscript");
            for (var i = 0; i < sNoscripts.length; i++) {
                sNoscripts[i].innerHTML='';
                sNoscripts[i].innerText='';
            }           
	});
    } catch (e) {
     //alert('¡Ha ocurrido un error en la función quitarNoScript '+e.message);
    }
}





