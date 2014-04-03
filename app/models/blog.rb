class Blog < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :user, presence: true

  belongs_to :user
  has_many :ratings
end
