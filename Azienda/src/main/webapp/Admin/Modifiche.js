/**
 * 
 */
jQuery(document).ready(function() {

    $('#edit').click(function()
			{
    	 var currentTD = $(this).parents('tr').find('td');
         var count=currentTD.length-1;
      if ($(this).html() == 'Edit') {                  
          for(i=0; i<count; i++){
        	  var s=currentTD[i].innerHTML;
              currentTD[i].innerHTML='<input type="text" value="'+s+'"/>';
          }
          
      } else {
         $.each(currentTD, function () {
              $(this).prop('contenteditable', false)
          });
      }

      $(this).html($(this).html() == 'Edit' ? 'Save' : 'Edit')

});

});

function conferma(){
	var result=confirm("Sei sicuro di voler eliminare definitivamente questo utente?")
	if(result==true){
		document.getElementById("delete").action='doCancellaUtente.jsp';
		document.getElementById("delete").submit();
	}
}