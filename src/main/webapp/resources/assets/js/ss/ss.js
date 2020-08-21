$(function () {

	

		$('select[name="large"]').on('change',function(){
		var middle = $('select[name="middle"]');
		$.getJSON("/caa/rest/div/"+this.value,
			function(data){
				small.children('option').remove();
				for(var i = 0; i<data.length; i++){
					small.append('<option value='+data[i].cs_code+'>'+data[i].cs_code_name+'</option>');
				}
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
			});
	});
});
