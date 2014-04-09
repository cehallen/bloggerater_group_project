require 'spec_helper'

feature 'viewing a blog', %Q{
  As a viewer (auth or not)
  I want to view the blogs on their show pages
  So I can see if I like it for my rating and voting decision
} do

  # AC:
  # When you click on the blog title from the blog index you'll
  # be shown more info on the blog's show page.
  
  before(:each) do
    sign_in_as(FactoryGirl.create(:user))
    @blog = FactoryGirl.create(:blog)
  end

  context "going from index to viewing blogs page" do
    it "shows title and shows description if present" do
      visit blogs_path
      click_on 'Moderation Pays Off for a Far-Right Party in France'

      expect(page).to have_content("Moderation Pays Off for a Far-Right Party in France")
      expect(page).to have_content("http://www.nytimes.com/2014/04/02/world/europe/moderation-pays-off-for-a-far-right-party-in-france.html?hp&_r=0")  
    end
  end

end


