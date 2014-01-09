$(function() {
    var t = $("#nav-wrapper").position().top;

  $(window).scroll(function(){
      if($(this).scrollTop() > t)
      {
        $('#nav-wrapper').attr("style", "position: fixed;");
        $('#nav-wrapper').addClass("navbar-overlay")
      }
  });

  $(window).scroll(function(){
      if($(this).scrollTop() < t)
      {
          $('#nav-wrapper').attr("style", "position: relative;");
          $('#nav-wrapper').removeClass("navbar-overlay")
      }
  });
});