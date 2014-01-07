$(function() {
    var t = $("#nav-wrapper").position().top;

  $(window).scroll(function(){
      if($(this).scrollTop() > t)
      {
          $('#make-fixed').addClass("pure-menu-fixed");
      }
  });
});