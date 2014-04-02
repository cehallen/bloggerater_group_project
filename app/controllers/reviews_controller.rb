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
    else
      redirect_to '/'
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_id, :comment, :blog)
  end
end
