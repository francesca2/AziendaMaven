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