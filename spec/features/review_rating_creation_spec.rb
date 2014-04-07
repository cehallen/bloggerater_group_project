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
# Where is the test for the score method you wrote?

  before(:each) do
    sign_in_as(FactoryGirl.create(:user))
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
      click_on "Up"
      expect(@review.votes.count).to eq(1)
    end

  end

end
