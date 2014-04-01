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

  context 'filling out blog form information' do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it 'requires a title' do
    end

    it 'requires a url' do
    end

    it 'can optionally have a description' do
    end

  end

  context 'printing out blog post' do

    it 'prints blog post information on index page after submission' do
    end

  end

end
