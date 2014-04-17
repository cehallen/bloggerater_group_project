require 'spec_helper'

feature 'admin can destroy reviews', %q{
  As an admin,
  I can sign up as an admin
  So I can destroy a review} do

  # I must log in as an admin
  # I I can view all the reviews
  # I can delete reviews
  before(:each) do
    sign_in_as(FactoryGirl.create(:user, role: 'admin'))
    @reviewer = FactoryGirl.create(:user)
    @review = FactoryGirl.create(:review, reviewer: @reviewer)
  end
  context 'admin views admin review index' do

    it 'shows all users review post' do 
      visit  admin_reviews_path
      expect(page).to have_content("List of Reviews")
    end
    it 'allows admin to destroy reviews' do 
      prev_count = Review.count
      visit admin_review_path(@review)
      click_on 'Delete'
      expect(page).to have_content("Deleted successfully")
      expect(page).to have_content("List of Reviews")
      expect(Review.count).to eq(prev_count-1)

    end

   end

end
