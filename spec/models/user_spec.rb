require 'spec_helper'

describe User do

  describe 'Associations' do

    it { should have_many :reviews }
    it { should have_many :blogs }

  end

end
