require 'spec_helper'

feature 'admin can destroy blogs', %q{
  As an admin,
  I can sign up as an admin
  So I can destroy blog} do

  # I must log in as an admin
  # I I can view all the blogs
  # I can delete blogs
  before(:each) do
    sign_in_as(FactoryGirl.create(:user, role: 'admin'))
    @blog = FactoryGirl.create(:blog)
  end
  context 'admin views admin blog index' do

    it 'shows all users blog post' do 
      visit  admin_blogs_path
      expect(page).to have_content("List of Blogs")
    end
    it 'allows admin to destroy blogs' do 
      prev_count = Blog.count
      visit admin_blog_path(@blog)
      click_on 'Delete'
      expect(page).to have_content("Deleted successfully")
      expect(page).to have_content("List of Blogs")
      expect(Blog.count).to eq(prev_count-1)

    end

   end

end
