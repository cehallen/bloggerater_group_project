class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :vote, inclusion: {in: [true, false]}
  validates :review, presence: true, uniqueness: {scope: :user, message: "Can only have one vote"}
  validates :user, presence: true
end
