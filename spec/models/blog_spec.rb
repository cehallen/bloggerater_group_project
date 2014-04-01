require 'spec_helper'

describe Blog do

  describe "Validation Tests" do
    it { should have_valid(:title).when("Interesting post") }
    it { should_not have_valid(:title).when(nil, "") }

    it { should have_valid(:url).when("www.google.com") }
    it { should_not have_valid(:url).when(nil, "") }

    it { should have_valid(:user).when(User.new) }
    it { should_not have_valid(:user).when(nil) }

    # it 'requires a uer' do
    #   blog = Blog.new
    #   blog.user = User.new
    #   blog.valid?

    #   expect(blog.errors[:user]).not_to include "can't be blank"
    # end
  end

  describe "Association Tests" do
    it { should belong_to :user }
  end


end
