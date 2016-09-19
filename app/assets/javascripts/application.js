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


// Update 7/7/14 - Looks like replacing the span with pseudo elements is out. No pseudo-elements on inputs and no parent selector

// Update 7/11/14 - Added jQuery to add a class to inputs after they have a value to keep labels up even with invalid values (this and its corresponding scss are commented out)

/*

// Keep a label up even with invalid value
$( 'input' ).on( 'blur', function() {

  var $this = $( this );

  if ( $this.val() !== "" ) {

    $this.addClass( 'not-empty' );

  } else {

    $this.removeClass( 'not-empty' );

  }

} );

*/
