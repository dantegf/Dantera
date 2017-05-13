//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){

  /* Browser always displays
     the top of the page */
  $('html, body').scrollTop(0);

  /* Burger menu */
  $(".burger-icon").click(function(){
    $(".burger-menu").slideToggle(250);
  });

});
