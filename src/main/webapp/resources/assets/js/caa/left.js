$('#leftMenu li a').on('click',function (){
   $('#leftMenu li.active').removeClass('active');
   $('this').addClass('active');
});