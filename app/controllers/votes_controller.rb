class VotesController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    vote = review.votes.build(vote_params)
    vote.user = current_user

    if vote.save
      flash[:notice] = 'Successfully voted.'      
    else
      flash[:notice] = 'Failed to save vote.'
    end

    respond_to do |format|
      format.json { render json: { score: review.score } }
      format.html { redirect_to blog_path(review.blog) }  
    end
  end

  def update
    review = Review.find(params[:review_id])
    vote = current_user.votes.find(params[:id])

    if vote.update(vote_params)
      flash[:notice] = 'Successfully voted.'      
    else
      flash[:notice] = 'Failed to save vote.'
    end

    respond_to do |format|
      format.json { render json: { score: review.score } }
      format.html { redirect_to blog_path(review.blog) }  
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:vote)
  end
end 
