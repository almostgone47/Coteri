class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def edit
	end

	def show
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		flash[:message] = "User deleted"
		redirect_to users_path
	end
end
