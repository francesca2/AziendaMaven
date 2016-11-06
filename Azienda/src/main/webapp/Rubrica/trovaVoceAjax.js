/**
 * 
 */
jQuery(document).ready(function() {
	
	
	$("#btn").click(function(){
		

	  var nome=$("#nome").val();
	  var cognome=$("#cognome").val();
	  var id=$("#id").val();
	  
	  // parametri dentro url => http:// ...  ?matricola=valore 
//	  var parametroInput1="nme="+nome;
//	  var parametroInput2="cgnm="+cognome;
	  
	  
	  $.ajax({
		  
		  type: "POST", 
		  url : "trovaVoce",
		  data: {nome: nome, cognome: cognome, id: id}, //
		  dataType : "JSON" ,
		  
		  
		  success: function(data,txtStatus,jqXHR){
			  /// se tutto va bene e riceviamo i dati dal server
			  
			  if(data.success){
				  
				  $("#risposta").html("");
				  $("#risposta").append("<p>Telefono :" + data.voce.telefono +"</p>");
			  }else{
				  $("#risposta").html("");
				  $("#risposta").append("<p> La voce non esiste </p>");
				  
			  }
			  
			  
		  } 
	   ,
		  
	  error: function(jqXHR,txtStatus,erroreLanciato){
		  // se sucesso qualcosa 
		  
		  console.log("qualcosa e' andato male :" +txtStatus);
		  
		  
	  }
		  
		  
		  
	  });
	  
	  
	//  alert(dataInserito);
		
		
	});
		
	
	
});

