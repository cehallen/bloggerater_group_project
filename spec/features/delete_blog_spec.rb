require 'spec_helper'

feature 'editing a blog post', %Q{
As an authenticated user
I can delete my post
} do 
# AC:
#  I have a delete button 
# It goes to post home page
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    within "#new_user" do
      click_on "Sign in"
    end 
    @blog = FactoryGirl.create(:blog)
  end

  context "deleting a page that has been posted" do
    it 'enables you to delete a post' do 
      visit blog_path(@blog)

      click_on 'Delete' 

      expect(page).to have_content("Deleted successfully")
      expect(page).to have_content("List of Blogs")
     
    end
  end
end
