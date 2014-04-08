require 'spec_helper'

feature 'user trying to post avater picture', %q{
  As a registered user
  I can post a picture as an avatar
  Others can view my avatar
  } do

  # AC:
  # I have to upload a picture 
  # I can see your picture

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
      visit new_blog_path
    end

    context 'uploading a picture' do 

      it 'successfuly uploads a picture' do 
        fill_in 'blog[title]', with: 'A title'
        fill_in 'blog[url]', with: 'www.blogs.com'
        attach_file 'blog[image_url]', Rails.root.join('spec/files/balloon.jpg')
        click_on 'Create Blog'
        expect(@user.blogs.last.image_url).to be_present
      end

    end

  end
