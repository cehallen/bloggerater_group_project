require 'spec_helper'

feature 'user creates a new blog post', %q{
  As a registered user
  I can create a post for a blog website
  So people can review, rate, and vote on it
  } do

  # AC:
  # I have to enter in a email
  # I have to enter in a password
  # What happens when you're not signed in?
  # describe AuthenticationHelpers do
  #   describe "#sign_in_as(user)" do
  # include AuthenticationHelpers::sign_in_as(user)
  before(:each) do
    sign_in_as(FactoryGirl.create(:user))
  end
  context 'when given valid attributes' do

    it 'allows signed in user to post a blog if required attributes given' do
      visit new_blog_path
      fill_in 'blog[title]', with: 'A title'
      fill_in 'blog[url]', with: 'www.blogs.com'
      click_on 'Create Blog'
      expect(page).to have_content('Blog Added to Listing')
    end
  end

  context "when given invalid information" do 
    it 'gives errors if required fields are missing' do
      visit new_blog_path
      click_on 'Create Blog'
      expect(page).to_not have_content("Blog Added to Listing")
    end
  end

  context 'printing out blog post' do

    it 'prints blog post information on index page after submission' do
      visit new_blog_path
      fill_in 'blog[title]', with: 'A title'
      fill_in 'blog[url]', with: 'www.blogs.com'
      click_on 'Create Blog'
      expect(page).to have_content('Blog Added to Listing')
      expect(page).to have_content('List of Blogs')
      expect(page).to have_content('A title')
    end

  end

end
