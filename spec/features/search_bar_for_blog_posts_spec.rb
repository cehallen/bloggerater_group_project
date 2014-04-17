require 'spec_helper'

feature 'search bar for blogs', %q{
As site viewer
I want to be able to search for blogs
So I can find the ones I'm looking for
} do
# AC:
# A user must enter search criteria into the search field to filter data on those keywords
# They can search by title, description, url

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
    @blog = FactoryGirl.create(:blog)
  end

  context 'entering in search query' do

    it 'filters results based on searh criteria' do
      fill_in 'Query', with: "Moderation Pays Off for a Far-Right Party in France"
      click_on 'Search'
      expect(page).to have_content("Moderation Pays Off for a Far-Right Party in France")
      fill_in 'Query', with: "Garbage"
      click_on 'Search'
      expect(page).to_not have_content("Moderation Pays Off for a Far-Right Party in France")
      expect(page).to_not have_content("Garbage")
    end

  end

end
