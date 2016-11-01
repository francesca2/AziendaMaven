/**
 * 
 */
jQuery(document).ready(function() {

    $('#edit').click(function()
			{
                var currentTD = $(this).parents('tr').find('td');
            if ($(this).html() == 'Edit') {                  
              $.each(currentTD, function () {
                  $(this).prop('contenteditable', true)
              });
          } else {
             $.each(currentTD, function () {
                             
                  $(this).prop('contenteditable', false)
              });
          }

          $(this).html($(this).html() == 'Edit' ? 'Save' : 'Edit')
          
			})

});

function conferma(){
	var result=confirm("Sei sicuro di voler eliminare definitivamente questo utente?")
	if(result==true){
		document.getElementById("delete").action='doCancellaUtente.jsp';
		document.getElementById("delete").submit();
	}
}