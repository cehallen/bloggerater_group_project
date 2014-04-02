require 'spec_helper'

feature 'viewing a blog', %Q{
  As a viewer (auth or not)
  I want to view the blogs on their native pages
  So I can see if I like it for my rating decision
} do

  # AC:
  # When you click on the blog title from the blog index you'll
  # be externally routed to that blog's url.
  
  before(:each) do
    @blog = FactoryGirl.create(:blog)
  end

  context "going from index to viewing blogs page" do
    it "shows the title and title is also a link, and shows description if present" do
      visit blogs_path

      click_on 'Moderation Pays Off for a Far-Right Party in France'

      expect(page).to have_content("Moderation Pays Off for a Far-Right Party in France")
      expect(page).to have_css('a[href = "http://www.nytimes.com/2014/04/02/world/europe/moderation-pays-off-for-a-far-right-party-in-france.html?hp&_r=0"]')      #   href: "http://www.nytimes.com/2014/04/02/world/europe/moderation-pays-off-for-a-far-right-party-in-france.html?hp&_r=0")
    end
  end

end


