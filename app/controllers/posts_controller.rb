class PostsController < ApplicationController
before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    if current_user
     @post = Post.new
    else
      flash[:notice] = "Please sign in first."
      redirect_to signin_path
    end
  end

  def edit
  end

  def show
    @comment = Comment.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post, notice: "New post created."
  end

  def update
    @post.update(post_params)
    redirect_to @post, notice: "Post succesfully updated."
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end

end