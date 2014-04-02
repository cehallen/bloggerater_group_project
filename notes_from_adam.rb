

# in the controller
@blog = Blog.find(params[:id])
@rating = Rating.where(user: current_user, blog: @blog).first
if @rating.nil?
  @rating = Rating.new
end

# in the view
<%= simple_form_for [@blog, @rating] do |f| %>




