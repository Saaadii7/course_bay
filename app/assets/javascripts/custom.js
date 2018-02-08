
function favourite_toggle(image_id){
	console.log($("#img_"+image_id).prop('checked'),image_id);
	$.ajax({
	    type:'POST', 
	    url: '/images/favourite_toggle', 
	    data: { image_id: image_id, favourite: $("#img_"+image_id).prop('checked')}
	  }); 
	
}

