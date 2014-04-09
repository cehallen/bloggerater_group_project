module Admin
  class BlogsController < ApplicationController

    before_action :authorize_user
    def index
      @blogs = Blog.order(created_at: :desc)
    end

    def show
      @blog = Blog.find(params[:id])
    end

    def destroy
      @blog = Blog.find(params[:id])
      @blog.destroy
      respond_to do |format|
        format.html { redirect_to admin_blogs_url, 
          notice: 'Deleted successfully' }
      end
    end

    protected

    def authorized_user
      unless user_signed_in? and current_user.is_admin?
        raise ApplicationController::RoutingError.new('Not Found')
      end
    end
  end
end
