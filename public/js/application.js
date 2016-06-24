$(document).ready(function() {

  $('.collection-of-answers').on('submit', '.inline',function(e){
    e.preventDefault();
    $.ajax({
      url: $(e.target).attr('action'),
      method: $(e.target).attr('method')
    })
    .done(function(response){
      debugger
      $(e.target).parent().parent().find('.vote-count').text(response["vote"])
    })
  })



  $('.answer-form form').on('submit', function(e){
    e.preventDefault();
    // debugger
    $.ajax({
      url: $(e.target).attr('action'),
      method: $(e.target).attr('method'),
      data: $(e.target).serialize()
    })
    .done(function(response){
      debugger
      $('.collection-of-answers').append(response)
    })
  })
});
