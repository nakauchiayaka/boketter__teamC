$(function() {
  $("#scroll-top-button").on("click", function() {
    $('html, body').animate({scrollTop:$('#top-bar')});
  });
});
