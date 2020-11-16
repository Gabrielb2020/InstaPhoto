var url = 'http://mi-proyecto-laravel.test';
window.addEventListener("load", function(){
	$('.btn-like').css('cursor','pointer');
	$('.btn-dislike').css('cursor','pointer');
	$(document).on("click", ".btn-like", function(e){
        console.log('like');
		$(this).addClass('btn-dislike').removeClass('btn-like');
        $(this).attr('src', url+'/img/heart-red(1).png');
        
        $.ajax({
            url: url+'/like/'+$(this).data('id'),
            type:'GET',
            success: function(response){
                if(response.like){
                    console.log('Has dado like a la publicacion');
                }else{
                    console.log('Error al dar like')
                }
               
            }
        });
	});
	$(document).on("click", ".btn-dislike", function(e){
        console.log('dislike');
		$(this).addClass('btn-like').removeClass('btn-dislike');
        $(this).attr('src', url+'/img/heart-black.png');
        
        $.ajax({
            url: url+'/dislike/'+$(this).data('id'),
            type:'GET',
            success: function(response){
                if(response.like){
                    console.log('Has dado dislike a la publicacion');
                }else{
                    console.log('Error al dar dislike')
                }
               
            }
        });
    });
    
    // Buscador

    $("#buscador").submit(function(event){
        $(this).attr('action', url+'/gente/'+$('#buscador #search').val());
    });
});