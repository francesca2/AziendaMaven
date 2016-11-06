/**
 * 
 */
jQuery(document).ready(function() {

    $('#editVoce').click(function()
			{
    	 var currentTD = $(this).parents('tr').find('td');
         var count=currentTD.length-1;
          for(i=0; i<count; i++){
        	  var s=currentTD[i].innerHTML;
        	  var nome="nome"+i;
              currentTD[i].innerHTML='<input type="text" value="'+s+'" name="'+nome+'" form="form"/>';
          }

         $(this).replaceWith('<button type="submit" class="btn btn-info" onclick="salvaVoce()"><i class="glyphicon glyphicon-check"></i> Save</button>');
});   

});

function conferma(){
	var result=confirm("Sei sicuro di voler eliminare definitivamente questo utente?")
	if(result==true){
		document.getElementById("form").action='doEliminaContatto.jsp';
		document.getElementById("form").submit();
	}
}

function salvaVoce(){
	var result=confirm("Sei sicuro di voler salvare le modifiche fatte?")
	if(result==true){
		document.getElementById("form").action='doModificaVoce.jsp';
		document.getElementById("form").submit();
	}
}
