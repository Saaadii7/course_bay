
function favourite_toggle(element_id,controller){
	// console.log($("#img_"+image_id).prop('checked'),image_id);
	$.ajax({
	    type:'POST', 
	    url: "/"+controller+"/favourite_toggle", 
	    data: { element_id: element_id, favourite: $("#"+controller+"_"+element_id).prop('checked')}
	 }); 
}
