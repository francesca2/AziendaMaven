/**
 * 
 */
jQuery(document).ready(function() {
	
	$("#trova").click(function(){

	  var nome=$("#nome").val();
	  var cognome=$("#cognome").val();
	  var id=$("#id").val();
	  
	  // parametri dentro url => http:// ...  ?matricola=valore 
	  var parametroInput="nme="+nome + "&cgnm="+cognome+"&id="+id;
	  
	  $.ajax({
		  
		  type: "POST", 
		  url : "trovaVoce",
		  data: parametroInput, //
		  dataType : "json" ,
		  
		  
		  success: function(data,txtStatus,jqXHR){
			  /// se tutto va bene e riceviamo i dati dal server
			  
			  if(data.success){
				  
				  $("#risposta").html("");
				  $("#risposta").append("<p>Telefono :" + data.voce.telefono +"</p>");
			  }else{
				  $("#risposta").html("");
				  $("#risposta").append("<p> La voce non esiste </p>");
				  alert(parametroInput);
			  }
			  
			  
		  } 
	   ,
		  
	  error: function(jqXHR,txtStatus,erroreLanciato){
		  // se sucesso qualcosa 
		  
		  console.log("qualcosa e' andato male :" +txtStatus);
		  
		  
	  }
		  
		  
		  
	  });
		
	});
		
	
	
});

