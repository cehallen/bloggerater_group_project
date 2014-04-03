class VotesController < ApplicationController
 

  def create
    @blog = Blog.find(params[:blog_id])
    @review = Review.find(params[:review_id])
    @vote = current_user.votes.build(vote_params)
    @vote.review = @review

    respond_to do |format|
      if @vote.save
        format.json { render json: @vote, status: created }
        redirect_to @blog
      else
        redirect_to '/'
        puts 'epic fail'
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:vote, :blog_id, :review_id)
  end
end 
