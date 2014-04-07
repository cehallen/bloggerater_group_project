class RatingsController < ApplicationController
  def create
    @rater = current_user
    @blog = Blog.find(params[:blog_id])
    @rating = Rating.new(params.require(:rating)
      .permit(:blog_rating))
    @rating.blog = @blog
    @rating.rater = @rater
    if @rating.save
      redirect_to blog_path(@blog), 
        notice: 'Rating received'
    else
      redirect_to blog_path(@blog), 
        notice: 'Please select a rating'
    end
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @rating = Rating.find(params[:id])
    @rating.blog = @blog
    if @rating.update(params.require(:rating)
      .permit(:blog_rating))
      redirect_to blog_path(@blog),
        notice: 'Rating received'
    else
      redirect_to blog_path(@blog),
        notice: 'Please select a rating'
    end
  end
end