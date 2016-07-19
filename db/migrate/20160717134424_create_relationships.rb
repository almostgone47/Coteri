class CreateRelationships < ActiveRecord::Migration
  def change
  	# Creates a 'has_many :through' join model to store users' likes & dislikes.
    create_table :relationships do |t|
      # Creates liker & likee based on the User model
      # Liker/active user/follower; recipient user/passive user/target user/likee/followed/following
    	t.belongs_to :liker, class_name: 'User', null: false, index: true
    	t.belongs_to :likee, class_name: 'User', null: false, index: true
    	# Represents 'like' as 1 and 'dislike' as -1.
    	t.integer 'Relationship Type', null: false

      t.timestamps null: false	
    end

    # Liker/likee pairs must be unique, so a user can’t have more than 1 relationship with another user
    add_index :relationships, [:liker_id, :likee_id], unique: true
  end
end
