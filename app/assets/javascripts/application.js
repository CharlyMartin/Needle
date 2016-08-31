//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

$('.carousel').carousel()

function flip() {
    $('.card').toggleClass('flipped');
}


$('button').on('click', function() {
    whichtab = $(this).data('opentab');
    $('#myModal').modal('show');
    $('.nav-tabs li:eq('+whichtab+') a').tab('show');
});
