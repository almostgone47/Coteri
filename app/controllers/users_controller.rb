class UsersController < ApplicationController
	def index
		@users = User.all
		make_groups
	end

	def edit
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		flash[:message] = "User deleted"
		redirect_to users_path
	end

private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
