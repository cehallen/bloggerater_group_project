require 'spec_helper'

feature 'authenticated user signing out', %q{
    As a signed in user
    I want to be able to sign out
    So I can safely end my session} do

  # AC:
  # The navbar has a sign out button and confirms successful sign out when clicked

  context 'signed in, want to sign out' do
    it 'should sign out the user' do
      visit users_path
    end
  end

  context 'signed out user' do



    it 'should prevent user from accessing creation pages' do
    end

    it 'should not allow user to rate' do
    end

    it 'should not allow user to vote' do
    end

  end

end
