$('#copy_adress').live('click', function () {
    if($(this).attr("checked") == true) {
    	var original_user_l_adress = $('#user_f_adress').val();
    	var original_user_l_postnumber = $('#user_f_postnumber').val();
    	var original_user_l_county = $('#user_f_county').val();
    	$('#user_l_adress').attr("value", original_user_l_adress)
    	$('#user_l_postnumber').attr("value", original_user_l_postnumber)
    	$('#user_l_county').attr("value", original_user_l_county)
    } else {
    	location.reload();
    }
});
