class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def make_groups
	# run algo on relationships to get groups.
	@user_ids_array = []
	User.all.each do |i|
		@user_ids_array << i.id
	end
	@user_ids_combinations = @user_ids_array.combination(6).to_a
end
helper_method :make_groups	

 def match_users #(p1, p2)
    # search p1 and see if relatoion to p2 is 1
    # search p2 and see if relation to p1 is 1
    # if both are true, return true
  end

  def matches_for_me #(p1)
    # search all users that are relation 1 to p1
    # query all users and find if reciprocates
    # if reciprocation, return user.id
  end
end
