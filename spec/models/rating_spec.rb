require 'spec_helper'

describe Rating do

  describe 'Validations' do

    it { should have_valid(:rating).when(1)}
    it { should_not have_valid(:rating).when(nil, '')}

  end

  describe 'Associations' do

    it { should have_valid(:rater).when(User.new)}
    it { should_not have_valid(:rater).when(nil)}

    it { should have_valid(:blog).when(Blog.new)}
    it { should_not have_valid(:blog).when(nil)}

  end

end
