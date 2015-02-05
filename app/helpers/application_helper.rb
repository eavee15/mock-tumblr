module ApplicationHelper
	def current_user
		session[:user_id] ? User.find(session[:user_id]) : nil
	end
	def current_post
  	 params[:id] ? Post.find(params[:id]) : nil
  	end
end
