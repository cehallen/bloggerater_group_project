require 'spec_helper'

describe Vote do

  describe 'validations' do

    it { should have_valid(:vote).when(true) }
    it { should have_valid(:vote).when(false) }
    it { should_not have_valid(:vote).when(nil) }  

    it { should have_valid(:user).when(User.new)}
    it { should_not have_valid(:user).when(nil)}

    it { should have_valid(:review).when(Review.new)}
    it { should_not have_valid(:review).when(nil)}
    
  end

  describe 'associations' do

    it { should belong_to :review }
    it { should belong_to :user }

  end

end
