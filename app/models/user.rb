class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
  roles = %w(admin user)
  validates :role, presence: true, inclusion: {in: roles, message: "must be an admin or a user"}

  has_many :votes
  has_many :reviews
=======
  has_many :blogs

  ROLES = %w(admin user)

  validates :role, presence: true, inclusion:
    {in: ROLES, message: "must be an admin or a user"}
>>>>>>> 33f3998dad019bcb02d0b027b32146ae6c9ee869
end
