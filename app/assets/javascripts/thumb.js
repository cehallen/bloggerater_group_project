$(function() {
  $('.thumb').click( function(e) {
    var thumbClick = $(e.target);
    var thumbType = thumbClick.attr('thumb_type');
    var reviewId = thumbClick.attr('data-review-id');
    var voteId = thumbClick.attr('data-vote-id');
    var blogId = thumbClick.attr('data-blog-id');
    var voteData = {
      review_id: reviewId,
      vote: thumbType
    };

    if ( voteId === '') {
      requestType = "POST";
      path = blogId + "/reviews/" + reviewId + "/votes";
    } else {
      requestType = "PUT";
      path = blogId + "/reviews/" + reviewId + "/votes/" + reviewId;
    }

    thumbSelector(thumbType, voteId);
    submitVote(requestType, path, voteData);
  });
});

var submitVote = function(requestType, path, data) {
  $.ajax(
  {
    type: requestType,
    url: path,
    data: {
      vote: data
    }
  });
};

var thumbSelector = function(thumb, voteId) {
  thumb_tag = $('#vote_' + voteId);
  if (thumb === 0) {
    thumb_tag.addClass('fa-thumbs-up');
    thumb_tag.removeClass('fa-thumbs-o-up');
  } else {
    thumb_tag.addClass('fa-thumbs-down');
    thumb_tag.removeClass('fa-thumbs-o-down');
  }
};
