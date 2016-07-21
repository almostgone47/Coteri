class ChangeDefaultDatesInRelationships < ActiveRecord::Migration
  def change
  	# Added default times to the created_at & updated_at column so you can easily add relationship rows without null constraints
  	change_column :relationships, :created_at , :datetime, default: DateTime.now
  	change_column :relationships, :updated_at , :datetime, default: DateTime.now
  end
end
