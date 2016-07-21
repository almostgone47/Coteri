class RelationshipsController < ApplicationController
	def create
		relationship = Relationship.where(liker_id: current_user.id, likee_id: params[:likee_id])
		relationship.destroy_all
		@relationship = Relationship.new(
			liker_id: current_user.id,
			likee_id: params[:likee_id],
			relation_type: params[:relation_type])
		@relationship.save
		redirect_to users_path
	end

	def destroy
	end
end
