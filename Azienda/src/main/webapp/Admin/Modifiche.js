/**
 * 
 */
jQuery(document).ready(function() {

	function elimina(id){
		var path='doCancellaUtente.jsp';
		var form=create(path,id);
		form.submit();
		}

		function create(path,id){
		var form = document.createElement("form");
		form.method='GET';
		form.action=path;
		var in1 = document.createElement("input");
		in1.setAttribute('type',"hidden");
		in1.setAttribute('name',"id");
		in1.setAttribute('value',id);
		form.appendChild(in1);
		var element = document.getElementsByTagName("body");
		element[0].appendChild(form);
		return form;
		}
});