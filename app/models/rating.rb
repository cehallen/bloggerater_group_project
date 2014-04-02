class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: 'User'
  belongs_to :blog

  validates :blog, presence: true
  validates :rater, presence: true

  # validates :blog_id, uniqueness: true
  # validates :rater_id, uniqueness: true

  validates :blog_rating, presence: true, 
    numericality: {
      greater_than_or_equal_to: 1, 
      less_than_or_equal_to: 5
    }
end
