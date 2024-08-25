class User < ApplicationRecord
	has_many :orders, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,
    email: true,
    presence: true,
    uniqueness: { case_insensitive: true }
end
