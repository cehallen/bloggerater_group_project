class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(created_at: :desc).page params[:page]
    @reviews = Review.order(created_at: :desc).limit(15)
    render layout: false
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    if @blog.save
      redirect_to blogs_path, 
        notice: 'Blog Added to Listing'
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id]) 
    @user = current_user
    @rating = Rating.where(rater_id: @user, blog: @blog).first
    if @rating.nil?
      @rating = Rating.new
    end
    @reviews = @blog.reviews
    @review = Review.new
    @vote = Vote.new
  end

  def edit 
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path(@blog), 
        notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, 
        notice: 'Deleted successfully' }
      format.json { head :no_content }
    end
  end

  def search
    query = "%#{params[:Query]}%"
    @blogs = Blog.where('title like :match or description like :match or url like :match', match: query)
  end

  private

  def blog_params
    params.require(:blog)
      .permit(:title, :description, :url, :image_url)
  end
end
