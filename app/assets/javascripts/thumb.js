$(function() {
  $('.thumb').click( function(event) {
    var thumbClick = $(event.target);
    var voteId = thumbClick.attr('data-vote-id');
    var reviewId = thumbClick.attr('data-review-id');
    var thumbType = thumbClick.attr('thumb-type');
    var votingData = {
      review_id: reviewId,
      vote: thumbType
    };

    if ( userId === '') {
      requestType = "POST";
      path = "reviews/" + reviewId + "/votes";
    } else {
      requestType = "PUT";
      path = "reviews/" + reviewId + "/votes/" + voteId;
    }

    thumbSelector(thumbType, reviewId);
    submitVote(requestType, path, votingData);
  });
});

var submitVote = function(requestType, path, data) {
  $.ajax(
  {
    type: requestType,
    url: path,
    data: {
      voting: data
    }
  });
};

var thumbDirection = function(thumb, reviewId) {
  if (thumb === true) {
    thumb.addClass('fa-thumbs-up');
  } else {
    thumb.addClass('fa-thumbs-down');
  }
};
