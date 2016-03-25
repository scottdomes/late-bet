$(document).ready(function() {

  $('.success').delay(2000).fadeOut();

  $('#add-goal-heading').click(function () {
    $('#custom-goal').toggleClass("expanded");
  })
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
