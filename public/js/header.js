$(function() {
    var t = $("#nav-wrapper").position().top;

  $(window).scroll(function(){
      if($(this).scrollTop() > t)
      {
        $('#nav-wrapper').attr("style", "position: fixed;");
        $('#nav-wrapper').addClass("navbar-overlay");
        $('#mutable-content-area').addClass('move-content');
        $('#social-id').addClass('move-content')
      }
  });

  $(window).scroll(function(){
      if($(this).scrollTop() < t)
      {
          $('#nav-wrapper').attr("style", "position: relative;");
          $('#nav-wrapper').removeClass("navbar-overlay");
          $('#mutable-content-area').removeClass('move-content');
          $('#social-id').removeClass('move-content')
      }
  });
});