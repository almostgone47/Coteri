class CreateRelationships < ActiveRecord::Migration
  def change
  	# Creates a 'has_many :through' join model to store users' likes & dislikes.
    create_table :relationships do |t|
    	t.belongs_to :user, index: true
    	# Gives 'User'
    	t.belongs_to :recipient, class_name: 'User', index: true
    	# Shows whether 'like' (1) or 'dislike' (-1) the recipient.
    	t.integer 'Relationship Type', null: false

      t.timestamps null: false
    end

    # Ensures only no multiple relationships between liker & likee.
    add_index :relationships, [:user, :likee], uniqueness: true
  end
end
