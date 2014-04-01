require 'spec_helper'

describe Review do

  describe 'Validations' do

    it { should have_valid(:comment).when('hi I love all da blurgz')}
    it { should_not have_valid(:comment).when(nil, '')}

  end

  describe 'Associations' do

    it { should have_valid(:reviewer).when(User.new)}
    it { should_not have_valid(:reviewer).when(nil)}

    it { should have_valid(:blog).when(Blog.new)}
    it { should_not have_valid(:blog).when(nil)}

  end

end
