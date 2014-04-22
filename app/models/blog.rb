class Blog < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :user, presence: true
  validates :image_url, presence: true

  belongs_to :user
  has_many :ratings
  has_many :reviews
  mount_uploader :image_url, ImageUploader
  paginates_per 5
end
