class Blog < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validates :user, presence: true

  belongs_to :user
end
