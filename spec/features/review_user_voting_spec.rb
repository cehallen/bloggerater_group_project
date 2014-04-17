require 'spec_helper'

feature 'user voting on review', %q{
  As a registered user
  I can create a vote for a blog review
  So people can see which reviews are the best
  } do
# AC:
# * I can enter in a vote
# * I can only have one vote per review, but I can change my vote
# * I can see my vote on the blog page
  
  before(:each) do
    sign_in_as(FactoryGirl.create(:user))
    @blog = FactoryGirl.create(:blog)
  end

  context 'User Voting on Reviews' do

    it 'restricts you from voting twice in the same direction' do
      visit blog_path(@blog)
      fill_in 'Review', with: 'Blurgz are great'
      click_on 'Create Review'
      click_on 'Like'
      expect(page).to have_content('1')
      click_on 'Like'
      expect(page).to have_content('1')
      click_on 'Dislike'
      expect(page).to have_content('-1')
      click_on 'Dislike'
      expect(page).to have_content('-1')
    end

  end

end
