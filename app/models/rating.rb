class Rating < ActiveRecord::Base
  belongs_to :blog
  belongs_to :rater, class_name: 'User'

  validates :rater, presence: true
  validates :blog, presence: true
  validates :rating, presence: true
end
