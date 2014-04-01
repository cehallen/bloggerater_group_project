require 'spec_helper'

require 'spec_helper'

feature 'user trying to make ratings on blog post', %q{
  As a registered user
  I can create a rating for a for a blog website
  So people can see my opinion
  } do

  # AC:
  # I have to enter in a rating
  # I can only have one rating per blog post, but I can change my rating
  # I can see my rating in the blog page

  before(:each) do
    @user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    within "#new_user" do
      click_on "Sign in"
    end
  end

  context 'filling out a rating' do

    it 'successfully submits rating when valid information entered' do
    end

    it 'gives errors if required fields are blank' do
    end

    it 'allows me to change my rating' do
    end
    
  end

  context 'printing out rating within blog' do

    it 'shows up on blog show page when rating submitted' do
    end

  end

end
