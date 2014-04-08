module Admin
  class ReviewsController < ApplicationController
    before_action :authorized_user

    def show
      @review = Review.find(params[:id])
    end

    def index
      @reviews = Review.order(created_at: :desc)
    end

     def destroy
        @review = Review.find(params[:id])
        @review.destroy
        respond_to do |format|
          format.html { redirect_to admin_reviews_url, 
            notice: 'Deleted successfully' }
          format.json { head :no_content }
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
