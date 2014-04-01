class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :blogs
  ROLES = %w(admin user)
  validates :role, presence: true, inclusion: {in: ROLES, message: "must be an admin or a user"}
end
