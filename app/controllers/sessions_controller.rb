class SessionsController < ApplicationController
 
 def new	
  end

  def create
  	@user = User.where(email: user_params[:email]).first

  	if @user && @user.password == user_params[:password]
  		session[:user_id] = @user.id
  		flash[:notice] = "Succesfully logged in"
    else
    	flash[:alert] = "Login failed, please try again"
    end

    redirect_to '/'
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/'
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

end
