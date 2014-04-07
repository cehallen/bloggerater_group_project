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
    end

    context 'uploading a picture' do 

      it 'successfuly uploads a picture' do 
      end

      it 'successfuly displays a picture' do
      end

    end

  end
