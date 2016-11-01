/**
 * 
 */
jQuery(document).ready(function() {

	$("#edit").click(function()
			{
				var elem= get.ElementsByTagName("td");
				elem.attr('contenteditable',true);
			})
	
});

function conferma(){
	var result=confirm("Sei sicuro di voler eliminare definitivamente questo utente?")
	if(result==true){
		document.getElementById("delete").action='doCancellaUtente.jsp';
		document.getElementById("delete").submit();
	}
}