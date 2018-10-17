$( document ).ready(function() {
	$('.to_hide').hide();
});
$(".chosen").chosen();

function favourite_toggle(element_id,controller){
	// console.log($("#img_"+image_id).prop('checked'),image_id);
	$.ajax({
		type:'POST', 
		url: "/"+controller+"/favourite_toggle", 
		data: { element_id: element_id, favourite: $("#"+controller+"_"+element_id).prop('checked')}
	}); 
}


function change_post_type(element,arr) {
	var text = $(element).find('option').filter(':selected').text()
	if (text == "New")
	{ 	
		$('.to_hide').hide();
	}
	else{
		$('.to_hide').show();
	}
		// body...
}


function change_sub_category_type(element,arr) {
	console.log($(element).val())
	var id = $(element).val()
	$.ajax({
		type:'GET', 
		url:  "/categories/"+id+"/get_sub_categories" 
	}); 
}

function add_to_cart(id,price){
	if(price == 0){
		price = $('#quantity_for_post').val();
	}
	$.ajax({
		type:'POST', 
		url: "/carts/add_products", 
		data: { post_id: id,amount: price}
	}); 
}