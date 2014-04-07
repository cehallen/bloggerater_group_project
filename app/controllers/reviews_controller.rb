class ReviewsController < ApplicationController
  # def show
  #   @blog = Blog.find(params[:blog_id])
  #   @review = Review.new
  # end

  def create
    @blog = Blog.find(params[:blog_id])
    @review = current_user.reviews.build(review_params)
    @review.blog = @blog

    if @review.save
      redirect_to @blog
      flash[:notice] = "Review Submitted"
    else
      redirect_to '/'
      flash[:notice] = "Review Submission Failed"
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_id, :comment, :blog)
  end
end
