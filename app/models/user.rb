class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable,
				 # Non-default devise modules to email confirmation, lock after multiple login attempts, & oAuth
				 :confirmable, :lockable, :omniauthable

	# Associates this user many relationships with users they like (likees) & their likers.
	has_many :likee_relationships, class_name: 'Relationship', dependent: :destroy
	has_many :liker_relationships, class_name: 'Relationship', dependent: :destroy
	# Associates this user with likees (whom this user liked/dislike) & likers (who liked/disliked this user) through the relationships above.
	has_many :likees, through: :likee_relationships, source: :likees
	has_many :likers, through: :liker_relationships, source: :liker 
	# :source key isn't really needed since the :likers/:likees attribute are the plurals of :liker/:likee. Added for clarity.
end