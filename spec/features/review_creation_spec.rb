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
