$(document).on('turbolinks:load', function() {

  $('#the-button').on('click', function(e){
    e.preventDefault();
    febreze_light();
  })

});
