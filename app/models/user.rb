class User < ActiveRecord::Base
  after_create :register
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :reviews, foreign_key: :reviewer_id
  has_many :blogs

  ROLES = %w(admin user)

  validates :role, presence: true, inclusion:
    {in: ROLES, message: "must be an admin or a user"}

  def register
    if save 
      RegistrationConfirmation.receipt(self).deliver
      return true
    end
  end

end
