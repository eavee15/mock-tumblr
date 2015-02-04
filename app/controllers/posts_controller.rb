class PostsController < ApplicationController
before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @post = Post.all
    
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post, notice: "Posted!"
  end

  def update
    @post = Post.create(post_params)
  end

  def destroy
  end
  private

   def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end

end