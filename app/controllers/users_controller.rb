class UsersController < ApplicationController
 def index
    @users = User.all
    current_user
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Signup complete!"
    else
      flash[:alert] = "Unsuccessful signup. Please try again."
    end

    redirect_to "/"
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @posts = User.find(params[:id]).posts
    current_user
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

end