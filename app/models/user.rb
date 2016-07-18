class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable,
				 # Non-default devise modules to email confirmation, lock after multiple login attempts, & oAuth.
				 :confirmable, :lockable, :omniauthable

	has_many :relationships
	has_many :recipients, through: :relationships
end