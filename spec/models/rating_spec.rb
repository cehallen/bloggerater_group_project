require 'spec_helper'

describe Rating do
  context 'validations' do
    it { should validate_presence_of :rater }
    it { should validate_presence_of :blog }

    it { should have_valid(:blog_rating).when(1, 2, 3, 4, 5) }  # how do we make this a range?
    it { should_not have_valid(:blog_rating).when('', nil, 'a', 90) }
  end

  context 'associations' do
    it { should belong_to :rater }
    it { should belong_to :blog }
  end

  # context 'uniqueness' do
  #   it { should validate_uniqueness_of(:rater_id) }
  #   it { should validate_uniqueness_of(:blog_id) }
  # end
end
