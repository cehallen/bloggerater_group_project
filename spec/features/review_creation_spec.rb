require 'spec_helper'

feature 'user trying to make reviews on blog post', %q{
  As a registered user
  I can create a review for a for a blog website
  So people can see my opinion
  } do

  # AC:
  # I have to enter in a comment
  # I can see my reviews in the blog page

  before(:each) do
    @user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    within "#new_user" do
      click_on "Sign in"
    end
  end

  context 'filling out a review' do

    it 'successfully submits review when valid information entered' do
    end

    it 'gives errors if required fields are blank' do
    end
    
  end

  context 'printing out review within blog' do

    it 'shows up on blog show page when review submitted' do
    end

  end

end
