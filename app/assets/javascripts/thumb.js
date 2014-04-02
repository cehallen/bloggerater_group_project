$(function() {
  $('.thumb').click( function(event) {
    var thumbClick = $(event.target);
    var userId = thumbClick.attr('data-user-id');
    var reviewId = thumbClick.attr('data-review-id')
    var thumbType = thumbClick.attr('thumb-type')

  });

});
