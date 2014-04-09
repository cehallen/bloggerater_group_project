require 'spec_helper'

feature 'pagination of blogs listing', %q{
As a viewer of the lists of postings
I want to see the posted bogs in sets of 10 on the page (or 20, whatever)
So the page doesn't have to load too much info at a time
} do
# AC:
# When a user views the home page the listings are paginated, and can click to "see next X listings"

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
    FactoryGirl.create(:blog, title: "Da Blurg")
    4.times do 
      FactoryGirl.create(:blog)
    end
  end
  context 'pagination' do

    it 'only displays 5 blogs postings a page' do
      visit '/'
      expect(page).to have_content("Da Blurg")
      FactoryGirl.create(:blog)
      visit '/'
      expect(page).to_not have_content("Da Blurg")
      save_and_open_page
    end

  end

end
