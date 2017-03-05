$(document).on('turbolinks:load', function() {

  $('#the-button').on('click', function(e){
    e.preventDefault();
    console.log("JS working");
  })

});
