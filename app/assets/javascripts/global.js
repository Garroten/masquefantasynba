$(function() {
    $('.flip-container').css({ 'opacity': '1'});
    $('#menu_abajo').mouseover(function() {
        $(this).animate({opacity: 1}, 1000);
      });
   
    // grab the initial top offset of the navigation
    var menu_arriba = document.getElementById('menu_arriba')
        if (!menu_arriba) {
          
        } else{
            var sticky_navigation_offset_top = $('#menu_arriba').offset().top;
        };
     
    // our function that decides weather the navigation bar should have "fixed" css position or not.
    var sticky_navigation = function(){
        var scroll_top = $(window).scrollTop(); // our current vertical position from the top
         
        // if we've scrolled more than the navigation, change its position to fixed to stick to top,
        // otherwise change it back to relative
        if (scroll_top > sticky_navigation_offset_top) {
            $('#menu_arriba').css({ 'position': 'fixed', 'top':0, 'left':0 });
            $('#menu_abajo').css({ 'opacity': '1'});
        } else {
            $('#menu_arriba').css({ 'position': 'relative' });
            $('#menu_abajo').css({ 'opacity': '0.7'});

        }  
    };
     
    // run our function on load
    sticky_navigation();
     
    // and run it again every time you scroll
    $(window).scroll(function() {
         sticky_navigation();
    });


    //Twitter
    $(".tweet").tweet({
          join_text: "auto",
          username: "NBA",
          avatar_size: 48,
          count: 1,
          loading_text: "loading tweets..."
    });

    //Abrir y cerrar detalle
    $(".cierre").click(function () {
      $("#detalle").fadeOut("slow");
    });
    $(".abrir").click(function () {
      $("#detalle").fadeIn("slow");
    });

});


