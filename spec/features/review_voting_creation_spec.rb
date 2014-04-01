require 'spec_helper'

feature %q{As an authenticated user,
I can upvote and downvote reviews,
So people can read the best reviews} do 

# AC:
# A user can upvote 
# A user can downvote
# A user can reverse their vote
# A user may only vote on a review once
# Seperate: Sorting Reviews
  before(:each) do
    @user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    within "#new_user" do
      click_on "Sign in"
    end
  end

  context 'authenticated user voting' do

    it 'allows user to vote' do
      click_on "Up"
      expect(page).to have_content("Up Voted")
    end

    it 'allows user to reverse vote' do
      click_on "Up"
      expect(page).to have_content("Up Voted")
      click_on "Down"
      expect(page).to have_content("Down Voted")
    end

    it 'prevents user from voting more than once' do
      click_on "Up"
      expect(@review.votes).to eq(true)
    end

  end

end
