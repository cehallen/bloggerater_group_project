require 'spec_helper'

feature 'user trying to make ratings on blog post', %q{
  As a registered user
  I can create a rating for a blog website
  So people can see my opinion
  } do

  # AC:
  # * I can enter in a rating
  # * I can only have one rating per blog post, but I can change my rating
  # * I can see my rating on the blog page

  before(:each) do
    # @user = FactoryGirl.create(:user)
    @blog = FactoryGirl.create(:blog)
    @user = @blog.user
    sign_in_as(@user)
    visit blog_path(@blog)
  end

  context 'filling out a rating' do
    it 'successfully submits rating when valid information entered' do
      select '4', from: 'Rating'
      click_on 'Submit Rating'
      expect(page).to have_content('Rating received')
      expect(@blog.ratings.count).to eq(1)
      save_and_open_page
    end

    # it 'gives errors if required fields are blank' do
    #   click_on 'Rate This Blog'
    #   expect(page).to have_content('Please select a rating')
    # end

    # it 'allows me to change my rating' do
    #   prev_rating_count = @blog.ratings.count
    #   select '4', from: 'Rating' 
    #   click_on 'Rate This Blog'
    #   expect(page).to have_content('Rating created')
    #   expect(@blog.ratings.count).to eq(prev_rating_count)
    # end
    
  end

  context 'display rating within blog after rating' do

    # it 'shows up on blog show page when rating submitted' do
    #   select '4', from: 'Rating' 
    #   click_on 'Rate This Blog'
    #   expect(page).to have_content('Rating created')
    #   within(:css, '#user_rating') do
    #     expect(page).to have_content('4')
    #   end
    # end

  end

end
