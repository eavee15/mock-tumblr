class HomeController < ApplicationController
   def dashboard
    @posts = Post.all
    
    if current_user
        render :dashboard
    else
        render :signin
    end

  end

  def signin
  end
end
