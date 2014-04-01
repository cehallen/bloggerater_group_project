class Review < ActiveRecord::Base
  has_many :votes
  belongs_to :reviewer, class_name: 'User'
  belongs_to :blog

  validates :comment, presence: true
  validates :reviewer, presence: true
  validates :blog, presence: true 
end
