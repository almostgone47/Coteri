class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable,
				 # Non-default devise modules to email confirmation, lock after multiple login attempts, & oAuth
				 :confirmable, :lockable, :omniauthable

	# Associates this user many relationships with their likers & users they like (likees).
	has_many :liker_relationships, class_name: 'Relationship', dependent: :destroy
	has_many :likee_relationships, class_name: 'Relationship', dependent: :destroy
	# Associates this user with many likers (who liked/disliked this user) & likee (whom this user liked/dislike) through the relationships above.
	has_many :likers, through: :liker_relationships, source: :liker 
	has_many :likees, through: :likee_relationships, source: :likees
	# :source key isn't really needed since the :likers/:likees attribute are the plurals of :liker/:likee. Added for clarity.

end