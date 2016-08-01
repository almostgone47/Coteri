module ApplicationHelper
	
	def profile_avatar_select(user)  
		return image_tag user.avatar.url(:medium),
			id: 'image-preview',
			class: 'profile-image image-circle' if user.avatar.exists?
		image_tag 'default-avatar.jpg',
			id: 'image-preview',
			class: 'profile-image image-circle'
	end  
end
