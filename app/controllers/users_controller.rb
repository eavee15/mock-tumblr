class UsersController < ApplicationController
 def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      @follow = Follower.new(follower_id: @user.id, leader_id: @user.id)
      @follow.save
      session[:user_id] = @user.id
      redirect_to "/home/#{@user.id}/dash"
    else 
      flash[:alert] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    current_user
    @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.where(user_id: params[:id])
    @follow = Follower.where(follower_id: @current_user.id, leader_id: params[:id]).first
    @followers = @user.followers.all.order(:username)
    flash[:delete] = "post deleted"
  end

  def edit
    current_user
    @user = User.find(params[:id])
  end

  def update
    current_user
    @user = User.find(params[:id])
    if @current_user.id == @user.id
      @user.update(user_params)
      flash[:notice] = "updates saved!"
    else
      flash[:alert] = "updates not saved; please try again."
    end
    redirect_to :back
  end

  def destroy
    current_user
    @user = User.find(params[:id])
    if @current_user.id == @user.id
      @user.destroy
    else
      flash[:alert] = "you are not given permission to destroy this user."
      redirect_to :back
    end
    redirect_to '/'
  end

  private

  
  def user_params
    params.require(:user).permit(:email, :password, :username, :title, :aboutme)
  end

end
