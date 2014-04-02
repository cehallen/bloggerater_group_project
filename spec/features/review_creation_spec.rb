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
    sign_in_as(FactoryGirl.create(:user))
    @blog = FactoryGirl.create(:blog)
  end

  context 'filling out a review' do

    it 'successfully submits review when valid information entered' do
      visit blog_path(@blog)
      fill_in'Review', with: 'I hate the world'
      click_on 'Create Review'
      expect(page).to have_content("I hate the world")
    end

    it 'gives errors if required fields are blank' do
      visit blog_path(@blog)
      fill_in'Review', with: ''
      click_on 'Create Review'
    end
    
  end

end
