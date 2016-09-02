//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

$('.carousel').carousel();

$(function () {
  $('#carousel-current-campaigns').carousel('pause');
  $('#carousel-past-campaigns').carousel('pause');
});


function flip() {
    $('.card').toggleClass('flipped');
}


$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
