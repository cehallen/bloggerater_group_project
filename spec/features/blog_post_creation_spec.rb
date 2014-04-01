require 'spec_helper'

feature 'user trying to make blog post', %q{
  As a registered user
  I can create a post for a blog website
  So people can review, rate, and vote on it
  } do

  # AC:
  # I have to enter in a email
  # I have to enter in a password
  # What happens when you're not signed in?
  before(:each) do
    @user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    within "#new_user" do
      click_on "Sign in"
    end
  end

  context 'filling out blog form information' do

    it 'allows signed in user to post a blog if required attributes given' do
      visit new_blog_path
      fill_in 'blog[title]', with: 'A title'
      fill_in 'blog[url]', with: 'www.blogs.com'

      click_on 'Create Blog'

      expect(page).to have_content('Blog Added to Listing')


    end

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
