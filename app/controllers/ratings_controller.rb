class RatingsController < ApplicationController

  def create
    @rating = Rating.new()
      # rater_id: current_user.id, blog_id: params[:blog_id], 
      # blog_rating: params[:rating][:blog_rating])
    if @rating.save
      redirect_to blogs_path, notice: 'Rating created'
    else

    end
  end



  private

  def rating_params
    params.require(:rating).permit(:blog_id, :blog_rating) #????
  end
end