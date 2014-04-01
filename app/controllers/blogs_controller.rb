class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    # @user = current_user
    # @blog = Blog.new(blog_params)
    # @user.blogs << @blog
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    if @blog.save
      redirect_to blogs_path, notice: 'Blog Added to Listing'
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :url)
  end
end
