module ThumbsHelper

  def thumb(user, review, thumb_type)
    user_vote = review.votes.where(user: user).take || ''

    if user_vote.blank?
      user_vote_id = ''
    else
      user_vote_id = user_vote.id 
    end
    vote_id = "vote_#{review.id}"
      
    # var voteId = thumbClick.attr('data-vote-id');
    # var reviewId = thumbClick.attr('data-review-id');
    # var thumbType = thumbClick.attr('thumb-type');
    
    if user_vote.blank? && thumb_type = 0
      thumb_class_up = 'fa fa-thumbs-o-up thumb'
    else
      thumb_class_up = 'fa fa-thumbs-up thumb'
    end

    if user_vote.blank? && thumb_type = 1
      thumb_class_down = 'fa fa-thumbs-o-down thumb'
    else
      thumb_class_down = 'fa fa-thumbs-down thumb'  
    end

    content_tag(:a, "",
    class: thumb_class_up,
    id: vote_id,
    thumb_type: thumb_type,
    data: {
      review_id: review.id,
      vote_id: user_vote_id,
      blog_id: review.blog_id
      }
    )

  end

end
