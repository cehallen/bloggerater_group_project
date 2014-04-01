class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  roles = %w(admin user)
  validates :role, presence: true, inclusion: {in: roles, message: "must be an admin or a user"}

  has_many :votes
  has_many :reviews
end
