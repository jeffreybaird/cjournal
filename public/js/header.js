var t = $("#nav-wrapper").position().top;

$(document).scroll(function(){
    if($(this).scrollTop() > t)
    {
        $('#make-fixed').addClass(".pure-menu-fixed");
    }
});