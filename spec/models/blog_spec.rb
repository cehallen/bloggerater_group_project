require 'spec_helper'

describe Blog do

  describe "Validation Tests" do

    it { should have_valid(:title).when("Interesting post") }
    it { should_not have_valid(:title).when(nil, "") }

    it { should have_valid(:url).when("www.google.com") }
    it { should_not have_valid(:url).when(nil, "") }

    it { should have_valid(:user).when(User.new) }
    it { should_not have_valid(:user).when(nil) }

    it 'give an error when url is not unique' do
      blog = Blog.create!(url: "www.url.com", title: "title", user: FactoryGirl.build(:user))
    end

  end

  describe "Association Tests" do

    it { should belong_to :user }
    it { should have_many :reviews }
    
  end


end
