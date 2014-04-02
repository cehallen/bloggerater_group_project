require 'spec_helper'

feature 'editing a blog post', %Q{
As an authenticated user
I can update my post
} do 
# AC:
# I have a edit button where it renders the new form. 
# It shows you have successfully updated you post
# It goes to post show page. 
  
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

  context "editing a page that has been posted" do
    it 'enables you to edit a post' do 
      visit blog_path(@blog)

      click_on 'Edit' 
      fill_in 'Blog Title', with: 'A title'
      fill_in 'Site URL', with: 'www.blogs.com'

      click_on 'Update Blog'

      expect(page).to have_content("Updated successfully")
      expect(page).to have_content("A title")
     
    end
  end
end
